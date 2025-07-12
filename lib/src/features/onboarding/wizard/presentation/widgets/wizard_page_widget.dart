import 'package:aichat/src/common_widgets/buttons/app_outlined_button.dart';
import 'package:aichat/src/common_widgets/buttons/app_primary_button.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class WizardPageWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onSkip;
  final VoidCallback onNext;
  final String buttonText;

  const WizardPageWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onSkip,
    required this.onNext,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.rw, 20.rsp, 16.rw, 12.rsp),
                child: Text(title, style: context.textStyles.onboardingTitle, textAlign: TextAlign.center),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.rw, 4.rsp, 16.rw, 12.rsp),
                child: Text(subtitle, style: context.textStyles.bodyLarge, textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16.rw, 12.rsp, 16.rw, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppOutlinedButton(text: context.l10n.skip, onPressed: onSkip),
              AppPrimaryButton(text: buttonText, onPressed: onNext, horizontalPadding: 16.rw),
            ],
          ),
        ),
        SizedBox(height: 20.rh),
      ],
    );
  }
}
