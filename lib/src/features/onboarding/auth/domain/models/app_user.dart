import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  factory AppUser({
    // required String? token,
    required String uid,
    required String? email,
  }) = _AppUser;
}
