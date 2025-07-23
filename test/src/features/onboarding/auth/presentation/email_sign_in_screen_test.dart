import 'package:aichat/src/constants/design_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks.dart';
import '../auth_robot.dart';

void main() {
  const testEmail = 'test@gmail.com';
  const testPassword = 'password123';
  late MockAuthFirebaseRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthFirebaseRepository();
  });

  testWidgets('renders EmailSignInScreen correctly', (tester) async {
    final r = await AuthRobot.widgetTest(tester: tester);
    await r.pumpEmailSignInScreen(authRepo: mockAuthRepository);
    await r.expectEmailSignInScreen();
  }, variant: ValueVariant<Size>({DesignSize.mobile}));

  testWidgets(
    '''
        When enter valid email and password
        And tap on the Log In button
        Then signInWithEmailAndPassword is called
        And error hint is not shown
        ''',
    (tester) async {
      final r = await AuthRobot.widgetTest(tester: tester);
      await r.pumpEmailSignInScreen(authRepo: mockAuthRepository);
      await r.enterEmail(testEmail);
      await r.enterPassword(testPassword);
      await r.tapSignInSubmitButton();
      await r.expectErrorHintIsNotShown();
      await r.expectSignInWithEmailAndPasswordIsCalled(mockAuthRepository, testEmail, testPassword);
    },
  );
  testWidgets(
    '''
        When enter valid email and password
        And tap on the Log In button
        Then signInWithEmailAndPassword is called
        And error hint is shown that the email is empty
        ''',
    (tester) async {
      final r = await AuthRobot.widgetTest(tester: tester);
      await r.pumpEmailSignInScreen(authRepo: mockAuthRepository);
      await r.enterEmail('');
      await r.enterPassword(testPassword);
      await r.tapSignInSubmitButton();
      await r.expectEmptyEmailErrorHintIsShown();
    },
  );
  testWidgets(
    '''
        When enter valid email and password
        And tap on the Log In button
        Then signInWithEmailAndPassword is called
        And error hint is shown that the email is not valid
        ''',
    (tester) async {
      final r = await AuthRobot.widgetTest(tester: tester);
      await r.pumpEmailSignInScreen(authRepo: mockAuthRepository);
      await r.enterEmail("NotValidEmail");
      await r.enterPassword(testPassword);
      await r.tapSignInSubmitButton();
      await r.expectNotValidEmailErrorHintIsShown();
    },
  );
}
