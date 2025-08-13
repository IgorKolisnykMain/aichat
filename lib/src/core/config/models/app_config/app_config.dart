import 'package:aichat/src/utils/app/domain/enums/user_platform.dart';
import 'package:aichat/src/utils/date_time/current_date_provider.dart';

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
      (currentDate.copyWith(hour: 0, minute: 0, second: 0), currentDate.copyWith(hour: 4, minute: 0, second: 0));

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
