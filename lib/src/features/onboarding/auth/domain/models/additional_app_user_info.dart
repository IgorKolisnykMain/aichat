import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AdditionalAppUserInfo {
  final AppUser user;
  final bool? isNewUser;

  const AdditionalAppUserInfo({required this.user, this.isNewUser});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AdditionalAppUserInfo && other.user == user && other.isNewUser == isNewUser;
  }

  @override
  int get hashCode => user.hashCode ^ isNewUser.hashCode;

  @override
  String toString() => 'AdditionalAppUserInfo(user: $user, isNewUser: $isNewUser)';
}
