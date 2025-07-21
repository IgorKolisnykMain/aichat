import 'package:aichat/l10n/app_localizations.dart';
import 'package:aichat/src/utils/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

class AppRobot {
  final WidgetTester tester;
  final Size designSize;
  final GoRouter? goRouter;
  AppRobot({required this.tester, required this.designSize, this.goRouter});
  Future<void> pumpAppScreen({required List<Override> overrides, required Widget screen}) async {
    await setSurfaceSize(designSize);
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
  }

  Future<void> setSurfaceSize(Size size) async {
    await tester.binding.setSurfaceSize(size);
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1.0;
  }
}
