import 'package:aichat/src/common_widgets/buttons/app_primary_button.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';

class SubscriptionBottomSectionWidget extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onRestore;
  const SubscriptionBottomSectionWidget({super.key, required this.onContinue, required this.onRestore});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.backgroundLight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppPrimaryButton(
            text: context.l10n.continueText,
            onPressed: onContinue,
            horizontalPadding: context.dimensions.paddingMedium.rw,
          ),
          GestureDetector(
            onTap: onRestore,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                context.dimensions.paddingMedium.rw,
                4.rsp,
                context.dimensions.paddingMedium.rw,
                12.rsp,
              ),
              child: Text(
                context.l10n.alreadySubscribedRestore,
                style: context.textStyles.bodyMedium.copyWith(color: context.colors.primary),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 20.rsp),
        ],
      ),
    );
  }
}
