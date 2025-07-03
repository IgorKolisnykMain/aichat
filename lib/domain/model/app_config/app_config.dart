import 'package:aichat/domain/enum/user_platform.dart';

class AppConfig {
  final UserPlatform platform;
  final String revenueCatPublicKey;
  final String bundleId;
  final String appName;
  final String buildNumber;
  final String version;
  final String supportEmail;
  final String privacyPolicyUrl;
  final String termsOfUseUrl;

  (DateTime, DateTime) get rangeWhenToPutEntryInPreviousDay =>
      (DateTime.now().copyWith(hour: 0, minute: 0, second: 0), DateTime.now().copyWith(hour: 4, minute: 0, second: 0));

  AppConfig({
    required this.platform,
    required this.revenueCatPublicKey,
    required this.bundleId,
    required this.buildNumber,
    required this.version,
    required this.appName,
    required this.supportEmail,
    required this.privacyPolicyUrl,
    required this.termsOfUseUrl,
  });
}
