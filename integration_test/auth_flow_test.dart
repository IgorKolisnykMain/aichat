import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

import '../test/src/mocks.dart';
import '../test/src/robot.dart';
import 'utils/keyboard.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const testEmail = 'test@gmail.com';
  const testPassword = 'password123';
  late MockAuthFirebaseRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthFirebaseRepository();
    // Configure mock to return null to avoid navigation to home route
    when(
      () => mockAuthRepository.signInWithEmailAndPassword(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => null);
  });

  testWidgets("Auth flow test", (tester) async {
    final r = Robot.integrationTest(tester: tester);
    await r.pumpApp(authRepo: mockAuthRepository);
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
    await r.auth.expectSignInWithEmailAndPasswordIsCalled(mockAuthRepository, testEmail, testPassword);
  });
}
