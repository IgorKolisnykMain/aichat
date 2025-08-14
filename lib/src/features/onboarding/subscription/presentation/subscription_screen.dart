import 'package:aichat/src/common_widgets/loading/loading_indicator.dart';
import 'package:aichat/src/common_widgets/responsive_UI/responsive_center.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/controller/paywall_controller.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/controller/paywall_event.dart'
    show ChangeSelectedPackageIdEvent, GetCurrentOfferingEvent, PurchaseSelectedPackageEvent, RestorePurchaseEvent;
import 'package:aichat/src/features/onboarding/subscription/presentation/controller/paywall_state.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/widgets/subscription_bottom_section_widget.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/widgets/subscription_header_widget.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/widgets/subscription_plan_card.dart';
import 'package:aichat/src/router/route_name.dart';
import 'package:aichat/src/utils/async_value_ui.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/package_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SubscriptionScreen extends ConsumerStatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  ConsumerState<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends ConsumerState<SubscriptionScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(paywallControllerProvider.notifier).handleEvent(GetCurrentOfferingEvent());
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(paywallControllerProvider, (previousState, state) {
      state.showSnackBarOnError(context);
      state.whenData(
        (data) => switch (data.stage) {
          PaywallStage.successPurchaseSelectedPackage => context.goNamed(RoutesName.home.name),
          PaywallStage.successRestorePurchase => context.goNamed(RoutesName.home.name),
          _ => null,
        },
      );
    });

    return Scaffold(
      backgroundColor: context.colors.white,
      body: SafeArea(
        child: ResponsiveCenter(
          child: Stack(
            children: [
              Column(
                children: [
                  SubscriptionHeaderWidget(onBack: () => context.pop()),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.dimensions.paddingMedium.rw),
                        child: buildScreen(),
                      ),
                    ),
                  ),
                  SubscriptionBottomSectionWidget(
                    onContinue: () =>
                        ref.read(paywallControllerProvider.notifier).handleEvent(PurchaseSelectedPackageEvent()),
                    onRestore: () => ref.read(paywallControllerProvider.notifier).handleEvent(RestorePurchaseEvent()),
                  ),
                ],
              ),
              const LoadingIndicator(provider: paywallControllerProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildScreen() {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(paywallControllerProvider.select((state) => state.value));
        return Column(
          children: [
            SizedBox(height: 12.rsp),
            ...state!.currentOffering!.availablePackages.map((package) {
              final plan = package.mapPackageToPlan();
              if (plan == null) return const SizedBox.shrink();

              return Padding(
                padding: EdgeInsets.only(bottom: 10.rsp),
                child: SubscriptionPlanCard(
                  plan: plan,
                  isSelected: state.selectedPackageId == package.identifier,
                  onTap: () => ref
                      .read(paywallControllerProvider.notifier)
                      .handleEvent(ChangeSelectedPackageIdEvent(package.identifier)),
                ),
              );
            }),
            SizedBox(height: 14.rsp),
          ],
        );
      },
    );
  }
}
