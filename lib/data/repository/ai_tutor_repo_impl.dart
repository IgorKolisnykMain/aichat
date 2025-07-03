import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aichat/domain/models/ai_chat_settings/ai_chat_settings.dart';
import 'package:aichat/domain/models/ai_message/ai_message.dart';
import 'package:aichat/domain/repository/ai_tutor_repo.dart';
import 'package:aichat/domain/repository/app_config_repository.dart';
import 'package:aichat/domain/repository/firestore_db_storage.dart';

class AiTutorRepoImpl implements AiTutorRepo {
  static const _chatHistory = 'chat_history';
  static const _usedAiTokens = '_used_ai_tokens';
  static const _userThreads = 'user_threads';
  static const _assistantIdKey = 'assistant_id';

  final AppConfigRepository _appConfigRepository;
  final FireStoreDbStorage _fireStoreDbStorage;
  late AiChatSettings _settings;
  late OpenAI _openAI;
  String? _assistantId;

  AiTutorRepoImpl(this._appConfigRepository, this._fireStoreDbStorage);

  DocumentReference<Map<String, dynamic>> get _userProgressDocRef {
    return _fireStoreDbStorage.userDocRef;
  }

  @override
  AiChatSettings get settings => _settings;

  @override
  Future<void> setupAiChat() async {
    _settings = (await _appConfigRepository.getAiSettings()).copyWith(usedTokens: await getUsedTokens());
    _openAI = OpenAI.instance.build(
      token: _settings.tokens.first,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 60)),
      enableLog: true,
    );
  }

  @override
  void changeAiToken() {
    if (_settings.tokens.length > _settings.usedTokens.length) {
      final lastTokens = _settings.tokens.where((token) => _settings.usedTokens.contains(token) == false);
      final updatedUsedTokens = Set.of(_settings.usedTokens);
      updatedUsedTokens.add(_openAI.token);
      _openAI.setToken(lastTokens.first);
      if (_openAI.token != lastTokens.first) {
        _openAI.setToken(lastTokens.first);
      }
      _settings = _settings.copyWith(usedTokens: updatedUsedTokens.toList());
      _updateUsedTokens(updatedUsedTokens.toList());
    } else {
      _openAI.setToken(_settings.tokens.first);
      final usedTokens = [_settings.tokens.first];
      _settings = _settings.copyWith(usedTokens: usedTokens);
      _updateUsedTokens(usedTokens);
    }
  }

  Future<void> _updateUsedTokens(List<String> updatedUsedTokens) async {
    _userProgressDocRef.set({_usedAiTokens: updatedUsedTokens}, SetOptions(merge: true));
  }

  Future<List<String>> getUsedTokens() async {
    try {
      final data = (await _userProgressDocRef.get(const GetOptions(source: Source.server))).data();
      final List<dynamic> result = data?[_usedAiTokens] as List<dynamic>? ?? [];
      return result.map((e) => e as String).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<AiMessage>> getChatHistory([Source source = Source.cache]) async {
    try {
      final data = (await _userProgressDocRef.get(GetOptions(source: source))).data();
      final List<dynamic> result = data?[_chatHistory] as List<dynamic>? ?? [];
      return result.map((e) => AiMessage.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<String> sentQuestion(String question) async {
    final request = ChatCompleteText(
      messages: [
        Messages(role: Role.system, content: _settings.promptChat).toJson(),
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
    final chatHistory = Set.of(await getChatHistory());
    chatHistory.add(message);
    _userProgressDocRef.set({
      _chatHistory: chatHistory.toList().map((message) => message.toJson()),
    }, SetOptions(merge: true));
  }

  // Assistants API v2 implementation
  @override
  Future<void> setupAssistant() async {
    try {
      // Проверяем, есть ли сохраненный ID ассистента
      final data = (await _userProgressDocRef.get()).data();
      _assistantId = data?[AiTutorRepoImpl._assistantIdKey] as String?;

      if (_assistantId == null) {
        // Создаем нового ассистента
        final assistant = Assistant(
          model: Gpt4oMini2024Model(), // Используем актуальную модель
          name: 'AI Tutor',
          instructions: _settings.promptChat,
          tools: [
            {"type": "code_interpreter"},
          ],
        );

        final response = await _openAI.assistant.v2.create(assistant: assistant);
        _assistantId = response.id;

        // Сохраняем ID ассистента
        await _userProgressDocRef.set({AiTutorRepoImpl._assistantIdKey: _assistantId}, SetOptions(merge: true));
      }
    } catch (e) {
      throw Exception('Failed to setup assistant: $e');
    }
  }

  @override
  Future<String> createThread() async {
    try {
      final request = ThreadRequest(
        messages: [], // Пустой список сообщений для нового thread
      );
      final thread = await _openAI.threads.v2.createThread(request: request);

      // Сохраняем thread ID для пользователя
      final threads = await getUserThreads();
      threads.add(thread.id);

      await _userProgressDocRef.set({_userThreads: threads}, SetOptions(merge: true));

      return thread.id;
    } catch (e) {
      throw Exception('Failed to create thread: $e');
    }
  }

  @override
  Future<void> sendMessageToAssistant(String threadId, String message) async {
    try {
      // Добавляем сообщение в thread
      await _openAI.threads.v2.messages.createMessage(
        threadId: threadId,
        request: CreateMessage(role: 'user', content: message),
      );

      // Запускаем ассистента
      final runRequest = CreateRun(assistantId: _assistantId!);
      await _openAI.threads.v2.runs.createRun(threadId: threadId, request: runRequest);
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }

  @override
  Stream<String> streamAssistantResponse(String threadId, String message) async* {
    try {
      // Добавляем сообщение пользователя
      await _openAI.threads.v2.messages.createMessage(
        threadId: threadId,
        request: CreateMessage(role: 'user', content: message),
      );

      // Запускаем ассистента
      final runRequest = CreateRun(assistantId: _assistantId!);
      final run = await _openAI.threads.v2.runs.createRun(threadId: threadId, request: runRequest);

      // Ждем завершения run и получаем ответ
      String runStatus = 'in_progress';
      while (runStatus == 'in_progress' || runStatus == 'queued') {
        await Future.delayed(const Duration(seconds: 1));
        final runDetails = await _openAI.threads.v2.runs.retrieveRun(threadId: threadId, runId: run.id);
        runStatus = runDetails.status;
      }

      if (runStatus == 'completed') {
        // Получаем последние сообщения
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

      // Удаляем thread из списка пользователя
      final threads = await getUserThreads();
      threads.remove(threadId);

      await _userProgressDocRef.set({_userThreads: threads}, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to delete thread: $e');
    }
  }

  @override
  Future<List<String>> getUserThreads() async {
    try {
      final data = (await _userProgressDocRef.get()).data();
      final List<dynamic> threads = data?[_userThreads] as List<dynamic>? ?? [];
      return threads.map((e) => e as String).toList();
    } catch (e) {
      return [];
    }
  }
}
