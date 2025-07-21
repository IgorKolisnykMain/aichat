import 'package:aichat/src/common_widgets/buttons/app_primary_button.dart';
import 'package:aichat/src/constants/design_sizes.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/email_sign_in_screen.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/welcome_sign_screen.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../app_robot.dart';

class AuthRobot {
  final WidgetTester tester;
  final Size designSize;
  final AppRobot appRobot;

  AuthRobot({required this.tester, this.designSize = DesignSize.mobile})
    : appRobot = AppRobot(tester: tester, designSize: designSize);

  Future<void> pumpWelcomeSignScreen() async {
    final mockAuthRepository = MockAuthFirebaseRepository();
    await appRobot.pumpAppScreen(
      overrides: [authRepoProvider.overrideWith((ref) => mockAuthRepository)],
      screen: const WelcomeSignScreen(),
    );
  }

  void tes() {}

  Future<void> pumpEmailSignInScreen({required AuthRepository authRepo}) async {
    await appRobot.pumpAppScreen(
      overrides: [authRepoProvider.overrideWith((ref) => authRepo)],
      screen: const EmailSignInScreen(),
    );
    await expectEmailSignInScreen();
  }

  Future<void> expectWelcomeSignScreen() async {
    expect(find.byType(WelcomeSignScreen), findsOneWidget);
  }

  Future<void> expectEmailSignInScreen() async {
    expect(find.byType(EmailSignInScreen), findsOneWidget);
  }

  Future<void> expectGoogleAndEmailContinueBtns() async {
    final element = tester.element(find.byType(WelcomeSignScreen));
    expect(find.text(element.l10n.continueWithGoogle), findsOneWidget);
    expect(find.text(element.l10n.continueWithEmail), findsOneWidget);
  }

  Future<void> enterEmail(String testEmail) async {
    final emaiField = find.byKey(EmailSignInScreen.emailKey);
    expect(emaiField, findsOneWidget);
    await tester.enterText(emaiField, testEmail);
  }

  Future<void> enterPassword(String testPassword) async {
    final passwordField = find.byKey(EmailSignInScreen.passwordKey);
    expect(passwordField, findsOneWidget);
    await tester.enterText(passwordField, testPassword);
  }

  Future<void> tapSignInSubmitButton() async {
    final appPrimaryButton = find.byType(AppPrimaryButton);
    expect(appPrimaryButton, findsOneWidget);
    await tester.tap(appPrimaryButton);
    await tester.pumpAndSettle();
  }

  Future<void> expectErrorHintIsNotShown() async {
    await _expectEmailErrorHintIsNotShown();
    await _expectPasswordErrorHintIsNotShown();
  }

  Future<void> _expectEmailErrorHintIsNotShown() async {
    final hintErrorEmptyTextInFormFieldFinder = _getEmptyTextEmailFinder();
    final hintErrorNotValidInFormFieldFinder = _getNotValidEmailFinder();
    expect(hintErrorEmptyTextInFormFieldFinder, findsNothing);
    expect(hintErrorNotValidInFormFieldFinder, findsNothing);
  }

  Future<void> expectEmptyEmailErrorHintIsShown() async {
    final hintErrorEmptyTextInFormFieldFinder = _getEmptyTextEmailFinder();
    expect(hintErrorEmptyTextInFormFieldFinder, findsOneWidget);
  }

  Future<void> expectNotValidEmailErrorHintIsShown() async {
    final hintErrorNotValidInFormFieldFinder = _getNotValidEmailFinder();
    expect(hintErrorNotValidInFormFieldFinder, findsOneWidget);
  }

  Finder _getEmptyTextEmailFinder() {
    final element = tester.element(find.byType(EmailSignInScreen));
    final emailField = find.byKey(EmailSignInScreen.emailKey);
    expect(emailField, findsOneWidget);
    final errorEmptyTextFinder = find.text(element.l10n.pleaseEnterEmail);
    return find.descendant(of: emailField, matching: errorEmptyTextFinder);
  }

  Finder _getNotValidEmailFinder() {
    final element = tester.element(find.byType(EmailSignInScreen));
    final emailField = find.byKey(EmailSignInScreen.emailKey);
    expect(emailField, findsOneWidget);
    final errorNotValidEmailTextFinder = find.text(element.l10n.pleaseEnterValidEmail);
    return find.descendant(of: emailField, matching: errorNotValidEmailTextFinder);
  }

  Future<void> _expectPasswordErrorHintIsNotShown() async {
    final element = tester.element(find.byType(EmailSignInScreen));
    final passwordField = find.byKey(EmailSignInScreen.passwordKey);
    expect(passwordField, findsOneWidget);
    final errorTextFinder = find.text(element.l10n.pleaseEnterPassword);
    final hintInFormFieldFinder = find.descendant(of: passwordField, matching: errorTextFinder);
    expect(hintInFormFieldFinder, findsNothing);
  }

  Future<void> expectSignInWithEmailAndPasswordIsCalled(
    MockAuthFirebaseRepository mockAuthRepository,
    String email,
    String password,
  ) async {
    verify(() => mockAuthRepository.signInWithEmailAndPassword(email: email, password: password)).called(1);
  }
}
