import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:aichat/core/di/locator.dart';
import 'package:aichat/navigation/navigation_observer.dart';
import 'package:aichat/navigation/route_name.dart';
import 'package:aichat/presentation/features/ai_chat/bloc/ai_tutor_bloc.dart';
import 'package:aichat/presentation/features/ai_chat/main_screen.dart';
import 'package:aichat/presentation/features/sign/bloc/sign_bloc.dart';
import 'package:aichat/presentation/features/sign/email_sign_in_screen.dart';
import 'package:aichat/presentation/features/sign/email_sign_up_screen.dart';
import 'package:aichat/presentation/features/sign/password_recovery/bloc/password_recovery_bloc.dart';
import 'package:aichat/presentation/features/sign/password_recovery/password_recovery_screen.dart';
import 'package:aichat/presentation/features/sign/welcome_sign_screen.dart';
import 'package:aichat/presentation/features/splash/bloc/splash_bloc.dart';
import 'package:aichat/presentation/features/splash/splash_screen.dart';
import 'package:aichat/presentation/features/subscription/bloc/paywall_bloc.dart';
import 'package:aichat/presentation/features/subscription/subscription_screen.dart';
import 'package:aichat/presentation/features/wizard/wizard_screen.dart';

class AppRouter {
  final GoRouter _router;

  GoRouter get router => _router;

  const AppRouter._(this._router);

  static AppRouter init(bool isLoggedIn) {
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
    return AppRouter._(router);
  }
}
