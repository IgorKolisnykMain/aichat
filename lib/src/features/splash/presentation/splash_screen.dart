import 'package:aichat/src/features/splash/presentation/controller/splash_controller.dart';
import 'package:aichat/src/features/splash/presentation/controller/splash_state.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:aichat/src/utils/async_value_ui.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(splashControllerProvider, (_, state) {
      state.showSnackBarOnError(context);
      state.whenData((data) =>
        switch (data.stage) {
          SplashStage.showWelcomeScreen => context.goNamed(RoutesName.wizard.name),
          SplashStage.showMainScreen => context.goNamed(RoutesName.home.name),
          _ => null,
        }
      );
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 260.rh,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/splash_logo.png'), fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.rw, 36.rsp, 16.rw, 12.rsp),
                    child: Text(
                      context.l10n.splashTitle,
                      style: context.textStyles.splashTitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.rw, 4.rsp, 16.rw, 12.rsp),
                    child: Text(
                      context.l10n.splashSubtitle,
                      style: context.textStyles.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.rh),
          ],
        ),
      ),
    );
  }
}
