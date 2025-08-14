import 'package:aichat/src/common_widgets/app_bars/auth_app_bar.dart';
import 'package:aichat/src/common_widgets/buttons/app_primary_button.dart';
import 'package:aichat/src/common_widgets/inputs/app_text_form_field.dart';
import 'package:aichat/src/common_widgets/loading/loading_indicator.dart';
import 'package:aichat/src/common_widgets/responsive_UI/responsive_center.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_controller.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_state.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:aichat/src/utils/async_value_ui.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EmailSignUpScreen extends ConsumerStatefulWidget {
  const EmailSignUpScreen({super.key});

  @override
  ConsumerState<EmailSignUpScreen> createState() => _EmailSignUpScreenState();
}

class _EmailSignUpScreenState extends ConsumerState<EmailSignUpScreen> {
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
      state.showSnackBarOnError(context);
      state.whenData(
        (data) => switch (data.stage) {
          SignStage.signUpSuccess => context.goNamed(RoutesName.home.name),
          _ => null,
        },
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
              const LoadingIndicator(provider: signControllerProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScreen() {
    return Form(
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
          SizedBox(height: 16.rh),
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
          const Spacer(),
          AppPrimaryButton.infinity(
            text: context.l10n.signUp,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ref
                    .read(signControllerProvider.notifier)
                    .signUpViaEmail(email: _emailController.text.trim(), password: _passwordController.text);
              }
            },
          ),
          SizedBox(height: 16.rh),
          GestureDetector(
            onTap: () => context.goNamed(RoutesName.emailSignIn.name),
            child: Text(
              context.l10n.haveAccountLogIn,
              style: context.textStyles.authLink.copyWith(color: context.colors.primaryDark),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
