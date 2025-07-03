import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:aichat/core/extensions/build_context_extensions.dart';
import 'package:aichat/core/utils/message_presenter.dart';
import 'package:aichat/navigation/route_name.dart';
import 'package:aichat/presentation/features/sign/bloc/sign_bloc.dart';
import 'package:aichat/presentation/features/sign/bloc/sign_event.dart';
import 'package:aichat/presentation/widgets/app_bars/auth_app_bar.dart';
import 'package:aichat/presentation/widgets/bloc/bloced_state.dart';
import 'package:aichat/presentation/widgets/buttons/app_primary_button.dart';
import 'package:aichat/presentation/widgets/inputs/app_text_form_field.dart';
import 'package:aichat/presentation/widgets/loading/loading_indicator.dart';

class EmailSignUpScreen extends StatefulWidget {
  const EmailSignUpScreen({super.key});

  @override
  State<EmailSignUpScreen> createState() => _EmailSignUpScreenState();
}

class _EmailSignUpScreenState extends BlocedState<EmailSignUpScreen, SignBloc, SignState> with MessagePresenter {
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
      case SignStage.signUpSuccess:
        context.goNamed(RoutesName.home.name);
      case SignStage.error:
        showSnackBar(context.l10n.signUpError, context);
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
          const Spacer(),
          AppPrimaryButton.infinity(
            text: context.l10n.signUp,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                bloc.add(SignUpViaEmailEvent(email: _emailController.text.trim(), password: _passwordController.text));
              }
            },
          ),
          SizedBox(height: 16.h),
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
