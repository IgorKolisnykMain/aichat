import 'package:aichat/firebase_options.dart';
import 'package:aichat/src/core/config/data/repository/app_config_repository_impl.dart';
import 'package:aichat/src/core/di/modules/firebase_module.dart';
import 'package:aichat/src/exceptions/async_error_logger.dart';
import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/features/ai_chat/data/providers/ai_chat_providers.dart';
import 'package:aichat/src/features/ai_chat/data/repository/firestore_chat_storage.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// * Here, dependencies are configured and chat storage is redefined in Firestore.
Future<ProviderContainer> createFirestoreProviderContainer() async {
  final appConfigRepo = await AppConfigRepositoryImpl.init();
  final firebaseApp = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  return ProviderContainer(
    overrides: [
      appConfigRepositoryProvider.overrideWith((ref) => appConfigRepo),
      firebaseAppProvider.overrideWith((ref) => firebaseApp),
      chatStorageProvider.overrideWith((ref) {
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
      }),
    ],
    observers: [
      AsyncErrorLogger(),
    ],
  );
}
