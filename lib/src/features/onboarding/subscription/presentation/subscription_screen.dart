import 'package:aichat/src/common_widgets/bloc/bloced_state.dart';
import 'package:aichat/src/common_widgets/buttons/app_primary_button.dart';
import 'package:aichat/src/common_widgets/loading/loading_indicator.dart';
import 'package:aichat/src/common_widgets/message_presenter.dart';
import 'package:aichat/src/features/onboarding/subscription/domain/enums/subscription_plan.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/controller/paywall_controller.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/controller/paywall_event.dart'
    show ChangeSelectedPackageIdEvent, GetCurrentOfferingEvent, PurchaseSelectedPackageEvent, RestorePurchaseEvent;
import 'package:aichat/src/features/onboarding/subscription/presentation/controller/paywall_state.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/widgets/subscription_plan_card.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class SubscriptionScreen extends ConsumerStatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  ConsumerState<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends ConsumerState<SubscriptionScreen> with MessagePresenter {
  final horizontalPadding = 16.w;

  @override
  void initState() {
    super.initState();
    ref.read(paywallControllerProvider.notifier).handleEvent(GetCurrentOfferingEvent());
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(paywallControllerProvider, (previousState, state) {
      switch (state.value?.stage) {
        case PaywallStage.error:
          showSnackBar(state.error?.toString() ?? context.l10n.genericError, context);
        case PaywallStage.successPurchaseSelectedPackage:
        case PaywallStage.successRestorePurchase:
          context.goNamed(RoutesName.home.name);
        default:
          break;
      }
    });

    return Scaffold(
      backgroundColor: context.colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: buildScreen(),
                    ),
                  ),
                ),
                _buildBottomSection(),
              ],
            ),
            LoadingIndicator(provider: paywallControllerProvider),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: context.colors.backgroundLight,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.arrow_back, size: 24.sp, color: context.colors.textPrimary),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(minWidth: 48.w, minHeight: 48.sp),
          ),
          Text(context.l10n.chooseYourPlan, style: context.textStyles.subscriptionTitle),
          SizedBox(width: 48.w),
        ],
      ),
    );
  }

  Widget buildScreen() {
    final state = ref.watch(paywallControllerProvider.select((state) => state.value));
    return Column(
      children: [
        SizedBox(height: 12.sp),
        ...state!.currentOffering!.availablePackages.map((package) {
          final plan = _mapPackageToPlan(package);
          if (plan == null) return const SizedBox.shrink();

          return Padding(
            padding: EdgeInsets.only(bottom: 10.sp),
            child: SubscriptionPlanCard(
              plan: plan,
              isSelected: state.selectedPackageId == package.identifier,
              onTap: () => ref
                  .read(paywallControllerProvider.notifier)
                  .handleEvent(ChangeSelectedPackageIdEvent(package.identifier)),
            ),
          );
        }),
        SizedBox(height: 14.sp),
      ],
    );
  }

  SubscriptionPlan? _mapPackageToPlan(Package package) {
    if (package.packageType == PackageType.monthly) {
      return SubscriptionPlan.monthly;
    } else if (package.packageType == PackageType.annual) {
      return SubscriptionPlan.yearly;
    } else if (package.identifier.toLowerCase().contains('trial')) {
      return SubscriptionPlan.freeTrial;
    }
    return null;
  }

  Widget _buildBottomSection() {
    return ColoredBox(
      color: context.colors.backgroundLight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppPrimaryButton(
            text: context.l10n.continueText,
            onPressed: () => ref.read(paywallControllerProvider.notifier).handleEvent(PurchaseSelectedPackageEvent()),
            horizontalPadding: horizontalPadding,
          ),
          GestureDetector(
            onTap: () => ref.read(paywallControllerProvider.notifier).handleEvent(RestorePurchaseEvent()),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.fromLTRB(horizontalPadding, 4.sp, horizontalPadding, 12.sp),
              child: Text(
                context.l10n.alreadySubscribedRestore,
                style: context.textStyles.bodyMedium.copyWith(color: context.colors.primary),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 20.sp),
        ],
      ),
    );
  }
}
