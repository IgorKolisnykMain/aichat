import 'dart:async';

import 'package:aichat/src/core/config/data/repository/app_config_repository_impl.dart';
import 'package:aichat/src/core/di/modules/firebase_module.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_chat_settings.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_message.dart';
import 'package:aichat/src/features/ai_chat/domain/models/chat_history.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/ai_tutor_repo.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';
import 'package:aichat/src/utils/firestore/user/firestore_user_utils.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final aiTutorOpenAiRepoProvider = FutureProvider<AiTutorRepo>((ref) async {
  final appConfig = await ref.read(appConfigRepositoryProvider.future);
  final repo = AiTutorOpenAiRepoImpl(
    fireStore: await ref.read(firestoreProvider.future),
    settings: await appConfig.getAiSettings(),
    userStream: (await ref.read(authRepoProvider.future)).authStateChanges(),
  );
  ref.onDispose(repo.dispose);
  return repo;
});

class AiTutorOpenAiRepoImpl implements AiTutorRepo {
  static const _usedAiTokens = '_used_ai_tokens';
  static const _userThreads = 'user_threads';
  static const _assistantIdKey = 'assistant_id';

  @override
  AiChatSettings settings;

  final FirebaseFirestore fireStore;
  late StreamSubscription<AppUser?> _userStream;
  late OpenAI _openAI;
  String? _assistantId;
  String? _userId;

  AiTutorOpenAiRepoImpl({required this.fireStore, required this.settings, required Stream<AppUser?> userStream}) {
    _userStream = userStream.listen((user) {
      if (_userId == null) {
        setupAiChat();
      }
      _userId = user?.uid;
    });
  }

  void dispose() {
    _userStream.cancel();
  }

  DocumentReference<Map<String, dynamic>> get _userDocRef => getUserDocRef(_userId, fireStore);

  @override
  Future<void> setupAiChat() async {
    _openAI = OpenAI.instance.build(
      token: settings.tokens.first,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 60)),
      enableLog: true,
    );
  }

  @override
  void changeAiToken() {
    if (settings.tokens.length > settings.usedTokens.length) {
      final lastTokens = settings.tokens.where((token) => settings.usedTokens.contains(token) == false);
      _openAI.setToken(lastTokens.first);
      settings = settings.addUsedToken(_openAI.token);
      _updateUsedTokens(settings.usedTokens);
    } else {
      _openAI.setToken(settings.tokens.first);
      settings = settings.setUsedTokens([settings.tokens.first]);
      _updateUsedTokens(settings.usedTokens);
    }
  }

  Future<void> _updateUsedTokens(List<String> updatedUsedTokens) async {
    _userDocRef.set({_usedAiTokens: updatedUsedTokens}, SetOptions(merge: true));
  }

  Future<List<String>> getUsedTokens() async {
    try {
      final data = (await _userDocRef.get(const GetOptions(source: Source.server))).data();
      final List<dynamic> result = data?[_usedAiTokens] as List<dynamic>? ?? [];
      return result.map((e) => e as String).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<ChatHistory> getChatHistory() async {
    try {
      final data = (await _userDocRef.get()).data() ?? {};
      return ChatHistory.fromJsonChatHistory(data);
    } catch (e) {
      return const ChatHistory(messages: []);
    }
  }

  @override
  Future<String> sentQuestion(String question) async {
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

  @override
  Future<void> addMessage(AiMessage message) async {
    final chatHistory = await getChatHistory();
    chatHistory.addMessage(message);
    _userDocRef.set(chatHistory.toJsonChatHistory(), SetOptions(merge: true));
  }

  // Assistants API v2 implementation
  @override
  Future<void> setupAssistant() async {
    try {
      // Check if there is a saved assistant ID
      final data = (await _userDocRef.get()).data();
      _assistantId = data?[_assistantIdKey] as String?;

      if (_assistantId == null) {
        // Create a new assistant
        final assistant = Assistant(
          model: Gpt4oMini2024Model(), // Use the current model
          name: 'AI Tutor',
          instructions: settings.promptChat,
          tools: [
            {"type": "code_interpreter"},
          ],
        );

        final response = await _openAI.assistant.v2.create(assistant: assistant);
        _assistantId = response.id;

        // Save the assistant ID
        await _userDocRef.set({_assistantIdKey: _assistantId}, SetOptions(merge: true));
      }
    } catch (e) {
      throw Exception('Failed to setup assistant: $e');
    }
  }

  @override
  Future<String> createThread() async {
    try {
      final request = ThreadRequest(
        messages: [], // Empty message list for new thread
      );
      final thread = await _openAI.threads.v2.createThread(request: request);

      // Save thread ID for the user
      final threads = await getUserThreads();
      threads.add(thread.id);

      await _userDocRef.set({_userThreads: threads}, SetOptions(merge: true));

      return thread.id;
    } catch (e) {
      throw Exception('Failed to create thread: $e');
    }
  }

  @override
  Future<void> sendMessageToAssistant(String threadId, String message) async {
    try {
      // Add message to thread
      await _openAI.threads.v2.messages.createMessage(
        threadId: threadId,
        request: CreateMessage(role: 'user', content: message),
      );

      // Run the assistant
      final runRequest = CreateRun(assistantId: _assistantId!);
      await _openAI.threads.v2.runs.createRun(threadId: threadId, request: runRequest);
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }

  @override
  Stream<String> streamAssistantResponse(String threadId, String message) async* {
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

  @override
  Future<void> deleteThread(String threadId) async {
    try {
      await _openAI.threads.v2.deleteThread(threadId: threadId);

      // Remove thread from user's list
      final threads = await getUserThreads();
      threads.remove(threadId);

      await _userDocRef.set({_userThreads: threads}, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to delete thread: $e');
    }
  }

  @override
  Future<List<String>> getUserThreads() async {
    try {
      final data = (await _userDocRef.get()).data();
      final List<dynamic> threads = data?[_userThreads] as List<dynamic>? ?? [];
      return threads.map((e) => e as String).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<ChatHistory> getThreadHistory(String threadId) async {
    try {
      final messages = await _openAI.threads.v2.messages.listMessage(threadId: threadId);
      final List<AiMessage> aiMessages = [];
      
      // Добавляем header сообщение
      final headerMessage = AiMessage.header(message: settings.headerMessage);
      aiMessages.add(headerMessage);
      
      // Конвертируем сообщения из OpenAI в AiMessage (в обратном порядке для хронологии)
      for (final message in messages.data.reversed) {
        if (message.role == 'user' && message.content.isNotEmpty) {
          final content = message.content.first;
          if (content.type == 'text' && content.text?.value != null) {
            aiMessages.add(AiMessage.myQuestion(
              message: content.text!.value,
              date: _formatTimestamp(message.createdAt),
            ));
          }
        } else if (message.role == 'assistant' && message.content.isNotEmpty) {
          final content = message.content.first;
          if (content.type == 'text' && content.text?.value != null) {
            aiMessages.add(AiMessage.aiAnswer(
              message: content.text!.value,
              date: _formatTimestamp(message.createdAt),
            ));
          }
        }
      }
      
      return ChatHistory(messages: aiMessages);
    } catch (e) {
      // Если не удалось загрузить из thread, возвращаем только header
      return ChatHistory.withHeaderMessage(settings.headerMessage);
    }
  }
  
  String _formatTimestamp(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('h:mm a').format(date);
  }
}
