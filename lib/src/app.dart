import 'package:aichat/l10n/app_localizations.dart';
import 'package:aichat/src/common_widgets/app_config_provider.dart';
import 'package:aichat/src/constants/design_sizes.dart';
import 'package:aichat/src/core/config/data/repository/app_config_repository_impl.dart';
import 'package:aichat/src/core/config/models/app_config/app_config.dart';
import 'package:aichat/src/router/app_router.dart';
import 'package:aichat/src/utils/extensions/theme_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppAdaptiveUI extends StatelessWidget {
  final AppConfig config;
  final GoRouter? router;
  const AppAdaptiveUI({required this.config, this.router});

  @override
  Widget build(BuildContext context) {
    // Wrap the app conditionally
    if (kIsWeb) {
      // For web, we can either skip ScreenUtilInit or use it with web-friendly settings
      return _App(config: config);
    } else {
      // For mobile, use ScreenUtilInit as before
      return ScreenUtilInit(
        designSize: DesignSize.mobile,
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return _App(config: config, router: router);
        },
      );
    }
  }
}

class _App extends ConsumerWidget {
  final AppConfig config;
  final GoRouter? router;

  const _App({required this.config, this.router});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = router ?? ref.watch(goRouterProvider);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    // For web, use a fixed design size that works well with web layouts
    return AppConfigProvider(
      config: config,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: createLightTheme(),
        darkTheme: createDarkTheme(),
        routerConfig: appRouter,
      ),
    );
  }
}
