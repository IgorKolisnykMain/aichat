import 'package:aichat/src/core/di/locator.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_bloc.dart';
import 'package:aichat/src/features/ai_chat/presentation/main_screen.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_bloc.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/email_sign_in_screen.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/email_sign_up_screen.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/password_recovery/controller/password_recovery_bloc.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/password_recovery/password_recovery_screen.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/welcome_sign_screen.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/controller/paywall_bloc.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/subscription_screen.dart';
import 'package:aichat/src/features/onboarding/wizard/presentation/wizard_screen.dart';
import 'package:aichat/src/features/splash/presentation/controller/splash_bloc.dart';
import 'package:aichat/src/features/splash/presentation/splash_screen.dart';
import 'package:aichat/src/router/navigation_observer.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static AppRouter? _instance;
  final GoRouter _router;

  GoRouter get router => _router;

  AppRouter._(this._router);

  factory AppRouter.init(bool isLoggedIn) {
    if (_instance != null) {
      return _instance!;
    }

    final rootNavigatorKey = GlobalKey<NavigatorState>();
    final mainObserver = MyNavigatorObserver();

    final GoRouter router = GoRouter(
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: true,
      initialLocation: RoutesName.splash.rootPath,
      observers: [mainObserver],
      routes: [
        GoRoute(
          name: RoutesName.splash.name,
          path: RoutesName.splash.rootPath,
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) => NoTransitionPage(
            child: MultiBlocProvider(
              providers: [BlocProvider<SplashBloc>(create: (_) => locator<SplashBloc>())],
              child: SplashScreen(isLoggedIn: isLoggedIn),
            ),
          ),
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
          pageBuilder: (context, state) => NoTransitionPage(
            child: MultiBlocProvider(
              providers: [BlocProvider<SignBloc>(create: (_) => locator<SignBloc>())],
              child: const WelcomeSignScreen(),
            ),
          ),
          routes: [
            GoRoute(
              name: RoutesName.emailSignUp.name,
              path: RoutesName.emailSignUp.path,
              pageBuilder: (context, state) => NoTransitionPage(
                child: MultiBlocProvider(
                  providers: [BlocProvider<SignBloc>(create: (_) => locator<SignBloc>())],
                  child: const EmailSignUpScreen(),
                ),
              ),
            ),
            GoRoute(
              name: RoutesName.emailSignIn.name,
              path: RoutesName.emailSignIn.path,
              pageBuilder: (context, state) => NoTransitionPage(
                child: MultiBlocProvider(
                  providers: [BlocProvider<SignBloc>(create: (_) => locator<SignBloc>())],
                  child: const EmailSignInScreen(),
                ),
              ),
              routes: [
                GoRoute(
                  name: RoutesName.passwordRecovery.name,
                  path: RoutesName.passwordRecovery.path,
                  pageBuilder: (context, state) {
                    final preFilledEmail = state.extra as String? ?? "";
                    return NoTransitionPage(
                      child: BlocProvider<PasswordRecoveryBloc>(
                        create: (_) => locator<PasswordRecoveryBloc>(),
                        child: PasswordRecoveryScreen(preFilledEmail: preFilledEmail),
                      ),
                    );
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
          pageBuilder: (context, state) => NoTransitionPage(
            child: BlocProvider<PaywallBloc>(create: (_) => locator<PaywallBloc>(), child: const SubscriptionScreen()),
          ),
        ),
        GoRoute(
          name: RoutesName.home.name,
          path: RoutesName.home.rootPath,
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) => NoTransitionPage(
            child: BlocProvider<AiTutorBloc>(create: (_) => locator<AiTutorBloc>(), child: const MainScreen()),
          ),
        ),
      ],
    );

    _instance = AppRouter._(router);
    return _instance!;
  }
}
