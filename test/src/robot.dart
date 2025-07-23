import 'dart:ui';

import 'package:aichat/src/constants/design_sizes.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/welcome_sign_screen.dart';
import 'package:aichat/src/router/app_router.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'features/app_robot.dart';
import 'features/onboarding/auth/auth_robot.dart';

class Robot {
  final WidgetTester tester;
  final Size designSize;
  final AppRobot appRobot;
  final AuthRobot auth;

  Robot.integrationTest({required this.tester, this.designSize = DesignSize.mobile})
    : appRobot = AppRobot.integrationTest(
        tester: tester,
        designSize: designSize,
        goRouter: GoRouter(initialLocation: RoutesName.welcomeSign.rootPath, routes: [getAuthFlow()]),
      ),
      auth = AuthRobot.integrationTest(tester: tester, designSize: designSize);

  Robot.widgetTest({required this.tester, this.designSize = DesignSize.mobile})
    : appRobot = AppRobot.widgetTest(
        tester: tester,
        designSize: designSize,
        goRouter: GoRouter(initialLocation: RoutesName.welcomeSign.rootPath, routes: [getAuthFlow()]),
      ),
      auth = AuthRobot.widgetTest(tester: tester, designSize: designSize);

  Future<void> pumpApp({AuthRepository? authRepo}) async {
    await appRobot.pumpAppScreen(overrides: [if (authRepo != null) authRepoProvider.overrideWith((ref) => authRepo)]);
    // await appRobot.pumpCustomAppScreen(
    //   overrides: [if (authRepo != null) authRepoProvider.overrideWith((ref) => authRepo)],
    //   screen: const WelcomeSignScreen(),
    // );
  }

  Future<void> pumpWelcomeSignScreen({AuthRepository? authRepo}) async {
    await appRobot.pumpCustomAppScreen(
      overrides: [if (authRepo != null) authRepoProvider.overrideWith((ref) => authRepo)],
      screen: const WelcomeSignScreen(),
    );
  }
}
