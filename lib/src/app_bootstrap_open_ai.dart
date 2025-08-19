import 'package:aichat/firebase_options.dart';
import 'package:aichat/src/core/config/data/repository/app_config_repository_impl.dart';
import 'package:aichat/src/core/di/modules/firebase_module.dart';
import 'package:aichat/src/exceptions/async_error_logger.dart';
import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/features/ai_chat/data/providers/ai_chat_providers.dart';
import 'package:aichat/src/features/ai_chat/data/repository/chatgpt_chat_storage.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// * Here, dependencies are configured and chat storage is redefined in OpenAI.
Future<ProviderContainer> createOpenAiProviderContainer() async {
  final appConfigRepo = await AppConfigRepositoryImpl.init();
  final firebaseApp = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  return ProviderContainer(
    overrides: [
      appConfigRepositoryProvider.overrideWith((ref) => appConfigRepo),
      firebaseAppProvider.overrideWith((ref) => firebaseApp),
      chatStorageProvider.overrideWith((ref) {
        final settings = appConfigRepo.getAiSettings();

        final storageOpenAi = ChatGptChatStorage(
          openAI: OpenAI.instance.build(token: settings.tokens.first),
          headerMessage: settings.headerMessage,
          errorLogger: ref.read(errorLoggerProvider),
        );

        ref.onDispose(storageOpenAi.dispose);
        return storageOpenAi;
      }),
    ],
    observers: [
      AsyncErrorLogger(),
    ],
  );
}
