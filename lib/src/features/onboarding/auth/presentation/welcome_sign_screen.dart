import 'package:aichat/src/common_widgets/buttons/app_primary_button.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_bloc.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_event.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomeSignScreen extends StatelessWidget {
  const WelcomeSignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignBloc, SignState>(
      listener: (context, state) {
        switch (state.stage) {
          case SignStage.signInSuccess:
            context.goNamed(RoutesName.home.name);
          case SignStage.signUpSuccess:
            context.goNamed(RoutesName.home.name);
          case SignStage.error:
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
          default:
            break;
        }
      },
      child: Scaffold(
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
                    BlocBuilder<SignBloc, SignState>(
                      builder: (context, state) {
                        final isLoading = state.stage == SignStage.loading;
                        return Column(
                          children: [
                            AppPrimaryButton.infinity(
                              text: context.l10n.continueWithApple,
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      context.read<SignBloc>().add(SignViaAppleEvent());
                                    },
                              margin: EdgeInsets.only(bottom: 12.sp),
                            ),
                            AppPrimaryButton.infinity(
                              text: context.l10n.continueWithGoogle,
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      context.read<SignBloc>().add(SignViaGoogleEvent());
                                    },
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
      ),
    );
  }
}
