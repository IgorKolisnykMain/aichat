import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';

class SubscriptionHeaderWidget extends StatelessWidget {
  final VoidCallback onBack;
  const SubscriptionHeaderWidget({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.backgroundLight,
      padding: EdgeInsets.symmetric(
        horizontal: context.dimensions.paddingMedium.rw,
        vertical: context.dimensions.paddingSmall.rsp,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onBack,
            icon: Icon(Icons.arrow_back, size: 24.rsp, color: context.colors.textPrimary),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(minWidth: 48.rw, minHeight: 48.rsp),
          ),
          Text(context.l10n.chooseYourPlan, style: context.textStyles.subscriptionTitle),
          SizedBox(width: 48.rw),
        ],
      ),
    );
  }
}
