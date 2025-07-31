import 'package:aichat/src/core/config/data/repository/app_config_repository_impl.dart';
import 'package:aichat/src/core/di/modules/firebase_module.dart';
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
import 'package:flutter_riverpod/flutter_riverpod.dart';

final aiRepositoryProvider = FutureProvider<AiRepository>((ref) async {
  final appConfig = await ref.read(appConfigRepositoryProvider.future);
  final settings = await appConfig.getAiSettings();
  final assistantStorage = await ref.read(assistantStorageProvider.future);

  final repository = ChatGptAiRepository(
    settings: settings,
    assistantStorage: assistantStorage,
  );
  
  ref.onDispose(repository.dispose);
  return repository;
});

final aiTokenStorageProvider = FutureProvider<AITokenStorage>((ref) async {
  final fireStore = await ref.read(firestoreProvider.future);
  final userStream = (await ref.read(authRepoProvider.future)).authStateChanges();

  final storage = FirestoreAiTokenStorage(
    fireStore: fireStore,
    userStream: userStream,
  );
  
  ref.onDispose(storage.dispose);
  return storage;
});

final assistantStorageProvider = FutureProvider<AssistantStorage>((ref) async {
  final fireStore = await ref.read(firestoreProvider.future);

  return FirestoreAssistantStorage(
    fireStore: fireStore,
  );
});

final threadIdStorageProvider = FutureProvider<ThreadIdStorage>((ref) async {
  final fireStore = await ref.read(firestoreProvider.future);
  final userStream = (await ref.read(authRepoProvider.future)).authStateChanges();

  final storage = FirestoreThreadIdStorage(
    fireStore: fireStore,
    userStream: userStream,
  );
  
  ref.onDispose(storage.dispose);
  return storage;
});

final firestoreChatStorageProvider = FutureProvider<ChatStorage>((ref) async {
  final fireStore = await ref.read(firestoreProvider.future);
  final userStream = (await ref.read(authRepoProvider.future)).authStateChanges();

  final storage = FirestoreChatStorage(
    fireStore: fireStore,
    userStream: userStream,
  );
  
  ref.onDispose(storage.dispose);
  return storage;
});

final chatGptChatStorageProvider = FutureProvider<ChatStorage>((ref) async {
  final appConfig = await ref.read(appConfigRepositoryProvider.future);
  final settings = await appConfig.getAiSettings();

  final storage = ChatGptChatStorage(
    openAI: OpenAI.instance.build(token: settings.tokens.first),
    headerMessage: settings.headerMessage,
  );
  
  ref.onDispose(storage.dispose);
  return storage;
});

final aiChatServiceProvider = FutureProvider<AiChatService>((ref) async {
  final aiRepository = await ref.read(aiRepositoryProvider.future);
  final chatStorage = await ref.read(chatGptChatStorageProvider.future);
  final tokenStorage = await ref.read(aiTokenStorageProvider.future);
  final threadIdStorage = await ref.read(threadIdStorageProvider.future);
  final connectivity = ref.read(connectivityDetectorServiceProvider);

  final service = AiChatServiceImpl(
    aiRepository: aiRepository,
    chatStorage: chatStorage,
    tokenStorage: tokenStorage,
    threadIdStorage: threadIdStorage,
    connectivity: connectivity,
  );

  await service.initialize();
  return service;
});
