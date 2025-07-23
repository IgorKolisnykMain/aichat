import 'package:aichat/src/common_widgets/app_bars/auth_app_bar.dart';
import 'package:aichat/src/common_widgets/buttons/app_primary_button.dart';
import 'package:aichat/src/common_widgets/inputs/app_text_form_field.dart';
import 'package:aichat/src/common_widgets/loading/loading_indicator.dart';
import 'package:aichat/src/common_widgets/message_presenter.dart';
import 'package:aichat/src/common_widgets/responsive_UI/responsive_center.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_controller.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_state.dart';
import 'package:aichat/src/router/arguments/email_arg.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:aichat/src/utils/validators/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EmailSignInScreen extends ConsumerStatefulWidget {
  // * Keys for testing using find.byKey()
  static const emailKey = Key('email_text_form_field');
  static const passwordKey = Key('password_text_form_field');

  const EmailSignInScreen({super.key});

  @override
  ConsumerState<EmailSignInScreen> createState() => _EmailSignInScreenState();
}

class _EmailSignInScreenState extends ConsumerState<EmailSignInScreen> with MessagePresenter {
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
  Widget build(BuildContext context) {
    ref.listen(signControllerProvider, (previousState, state) {
      state.when(
        data: (data) => switch (data.stage) {
          SignStage.signInSuccess => context.goNamed(RoutesName.home.name),
          _ => null,
        },
        error: (error, stackTrace) => showSnackBar(context.l10n.signInError, context),
        loading: () {},
      );
    });

    return Scaffold(
      appBar: const AuthAppBar(),
      body: SafeArea(
        //todo create ResponsiveSafeArea widget with loading indicator
        child: ResponsiveCenter(
          child: Stack(
            children: [
              Padding(padding: EdgeInsets.all(16.rw), child: _buildScreen()),
              LoadingIndicator(provider: signControllerProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScreen() {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight:
              MediaQuery.of(context).size.height -
              kToolbarHeight -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom -
              32.rh,
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Spacer(),
                      AppTextFormField(
                        key: EmailSignInScreen.emailKey,
                        controller: _emailController,
                        hintText: context.l10n.emailAddress,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context.l10n.pleaseEnterEmail;
                          }
                          if (!EmailValidator().validate(value)) {
                            return context.l10n.pleaseEnterValidEmail;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.rh),
                      AppTextFormField(
                        key: EmailSignInScreen.passwordKey,
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
                      SizedBox(height: 12.rh),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          //todo remove comment code
                          // onTap: () => context.goNamed(RoutesName.passwordRecovery.name, pathParameters: {"email": _emailController.text}),
                          onTap: () => context.goNamed(
                            RoutesName.passwordRecovery.name,
                            queryParameters: EmailArg(email: _emailController.text).toJson(),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.rsp),
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
                            ref
                                .read(signControllerProvider.notifier)
                                .signInViaEmail(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text,
                                );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 4.rsp, 0, 12.rsp),
                child: GestureDetector(
                  onTap: () => context.goNamed(RoutesName.emailSignUp.name),
                  child: Text(
                    context.l10n.dontHaveAccountSignUp,
                    style: context.textStyles.authLink.copyWith(color: context.colors.primaryMedium),
                    textAlign: TextAlign.center,
                  ),
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
