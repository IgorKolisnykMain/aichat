import 'package:aichat/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Auth Integration Tests', () {
    testWidgets('Complete auth flow', (tester) async {
      // Start the real app
      app.main();
      await tester.pumpAndSettle();

      // Wait for app to fully load
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Find and interact with real UI elements
      final continueWithEmailButton = find.text('Continue with Email');
      expect(continueWithEmailButton, findsOneWidget);

      await tester.tap(continueWithEmailButton);
      await tester.pumpAndSettle();

      // Continue with the flow...
      final logInLink = find.textContaining('Log in');
      if (logInLink.evaluate().isNotEmpty) {
        await tester.tap(logInLink);
        await tester.pumpAndSettle();
      }

      // Look for email input
      final emailField = find.byType(TextField).first;
      expect(emailField, findsOneWidget);

      await tester.enterText(emailField, 'test@example.com');
      await tester.pumpAndSettle();

      // Hide keyboard if it appears
      await SystemChannels.textInput.invokeMethod('TextInput.hide');
      await tester.pumpAndSettle(const Duration(seconds: 1));

      print('Integration test completed successfully');
    });
  });
}
