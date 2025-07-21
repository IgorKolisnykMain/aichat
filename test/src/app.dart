import 'package:aichat/l10n/app_localizations.dart';
import 'package:aichat/src/constants/design_sizes.dart';
import 'package:aichat/src/utils/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

class AppRobot {
  final WidgetTester tester;
  final Size designSize;
  AppRobot({required this.tester, this.designSize = DesignSize.mobile});
    Future<void> pumpScreen({required List<Override> overrides, Widget? screen}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: overrides,
        child: ScreenUtilInit(
          designSize: designSize,
          useInheritedMediaQuery: true,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
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
}
