import 'dart:io';

import 'package:aichat/src/core/config/domain/repository/app_config_repository.dart';
import 'package:aichat/src/core/config/models/app_config/app_config.dart';
import 'package:aichat/src/core/env/env.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_chat_settings/ai_chat_settings.dart';
import 'package:aichat/src/utils/app/domain/enums/user_platform.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppConfigRepositoryImpl implements AppConfigRepository {
  final AppConfig _appConfig;

  AppConfigRepositoryImpl._(this._appConfig);

  @override
  AppConfig get config => _appConfig;

  @override
  Future<AiChatSettings> getAiSettings() async {
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
    if (Platform.isAndroid) {
      return UserPlatform.android;
    } else if (Platform.isIOS) {
      return UserPlatform.ios;
    } else {
      return UserPlatform.undefined;
    }
  }
}
