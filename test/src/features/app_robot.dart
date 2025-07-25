import 'package:aichat/l10n/app_localizations.dart';
import 'package:aichat/src/app.dart';
import 'package:aichat/src/core/config/data/repository/app_config_repository_impl.dart';
import 'package:aichat/src/core/config/models/app_config/app_config.dart';
import 'package:aichat/src/router/app_router.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:aichat/src/utils/app/domain/enums/user_platform.dart';
import 'package:aichat/src/utils/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../domain/models/tests_type.dart';
import '../mocks.dart';
import '../utils/configurate_widget_tester.dart';

class AppRobot {
  final WidgetTester tester;
  final Size designSize;
  final GoRouter? goRouter;
  final TestsType testsType;

  AppRobot._({required this.tester, required this.designSize, this.goRouter, this.testsType = TestsType.widgetTest}) {
    GoRouter.optionURLReflectsImperativeAPIs = true;
  }

  AppRobot.integrationTest({
    required this.tester,
    required this.designSize,
    this.goRouter,
    this.testsType = TestsType.integrationTest,
  }) {
    // Set GoRouter configuration for tests
    GoRouter.optionURLReflectsImperativeAPIs = true;
  }

  static Future<AppRobot> widgetTest({
    required WidgetTester tester,
    required Size designSize,
    GoRouter? goRouter,
    TestsType testsType = TestsType.widgetTest,
  }) async {
    final appRobot = AppRobot._(tester: tester, designSize: designSize, goRouter: goRouter, testsType: testsType);
    await setSurfaceSize(tester, designSize);
    return appRobot;
  }

  Future<void> pumpAppScreen({required List<Override> overrides}) async {
    final appConfigRepo = await AppConfigRepositoryImpl.init();
    final appOverrides = [appConfigRepositoryProvider.overrideWith((ref) => appConfigRepo), ...overrides];
    await tester.pumpWidget(
      ProviderScope(
        overrides: appOverrides,
        child: AppAdaptiveUI(config: appConfigRepo.config, router: goRouter),
      ),
    );
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
  }

  Future<void> pumpAppWithScreen({required List<Override> overrides, required RoutesName screen}) async {
    final appConfigRepo = MockAppConfigRepository();
    when(() => appConfigRepo.config).thenReturn(
      AppConfig(
        platform: UserPlatform.undefined,
        revenueCatPublicKey: '',
        bundleId: '',
        buildNumber: '',
        version: '',
        appName: '',
        supportEmail: '',
        privacyPolicyUrl: '',
        termsOfUseUrl: '',
      ),
    );
    final appOverrides = [appConfigRepositoryProvider.overrideWith((ref) => appConfigRepo), ...overrides];
    await tester.pumpWidget(
      ProviderScope(
        overrides: appOverrides,
        child: AppAdaptiveUI(
          config: appConfigRepo.config,
          router: GoRouter(initialLocation: screen.rootPath, routes: getRoutes()),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
  }

  Future<void> pumpCustomAppScreen({required List<Override> overrides, required Widget screen}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: overrides,
        child: ScreenUtilInit(
          designSize: designSize,
          useInheritedMediaQuery: true,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return goRouter != null
                ? MaterialApp.router(
                    routerConfig: goRouter,
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: AppLocalizations.supportedLocales,
                    theme: createLightTheme(),
                    darkTheme: createDarkTheme(),
                  )
                : MaterialApp(
                    home: screen,
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: AppLocalizations.supportedLocales,
                    theme: createLightTheme(),
                    darkTheme: createDarkTheme(),
                  );
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
  }
}
