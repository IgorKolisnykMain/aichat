import 'package:aichat/l10n/app_localizations.dart';
import 'package:aichat/src/common_widgets/buttons/app_primary_button.dart';
import 'package:aichat/src/constants/design_sizes.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_controller.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/email_sign_in_screen.dart';
import 'package:aichat/src/utils/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../auth_robot.dart';

void main() {
  late AppUser testUser;

  setUp(() {
    mockAuthRepository = MockAuthFirebaseRepository();
    testUser = AppUser(uid: 'test-uid', email: 'test@example.com');
    // registerFallbackValue(const Locale('en'));
  });

  testWidgets('renders EmailSignInScreen correctly', (tester) async {
    final r = AuthRobot(tester: tester);
    await r.pumpEmailSignInScreen();
    expect(find.byType(EmailSignInScreen), findsOneWidget);
  }, variant: ValueVariant<Size>({DesignSize.mobile}));

  // testWidgets('given valid credentials, when login button is tapped, calls signInWithEmailAndPassword', (tester) async {
  //   // Arrange
  //   when(() => mockAuthRepository.signInWithEmailAndPassword(email: any(named: 'email'), password: any(named: 'password')))
  //       .thenAnswer((_) async => testUser);

  //   await pumpScreen(tester);
  //   await tester.pumpAndSettle();

  //   final BuildContext context = tester.element(find.byType(EmailSignInScreen));
  //   final l10n = AppLocalizations.of(context)!;

  //   // Act
  //   await tester.enterText(find.byKey(const Key('email_text_form_field')), 'test@example.com');
  //   await tester.enterText(find.byKey(const Key('password_text_form_field')), 'password123');
  //   await tester.tap(find.widgetWithText(AppPrimaryButton, l10n.logIn));

  //   // Assert
  //   verify(() => mockAuthRepository.signInWithEmailAndPassword(email: 'test@example.com', password: 'password123')).called(1);
  // });
}
