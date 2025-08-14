import 'package:aichat/src/core/config/data/repository/app_config_repository_impl.dart';
import 'package:aichat/src/core/di/modules/firebase_module.dart';
import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/features/ai_chat/data/repository/chatgpt_ai_repository.dart';
import 'package:aichat/src/features/ai_chat/data/repository/chatgpt_chat_storage.dart';
import 'package:aichat/src/features/ai_chat/data/repository/firestore_ai_token_storage.dart';
import 'package:aichat/src/features/ai_chat/data/repository/firestore_assistant_storage.dart';
import 'package:aichat/src/features/ai_chat/data/repository/firestore_chat_storage.dart';
import 'package:aichat/src/features/ai_chat/data/repository/firestore_thread_id_storage.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/ai_repository.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/ai_token_storage.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/assistant_storage.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/chat_storage.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/thread_id_storage.dart';
import 'package:aichat/src/features/ai_chat/domain/services/ai_chat_service.dart';
import 'package:aichat/src/features/ai_chat/domain/services/ai_chat_service_impl.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/utils/connection/data/services/connectivity_detector_service_impl.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_chat_providers.g.dart';

@Riverpod(keepAlive: true)
AiRepository aiRepository(Ref ref) {
  final appConfig = ref.read(appConfigRepositoryProvider);
  final settings = appConfig.getAiSettings();
  final assistantStorage = ref.read(assistantStorageProvider);

  final repository = ChatGptAiRepository(
    settings: settings,
    assistantStorage: assistantStorage,
  );

  ref.onDispose(repository.dispose);
  return repository;
}

@Riverpod(keepAlive: true)
AITokenStorage aiTokenStorage(Ref ref) {
  final errorLogger = ref.read(errorLoggerProvider);
  final fireStore = ref.read(firestoreProvider);
  final userStream = ref.read(authRepoProvider).authStateChanges();

  final storage = FirestoreAiTokenStorage(
    fireStore: fireStore,
    userStream: userStream,
    errorLogger: errorLogger,
  );

  ref.onDispose(storage.dispose);
  return storage;
}

@Riverpod(keepAlive: true)
AssistantStorage assistantStorage(Ref ref) {
  final errorLogger = ref.read(errorLoggerProvider);
  final fireStore = ref.read(firestoreProvider);

  return FirestoreAssistantStorage(
    fireStore: fireStore,
    errorLogger: errorLogger,
  );
}

@Riverpod(keepAlive: true)
ThreadIdStorage threadIdStorage(Ref ref) {
  final errorLogger = ref.read(errorLoggerProvider);
  final fireStore = ref.read(firestoreProvider);
  final userStream = ref.read(authRepoProvider).authStateChanges();

  final storage = FirestoreThreadIdStorage(
    fireStore: fireStore,
    userStream: userStream,
    errorLogger: errorLogger,
  );

  ref.onDispose(storage.dispose);
  return storage;
}

@Riverpod(keepAlive: true)
ChatStorage firestoreChatStorage(Ref ref) {
  final errorLogger = ref.read(errorLoggerProvider);
  final fireStore = ref.read(firestoreProvider);
  final userStream = ref.read(authRepoProvider).authStateChanges();

  final storage = FirestoreChatStorage(
    fireStore: fireStore,
    userStream: userStream,
    errorLogger: errorLogger,
  );

  ref.onDispose(storage.dispose);
  return storage;
}

@Riverpod(keepAlive: true)
ChatStorage chatGptChatStorage(Ref ref) {
  final errorLogger = ref.read(errorLoggerProvider);
  final appConfig = ref.read(appConfigRepositoryProvider);
  final settings = appConfig.getAiSettings();

  final storage = ChatGptChatStorage(
    openAI: OpenAI.instance.build(token: settings.tokens.first),
    headerMessage: settings.headerMessage,
    errorLogger: errorLogger,
  );

  ref.onDispose(storage.dispose);
  return storage;
}

@Riverpod(keepAlive: true)
AiChatService aiChatService(Ref ref) {
  final errorLogger = ref.read(errorLoggerProvider);
  final aiRepository = ref.read(aiRepositoryProvider);
  final chatStorage = ref.read(chatGptChatStorageProvider);
  final tokenStorage = ref.read(aiTokenStorageProvider);
  final threadIdStorage = ref.read(threadIdStorageProvider);
  final connectivity = ref.read(connectivityDetectorServiceProvider);

  final service = AiChatServiceImpl(
    aiRepository: aiRepository,
    chatStorage: chatStorage,
    tokenStorage: tokenStorage,
    threadIdStorage: threadIdStorage,
    connectivity: connectivity,
    errorLogger: errorLogger,
  );

  return service;
}
