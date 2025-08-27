import 'package:aichat/src/features/ai_chat/presentation/main_screen.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/email_sign_in_screen.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/email_sign_up_screen.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/password_recovery/password_recovery_screen.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/welcome_sign_screen.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/subscription_screen.dart';
import 'package:aichat/src/features/onboarding/wizard/presentation/wizard_screen.dart';
import 'package:aichat/src/features/splash/presentation/splash_screen.dart';
import 'package:aichat/src/features/store/presentation/screens/store_screen.dart';
import 'package:aichat/src/router/arguments/email_arg.dart';
import 'package:aichat/src/router/go_router_refresh_stream.dart';
import 'package:aichat/src/router/navigation_observer.dart';
import 'package:aichat/src/router/not_found_screen.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final mainObserver = MyNavigatorObserver();
  final authRepository = ref.read(authRepoProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: RoutesName.splash.rootPath,
    observers: [mainObserver],
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    redirect: (context, state) {
      final authRepoAsync = ref.read(authRepoProvider);
      final isLoggedIn = authRepoAsync.currentUser != null;

      final path = state.uri.path;
      if (isLoggedIn && (path.startsWith(RoutesName.welcomeSign.rootPath) || path == RoutesName.wizard.rootPath)) {
        return RoutesName.home.rootPath;
      } else if (!isLoggedIn && (path == RoutesName.home.rootPath)) {
        return RoutesName.welcomeSign.rootPath;
      }
      return null;
    },
    errorPageBuilder: (context, state) => const NoTransitionPage(child: NotFoundScreen()),
    routes: getRoutes(rootNavigatorKey: rootNavigatorKey),
  );
}

List<RouteBase> getRoutes({GlobalKey<NavigatorState>? rootNavigatorKey}) => [
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
  getAuthFlow(parentNavigatorKey: rootNavigatorKey),
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
  GoRoute(
    name: RoutesName.store.name,
    path: RoutesName.store.rootPath,
    parentNavigatorKey: rootNavigatorKey,
    pageBuilder: (context, state) => const NoTransitionPage(child: StoreScreen()),
  ),
];

GoRoute getAuthFlow({GlobalKey<NavigatorState>? parentNavigatorKey}) => GoRoute(
  name: RoutesName.welcomeSign.name,
  path: RoutesName.welcomeSign.rootPath,
  parentNavigatorKey: parentNavigatorKey,
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
            final emailArg = EmailArg.fromJson(state.uri.queryParameters);
            final preFilledEmail = emailArg.email;
            return NoTransitionPage(child: PasswordRecoveryScreen(preFilledEmail: preFilledEmail));
          },
        ),
      ],
    ),
  ],
);
