import 'package:aichat/src/common_widgets/buttons/app_primary_button.dart';
import 'package:aichat/src/common_widgets/message_presenter.dart';
import 'package:aichat/src/features/onboarding/auth/domain/enums/sign_source.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_controller.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_event.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_state.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomeSignScreen extends ConsumerWidget with MessagePresenter {
  const WelcomeSignScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(signControllerProvider, (previousState, state) {
      switch (state.value?.stage) {
        case SignStage.signInSuccess:
          context.goNamed(RoutesName.home.name);
        case SignStage.signUpSuccess:
          context.goNamed(RoutesName.home.name);
        case SignStage.error:
          showSnackBar(context.l10n.signUpError, context);
        default:
          break;
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 20.sp, 16.w, 8.sp),
                    child: Text(
                      context.l10n.splashTitle,
                      style: context.textStyles.authBrand,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    child: Container(
                      height: 451.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/welcome_illustration.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 4.sp, 16.w, 12.sp),
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
              padding: EdgeInsets.fromLTRB(16.w, 12.sp, 16.w, 0),
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
                            margin: EdgeInsets.only(bottom: 12.sp),
                          ),
                          AppPrimaryButton.infinity(
                            text: context.l10n.continueWithGoogle,
                            onPressed: isLoading
                                ? null
                                : () => ref.read(signControllerProvider.notifier).signVia(SignSource.google),
                            color: context.colors.backgroundAccent,
                            margin: EdgeInsets.only(bottom: 12.sp),
                          ),
                        ],
                      );
                    },
                  ),
                  AppPrimaryButton.infinity(
                    text: context.l10n.continueWithEmail,
                    onPressed: () => context.goNamed(RoutesName.emailSignUp.name),
                    margin: EdgeInsets.only(bottom: 12.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
