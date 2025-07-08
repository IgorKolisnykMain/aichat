import 'package:aichat/src/common_widgets/app_bars/auth_app_bar.dart';
import 'package:aichat/src/common_widgets/bloc/bloced_state.dart';
import 'package:aichat/src/common_widgets/buttons/app_primary_button.dart';
import 'package:aichat/src/common_widgets/inputs/app_text_form_field.dart';
import 'package:aichat/src/common_widgets/loading/loading_indicator.dart';
import 'package:aichat/src/common_widgets/message_presenter.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_bloc.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_event.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EmailSignInScreen extends StatefulWidget {
  const EmailSignInScreen({super.key});

  @override
  State<EmailSignInScreen> createState() => _EmailSignInScreenState();
}

class _EmailSignInScreenState extends BlocedState<EmailSignInScreen, SignBloc, SignState> with MessagePresenter {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void didChangeBlocState(SignState? previousState, SignState state) {
    super.didChangeBlocState(previousState, state);

    switch (state.stage) {
      case SignStage.signInSuccess:
        context.goNamed(RoutesName.home.name);
      case SignStage.error:
        showSnackBar(context.l10n.signInError, context);
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(padding: EdgeInsets.all(16.w), child: buildScreen()),
            blocBuilder(
              builder: (context, state) =>
                  state.stage == SignStage.loading ? const LoadingIndicator() : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildScreen() {
    return Column(
      children: [
        Expanded(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Spacer(),
                AppTextFormField(
                  controller: _emailController,
                  hintText: context.l10n.emailAddress,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10n.pleaseEnterEmail;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                AppTextFormField(
                  controller: _passwordController,
                  hintText: context.l10n.password,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10n.pleaseEnterPassword;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => context.goNamed(RoutesName.passwordRecovery.name),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.sp),
                      child: Text(
                        context.l10n.forgotPassword,
                        style: context.textStyles.authLink.copyWith(color: context.colors.primaryMedium),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                AppPrimaryButton.infinity(
                  text: context.l10n.logIn,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(
                        SignInViaEmailEvent(email: _emailController.text.trim(), password: _passwordController.text),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 4.sp, 0, 12.sp),
          child: GestureDetector(
            onTap: () => context.goNamed(RoutesName.emailSignUp.name),
            child: Text(
              context.l10n.dontHaveAccountSignUp,
              style: context.textStyles.authLink.copyWith(color: context.colors.primaryMedium),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
