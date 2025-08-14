import 'package:aichat/src/core/config/domain/repository/app_config_repository.dart';
import 'package:aichat/src/core/config/models/app_config/app_config.dart';
import 'package:aichat/src/core/env/env.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_chat_settings.dart';
import 'package:aichat/src/utils/app/domain/enums/user_platform.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config_repository_impl.g.dart';

@Riverpod(keepAlive: true)
AppConfigRepository appConfigRepository(Ref ref) {
  // * Override this in the main method
  throw UnimplementedError();
}

class AppConfigRepositoryImpl implements AppConfigRepository {
  final AppConfig _appConfig;

  AppConfigRepositoryImpl._(this._appConfig);

  @override
  AppConfig get config => _appConfig;

  @override
  AiChatSettings getAiSettings() {
    return AiChatSettings(
      headerMessage: "AI Assistant",
      promptChat: "You are a helpful AI assistant. Answer questions concisely and accurately.",
      tokens: [Env.openAIToken], // This should be loaded from secure storage
    );
  }

  static Future<AppConfigRepositoryImpl> init() async {
    final packageInfo = await PackageInfo.fromPlatform();

    final config = AppConfig(
      platform: _getUserPlatform(),
      revenueCatPublicKey: Env.revenueCatPublicKey,
      bundleId: packageInfo.packageName,
      buildNumber: packageInfo.buildNumber,
      version: packageInfo.version,
      appName: packageInfo.appName,
      supportEmail: "support@hearmeout.com",
      privacyPolicyUrl: "/privacy-policy/",
      termsOfUseUrl: "/terms-of-use/",
    );

    return AppConfigRepositoryImpl._(config);
  }

  static UserPlatform _getUserPlatform() {
    if (kIsWeb) {
      return UserPlatform.undefined;
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return UserPlatform.android;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UserPlatform.ios;
    } else {
      return UserPlatform.undefined;
    }
  }
}
