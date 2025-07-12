import 'package:aichat/generated/assets.gen.dart';
import 'package:aichat/src/common_widgets/buttons/app_primary_button.dart';
import 'package:aichat/src/common_widgets/message_presenter.dart';
import 'package:aichat/src/common_widgets/responsive_UI/responsive_center.dart';
import 'package:aichat/src/features/onboarding/auth/domain/enums/sign_source.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_controller.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_state.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WelcomeSignScreen extends ConsumerWidget with MessagePresenter {
  const WelcomeSignScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(signControllerProvider, (previousState, state) {
      state.when(
        data: (data) => switch (data.stage) {
          SignStage.signInSuccess => context.goNamed(RoutesName.home.name),
          SignStage.signUpSuccess => context.goNamed(RoutesName.home.name),
          _ => null,
        },
        error: (error, stackTrace) => showSnackBar(context.l10n.signUpError, context),
        loading: () {},
      );
    });

    return Scaffold(
      body: SafeArea(
        child: ResponsiveCenter(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.rw, 20.rsp, 16.rw, 8.rsp),
                      child: Text(
                        context.l10n.splashTitle,
                        style: context.textStyles.authBrand,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.rw),
                        child: Container(
                          constraints: BoxConstraints(maxHeight: 451.rh),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Assets.images.welcomeIllustration.provider(),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12.rr)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.rw, 4.rsp, 16.rw, 12.rsp),
                      child: Text(
                        context.l10n.welcomeDescription,
                        style: context.textStyles.authBody,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.rw, 12.rsp, 16.rw, 0),
                child: Column(
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        final isLoading = ref.watch(signControllerProvider.select((state) => state.isLoading));
                        return Column(
                          children: [
                            AppPrimaryButton.infinity(
                              text: context.l10n.continueWithApple,
                              onPressed: isLoading
                                  ? null
                                  : () => ref.read(signControllerProvider.notifier).signVia(SignSource.apple),
                              margin: EdgeInsets.only(bottom: 12.rsp),
                            ),
                            AppPrimaryButton.infinity(
                              text: context.l10n.continueWithGoogle,
                              onPressed: isLoading
                                  ? null
                                  : () => ref.read(signControllerProvider.notifier).signVia(SignSource.google),
                              color: context.colors.backgroundAccent,
                              margin: EdgeInsets.only(bottom: 12.rsp),
                            ),
                          ],
                        );
                      },
                    ),
                    AppPrimaryButton.infinity(
                      text: context.l10n.continueWithEmail,
                      onPressed: () => context.goNamed(RoutesName.emailSignUp.name),
                      margin: EdgeInsets.only(bottom: 12.rsp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.rh),
            ],
          ),
        ),
      ),
    );
  }
}
