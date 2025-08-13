import 'package:aichat/src/common_widgets/app_bars/auth_app_bar.dart';
import 'package:aichat/src/common_widgets/buttons/app_primary_button.dart';
import 'package:aichat/src/common_widgets/inputs/app_text_form_field.dart';
import 'package:aichat/src/common_widgets/loading/loading_indicator.dart';
import 'package:aichat/src/common_widgets/message_presenter.dart';
import 'package:aichat/src/common_widgets/responsive_UI/responsive_center.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/password_recovery/controller/password_recovery_controller.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/password_recovery/controller/password_recovery_state.dart';
import 'package:aichat/src/utils/async_value_ui.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PasswordRecoveryScreen extends ConsumerStatefulWidget {
  final String preFilledEmail;

  const PasswordRecoveryScreen({super.key, required this.preFilledEmail});

  @override
  ConsumerState<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends ConsumerState<PasswordRecoveryScreen> with MessagePresenter {
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
  Widget build(BuildContext context) {
    ref.listen(passwordRecoveryControllerProvider, (previousState, state) {
      state.showSnackBarOnError(context);
      state.whenData(
        (data) => switch (data.stage) {
          PasswordRecoveryStage.success => () {
            showSnackBar(context.l10n.passwordResetEmailSent(state.value!.email), context, const Duration(seconds: 3));
            context.pop();
          },
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
              Padding(padding: EdgeInsets.fromLTRB(16.rw, 16.rsp, 16.rw, 8.rsp), child: _buildScreen()),
              LoadingIndicator(provider: passwordRecoveryControllerProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScreen() {
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
              ref.read(passwordRecoveryControllerProvider.notifier).recoverPassword(_emailController.text.trim());
            }
          },
        ),
        SizedBox(height: 20.rh),
      ],
    );
  }
}
