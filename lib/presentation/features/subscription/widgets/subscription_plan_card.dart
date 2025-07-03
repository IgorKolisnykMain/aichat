import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aichat/core/extensions/build_context_extensions.dart';
import 'package:aichat/presentation/features/subscription/models/subscription_plan.dart';

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
        padding: EdgeInsets.all(24.sp),
        decoration: BoxDecoration(
          color: context.colors.backgroundLight,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? context.colors.primaryLight : context.colors.borderSubtle,
            width: isSelected ? 2.w : 1.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: 16.sp),
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
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.sp),
                decoration: BoxDecoration(
                  color: context.colors.primaryLight,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(context.l10n.save20Percent, style: context.textStyles.saveBadge),
              ),
          ],
        ),
        SizedBox(height: 4.sp),
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
            Text('\$9.99', style: context.textStyles.priceDisplay.copyWith(letterSpacing: -0.02.sw)),
            SizedBox(width: 4.w),
            Text(context.l10n.perMonth, style: context.textStyles.planTitle),
          ],
        );
      case SubscriptionPlan.yearly:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('\$99', style: context.textStyles.priceDisplay.copyWith(letterSpacing: -0.02.sw)),
            SizedBox(width: 4.w),
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
        SizedBox(height: 8.sp),
        _buildFeatureItem(context, context.l10n.weeklySummary),
      ],
    );
  }

  Widget _buildFeatureItem(BuildContext context, String text) {
    return Row(
      children: [
        Icon(Icons.check_circle, size: 20.sp, color: context.colors.textPrimary),
        SizedBox(width: 12.w),
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
