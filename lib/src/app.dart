import 'package:aichat/l10n/app_localizations.dart';
import 'package:aichat/src/common_widgets/app_config_provider.dart';
import 'package:aichat/src/core/config/models/app_config/app_config.dart';
import 'package:aichat/src/router/app_router.dart';
import 'package:aichat/src/utils/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  final AppConfig appConfig;
  final AppRouter appRouter;

  const App({super.key, required this.appConfig, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AppConfigProvider(
          config: appConfig,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) {
              return child!;
            },
            theme: createLightTheme(),
            darkTheme: createDarkTheme(),
            routerConfig: appRouter.router,
          ),
        );
      },
    );
  }
}
