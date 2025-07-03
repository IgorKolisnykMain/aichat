import 'package:aichat/core/extensions/build_context_extensions.dart';
import 'package:aichat/core/utils/message_presenter.dart';
import 'package:aichat/presentation/features/sign/password_recovery/bloc/password_recovery_bloc.dart';
import 'package:aichat/presentation/features/sign/password_recovery/bloc/password_recovery_event.dart';
import 'package:aichat/presentation/features/sign/password_recovery/bloc/password_recovery_state.dart';
import 'package:aichat/presentation/widgets/app_bars/auth_app_bar.dart';
import 'package:aichat/presentation/widgets/bloc/bloced_state.dart';
import 'package:aichat/presentation/widgets/buttons/app_primary_button.dart';
import 'package:aichat/presentation/widgets/inputs/app_text_form_field.dart';
import 'package:aichat/presentation/widgets/loading/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  final String preFilledEmail;

  const PasswordRecoveryScreen({super.key, required this.preFilledEmail});

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState
    extends BlocedState<PasswordRecoveryScreen, PasswordRecoveryBloc, PasswordRecoveryState>
    with MessagePresenter {
  late final TextEditingController _emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.preFilledEmail);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  void didChangeBlocState(PasswordRecoveryState? previousState, PasswordRecoveryState state) {
    super.didChangeBlocState(previousState, state);
    switch (state.stage) {
      case PasswordRecoveryStage.success:
        showSnackBar(context.l10n.passwordResetEmailSent(state.email), context, const Duration(seconds: 3));
        context.pop();
      case PasswordRecoveryStage.error:
        showSnackBar(context.l10n.passwordResetFailed, context);
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
            Padding(padding: EdgeInsets.fromLTRB(16.w, 16.sp, 16.w, 8.sp), child: buildScreen()),
            blocBuilder(
              builder: (context, state) =>
                  state.stage == PasswordRecoveryStage.loading ? const LoadingIndicator() : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildScreen() {
    return Column(
      children: [
        const Spacer(),
        Form(
          key: _formKey,
          child: AppTextFormField(
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
        ),
        const Spacer(),
        AppPrimaryButton.infinity(
          text: context.l10n.recoverPassword,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              bloc.add(RecoverPasswordEvent(email: _emailController.text.trim()));
            }
          },
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
