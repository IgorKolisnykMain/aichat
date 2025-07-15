import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';

class AdditionalAppUserInfo {
  final AppUser user;
  final bool? isNewUser;

  AdditionalAppUserInfo({required this.user, this.isNewUser});
}
