import 'package:aichat/src/features/ai_chat/presentation/main_screen.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/email_sign_in_screen.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/email_sign_up_screen.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/password_recovery/password_recovery_screen.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/welcome_sign_screen.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/subscription_screen.dart';
import 'package:aichat/src/features/onboarding/wizard/presentation/wizard_screen.dart';
import 'package:aichat/src/features/splash/presentation/splash_screen.dart';
import 'package:aichat/src/router/navigation_observer.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final mainObserver = MyNavigatorObserver();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: RoutesName.splash.rootPath,
    observers: [mainObserver],
    routes: [
      GoRoute(
        name: RoutesName.splash.name,
        path: RoutesName.splash.rootPath,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) => const NoTransitionPage(child: SplashScreen()),
      ),
      GoRoute(
        name: RoutesName.wizard.name,
        path: RoutesName.wizard.rootPath,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const WizardScreen()),
      ),
      GoRoute(
        name: RoutesName.welcomeSign.name,
        path: RoutesName.welcomeSign.rootPath,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) => const NoTransitionPage(child: WelcomeSignScreen()),
        routes: [
          GoRoute(
            name: RoutesName.emailSignUp.name,
            path: RoutesName.emailSignUp.path,
            pageBuilder: (context, state) => const NoTransitionPage(child: EmailSignUpScreen()),
          ),
          GoRoute(
            name: RoutesName.emailSignIn.name,
            path: RoutesName.emailSignIn.path,
            pageBuilder: (context, state) => const NoTransitionPage(child: EmailSignInScreen()),
            routes: [
              GoRoute(
                name: RoutesName.passwordRecovery.name,
                path: RoutesName.passwordRecovery.path,
                pageBuilder: (context, state) {
                  final preFilledEmail = state.extra as String? ?? "";
                  return NoTransitionPage(child: PasswordRecoveryScreen(preFilledEmail: preFilledEmail));
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: RoutesName.subscription.name,
        path: RoutesName.subscription.rootPath,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) => const NoTransitionPage(child: SubscriptionScreen()),
      ),
      GoRoute(
        name: RoutesName.home.name,
        path: RoutesName.home.rootPath,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) => const NoTransitionPage(child: MainScreen()),
      ),
    ],
  );
});
