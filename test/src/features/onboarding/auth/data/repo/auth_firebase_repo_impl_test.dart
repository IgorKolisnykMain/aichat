// ignore: library_annotations
@Timeout(Duration(seconds: 10))
import 'package:aichat/src/features/onboarding/auth/domain/enums/sign_source.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/additional_app_user_info.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks.dart';

void main() {
  late final AppUser testUserWithoutEmail;

  setUpAll(() {
    testUserWithoutEmail = AppUser(uid: 'uid', email: null);
  });

  group('AuthFirebaseRepositoryImpl signVia', () {
    test(
      '''
    Given signSource is google
    When signVia successed
    Then return AdditionalAppUserInfo(newUser: true)
    ''',
      () async {
        final authFirebaseRepository = MockAuthFirebaseRepository();
        when(
          () => authFirebaseRepository.signVia(SignSource.google),
        ).thenAnswer((_) async => AdditionalAppUserInfo(user: testUserWithoutEmail, isNewUser: true));

        expect(
          await authFirebaseRepository.signVia(SignSource.google),
          AdditionalAppUserInfo(user: testUserWithoutEmail, isNewUser: true),
        );
      },
    );
    test(
      '''
    Given signSource is google
    When signVia successed
    Then return AdditionalAppUserInfo(newUser: false)
    ''',
      () async {
        final authFirebaseRepository = MockAuthFirebaseRepository();
        when(
          () => authFirebaseRepository.signVia(SignSource.google),
        ).thenAnswer((_) async => AdditionalAppUserInfo(user: testUserWithoutEmail, isNewUser: false));

        expect(
          await authFirebaseRepository.signVia(SignSource.google),
          AdditionalAppUserInfo(user: testUserWithoutEmail, isNewUser: false),
        );
      },
    );
    test(
      '''
    Given signSource is google
    When signVia failed
    Then throw Exception
    ''',
      () {
        final authFirebaseRepository = MockAuthFirebaseRepository();
        when(
          () => authFirebaseRepository.signVia(SignSource.google),
        ).thenAnswer((_) async => throw Exception('Sign via failed'));

        expect(() => authFirebaseRepository.signVia(SignSource.google), throwsException);
      },
    );

    test(
      '''
    Given signSource is apple
    When signVia successed
    Then return AdditionalAppUserInfo(newUser: true)
    ''',
      () async {
        final authFirebaseRepository = MockAuthFirebaseRepository();
        when(
          () => authFirebaseRepository.signVia(SignSource.apple),
        ).thenAnswer((_) async => AdditionalAppUserInfo(user: testUserWithoutEmail, isNewUser: true));

        expect(
          await authFirebaseRepository.signVia(SignSource.apple),
          AdditionalAppUserInfo(user: testUserWithoutEmail, isNewUser: true),
        );
      },
    );

    test(
      '''
    Given signSource is apple
    When signVia successed
    Then return AdditionalAppUserInfo(newUser: false)
    ''',
      () async {
        final authFirebaseRepository = MockAuthFirebaseRepository();
        when(
          () => authFirebaseRepository.signVia(SignSource.apple),
        ).thenAnswer((_) async => AdditionalAppUserInfo(user: testUserWithoutEmail, isNewUser: false));

        expect(
          await authFirebaseRepository.signVia(SignSource.apple),
          AdditionalAppUserInfo(user: testUserWithoutEmail, isNewUser: false),
        );
      },
    );

    test(
      '''
    Given signSource is apple
    When signVia failed
    Then throw Exception
    ''',
      () {
        final authFirebaseRepository = MockAuthFirebaseRepository();
        when(
          () => authFirebaseRepository.signVia(SignSource.apple),
        ).thenAnswer((_) async => throw Exception('Sign via failed'));

        expect(() => authFirebaseRepository.signVia(SignSource.apple), throwsException);
      },
    );
  });
}
