import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/src/robot.dart';
import 'utils/keyboard.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const testEmail = 'test1@gmail.com';
  const testPassword = 'Qwery123';

  testWidgets("Flow sign in via email", (tester) async {
    final r = Robot.integrationTest(tester: tester);
    await r.pumpApp();
    await r.auth.expectWelcomeSignScreen();
    await r.auth.expectGoogleAndEmailContinueBtns();
    await r.auth.tapContinueWithEmailSubmitButton();
    await r.auth.tapHaveAccountLogInLink();
    await r.auth.expectEmailSignInScreen();
    await r.auth.enterEmail(testEmail);
    await r.auth.enterPassword(testPassword);
    hideKeyboard();
    await r.auth.tapSignInSubmitButton();
    await r.auth.expectErrorHintIsNotShown();
    // await r.auth.expectSignInWithEmailAndPasswordIsCalled(mockAuthRepository, testEmail, testPassword);
  });
}
