import 'package:aichat/src/features/onboarding/subscription/domain/enums/subscription_plan.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class SubscriptionPlanCard extends StatelessWidget {
  final SubscriptionPlan plan;
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionPlanCard({super.key, required this.plan, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.all(24.rsp),
        decoration: BoxDecoration(
          color: context.colors.backgroundLight,
          borderRadius: BorderRadius.circular(12.rr),
          border: Border.all(
            color: isSelected ? context.colors.primaryLight : context.colors.borderSubtle,
            width: isSelected ? 2.rw : 1.rw,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: 16.rsp),
            _buildFeatures(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_getPlanTitle(context), style: context.textStyles.planTitle),
            if (plan == SubscriptionPlan.yearly)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.rw, vertical: 3.rsp),
                decoration: BoxDecoration(
                  color: context.colors.primaryLight,
                  borderRadius: BorderRadius.circular(12.rr),
                ),
                child: Text(context.l10n.save20Percent, style: context.textStyles.saveBadge),
              ),
          ],
        ),
        SizedBox(height: 4.rsp),
        _buildPriceText(context),
      ],
    );
  }

  Widget _buildPriceText(BuildContext context) {
    switch (plan) {
      case SubscriptionPlan.freeTrial:
        return Text(context.l10n.freeTrialDescription, style: context.textStyles.planTitle);
      case SubscriptionPlan.monthly:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('\$9.99', style: context.textStyles.priceDisplay.copyWith(letterSpacing: -0.02.rw)),
            SizedBox(width: 4.rw),
            Text(context.l10n.perMonth, style: context.textStyles.planTitle),
          ],
        );
      case SubscriptionPlan.yearly:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('\$99', style: context.textStyles.priceDisplay.copyWith(letterSpacing: -0.02.rw)),
            SizedBox(width: 4.rw),
            Text(context.l10n.perYear, style: context.textStyles.planTitle),
          ],
        );
    }
  }

  Widget _buildFeatures(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFeatureItem(context, context.l10n.unlimitedAIChats),
        SizedBox(height: 8.rsp),
        _buildFeatureItem(context, context.l10n.weeklySummary),
      ],
    );
  }

  Widget _buildFeatureItem(BuildContext context, String text) {
    return Row(
      children: [
        Icon(Icons.check_circle, size: 20.rsp, color: context.colors.textPrimary),
        SizedBox(width: 12.rw),
        Text(text, style: context.textStyles.bodySmall),
      ],
    );
  }

  String _getPlanTitle(BuildContext context) {
    switch (plan) {
      case SubscriptionPlan.freeTrial:
        return context.l10n.freeTrial;
      case SubscriptionPlan.monthly:
        return context.l10n.monthly;
      case SubscriptionPlan.yearly:
        return context.l10n.yearly;
    }
  }
}
