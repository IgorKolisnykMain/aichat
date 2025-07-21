import 'package:aichat/src/constants/design_sizes.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../app.dart';
import '../../../mocks.dart';

class AuthRobot {
  final WidgetTester tester;
  final Size designSize;
  final AppRobot appRobot;
  AuthRobot({required this.tester, this.designSize = DesignSize.mobile}): appRobot = AppRobot(tester: tester, designSize: designSize);

  Future<void> pumpEmailSignInScreen() async {
    final mockAuthRepository = MockAuthFirebaseRepository();
    await _pumpScreen(
      overrides: [
        authRepoProvider.overrideWith((ref) => mockAuthRepository),
      ],
    );
  }


}
