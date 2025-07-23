import 'package:flutter_test/flutter_test.dart';

import '../../../mocks.dart';
import '../../../robot.dart';

void main() {
  const testEmail = 'test@gmail.com';
  const testPassword = 'password123';
  late MockAuthFirebaseRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthFirebaseRepository();
  });

  testWidgets("test", (tester) async {
    final r = Robot.widgetTest(tester: tester);
    await r.pumpWelcomeSignScreen(authRepo: mockAuthRepository);
    await r.auth.expectWelcomeSignScreen();
    await r.auth.expectGoogleAndEmailContinueBtns();
    await r.auth.tapContinueWithEmailSubmitButton();
    await r.auth.tapHaveAccountLogInLink();
    await r.auth.expectEmailSignInScreen();
    await r.auth.enterEmail(testEmail);
    await r.auth.enterPassword(testPassword);
    await r.auth.tapSignInSubmitButton();
    await r.auth.expectErrorHintIsNotShown();
    await r.auth.expectSignInWithEmailAndPasswordIsCalled(mockAuthRepository, testEmail, testPassword);
  });
}
