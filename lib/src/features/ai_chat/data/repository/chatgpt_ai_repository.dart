import 'package:aichat/src/exceptions/models/common_error.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_chat_settings.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/ai_repository.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/assistant_storage.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class ChatGptAiRepository implements AiRepository {
  @override
  AiChatSettings settings;

  final AssistantStorage _assistantStorage;
  late OpenAI _openAI;
  String? _assistantId;

  ChatGptAiRepository({
    required this.settings,
    required AssistantStorage assistantStorage,
  }) : _assistantStorage = assistantStorage;

  void dispose() {
    // No resources to dispose
  }

  @override
  Future<void> setupAi(String token) async {
    _openAI = OpenAI.instance.build(
      token: token,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 60)),
      enableLog: true,
    );

    // Setup assistant ID
    _assistantId = await _assistantStorage.getAssistantId();
    if (_assistantId == null) {
      _assistantId = await createAssistant();
      await _assistantStorage.saveAssistantId(_assistantId!);
    }
  }

  @override
  void changeAiToken(String newToken) {
    _openAI.setToken(newToken);
  }

  @override
  Future<String> sendQuestion(String question, {String? threadId}) async {
    if (threadId != null) {
      // Use Assistant API
      return await _sendToAssistant(threadId, question);
    } else {
      // Use Chat Completion API
      return await _sendToChatCompletion(question);
    }
  }

  Future<String> _sendToChatCompletion(String question) async {
    final request = ChatCompleteText(
      messages: [
        Messages(role: Role.system, content: settings.promptChat).toJson(),
        Messages(role: Role.user, content: question).toJson(),
      ],
      maxToken: 1500,
      model: Gpt4oMini2024ChatModel(),
    );

    final response = await _openAI.onChatCompletion(request: request);
    return response!.choices.first.message!.content;
  }

  Future<String> _sendToAssistant(String threadId, String question) async {
    // Add user message
    await _openAI.threads.v2.messages.createMessage(
      threadId: threadId,
      request: CreateMessage(role: 'user', content: question),
    );

    // Run the assistant
    final runRequest = CreateRun(assistantId: _assistantId!);
    final run = await _openAI.threads.v2.runs.createRun(threadId: threadId, request: runRequest);

    // Wait for run completion and get response
    String runStatus = 'in_progress';
    while (runStatus == 'in_progress' || runStatus == 'queued') {
      await Future.delayed(const Duration(seconds: 1));
      final runDetails = await _openAI.threads.v2.runs.retrieveRun(threadId: threadId, runId: run.id);
      runStatus = runDetails.status;
    }

    if (runStatus == 'completed') {
      // Get latest messages
      final messages = await _openAI.threads.v2.messages.listMessage(threadId: threadId);
      if (messages.data.isNotEmpty) {
        final lastMessage = messages.data.first;
        if (lastMessage.role == 'assistant') {
          final content = lastMessage.content.first;
          if (content.type == 'text') {
            return content.text?.value ?? '';
          }
        }
      }
    }

    throw LocalCustomError('Assistant run failed with status: $runStatus');
  }

  Future<String> createAssistant() async {
    final assistant = Assistant(
      model: Gpt4oMini2024Model(),
      name: 'AI Tutor',
      instructions: settings.promptChat,
      tools: [
        {"type": "code_interpreter"},
      ],
    );

    final response = await _openAI.assistant.v2.create(assistant: assistant);
    return response.id;
  }

  @override
  Stream<String> watchResponse(String question, {String? threadId}) async* {
    if (threadId != null) {
      // Use Assistant API for streaming
      yield* _watchFromAssistant(threadId, question);
    } else {
      // For Chat Completion API return full response immediately
      final response = await _sendToChatCompletion(question);
      yield response;
    }
  }

  Stream<String> _watchFromAssistant(String threadId, String message) async* {
    try {
      // Add user message
      await _openAI.threads.v2.messages.createMessage(
        threadId: threadId,
        request: CreateMessage(role: 'user', content: message),
      );

      // Run the assistant
      final runRequest = CreateRun(assistantId: _assistantId!);
      final run = await _openAI.threads.v2.runs.createRun(threadId: threadId, request: runRequest);

      // Wait for run completion and get response
      String runStatus = 'in_progress';
      while (runStatus == 'in_progress' || runStatus == 'queued') {
        await Future.delayed(const Duration(seconds: 1));
        final runDetails = await _openAI.threads.v2.runs.retrieveRun(threadId: threadId, runId: run.id);
        runStatus = runDetails.status;
      }

      if (runStatus == 'completed') {
        // Get latest messages
        final messages = await _openAI.threads.v2.messages.listMessage(threadId: threadId);
        if (messages.data.isNotEmpty) {
          final lastMessage = messages.data.first;
          if (lastMessage.role == 'assistant') {
            final content = lastMessage.content.first;
            if (content.type == 'text') {
              yield content.text?.value ?? '';
            }
          }
        }
      } else {
        yield* Stream.error('Assistant run failed with status: $runStatus');
      }
    } catch (e) {
      yield* Stream.error('Failed to get assistant response: $e');
    }
  }
}
