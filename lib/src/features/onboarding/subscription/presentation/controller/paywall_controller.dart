import 'package:aichat/src/features/onboarding/subscription/data/repo/purchases_repository_impl.dart';
import 'package:aichat/src/features/onboarding/subscription/domain/models/offering_metadata_model.dart';
import 'package:aichat/src/features/onboarding/subscription/domain/repo/purchases_repository.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/controller/paywall_event.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/controller/paywall_state.dart';
import 'package:aichat/src/utils/connection/data/services/connectivity_detector_service_impl.dart';
import 'package:aichat/src/utils/connection/domain/services/connectivity_detector_service.dart';
import 'package:aichat/src/utils/error/domain/models/no_internet_exception.dart';
import 'package:aichat/src/utils/pay/paywall_package_utils.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final paywallControllerProvider = AsyncNotifierProvider.autoDispose<PaywallController, PaywallState>(
  () => PaywallController(),
);

class PaywallController extends AsyncNotifier<PaywallState> {
  late final PurchasesRepository purchasesRepository;
  late final ConnectivityDetectorService connectivityService;
  PaywallEvent? previousEvent;

  @override
  Future<PaywallState> build() async {
    purchasesRepository = await ref.read(purchasesRepositoryProvider.future);
    connectivityService = ref.read(connectivityDetectorServiceProvider);

    return const PaywallState(
      stage: PaywallStage.initial,
      currentOffering: null,
      packagesWithFreeTrialEligible: [],
      offeringMetadata: null,
      selectedPackageId: null,
      cheapestPackageId: null,
    );
  }

  Future<void> handleEvent(PaywallEvent event) async {
    if (await connectivityService.isConnected() == false) {
      state = AsyncValue.error(NoInternetException(), StackTrace.current);
      return;
    }
    return switch (event) {
      GetCurrentOfferingEvent() => _getCurrentOffering(),
      ChangeSelectedPackageIdEvent(:final packageId) => _changeSelectedPackageId(packageId),
      PurchaseSelectedPackageEvent() => _purchaseSelectedPackage(),
      RestorePurchaseEvent() => _restorePurchase(),
    };
  }

  Future<void> _getCurrentOffering() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final currentOffering = await purchasesRepository.getCurrentOffering();
      final offeringMetadata = await purchasesRepository.getOfferingMetadata(currentOffering);
      final List<String> packagesWithFreeTrialEnabled = currentOffering != null
          ? await purchasesRepository.getPackagesWithFreeTrialEnabled(currentOffering.availablePackages)
          : [];
      final cheapestPackageId = _findCheapestPackageId(currentOffering?.availablePackages ?? []);

      return PaywallState(
        stage: PaywallStage.successGetCurrentOffering,
        currentOffering: currentOffering,
        offeringMetadata: offeringMetadata,
        packagesWithFreeTrialEligible: packagesWithFreeTrialEnabled,
        selectedPackageId: cheapestPackageId,
        cheapestPackageId: cheapestPackageId,
      );
    });
  }

  String? _findCheapestPackageId(List<Package> packages) {
    if (packages.isEmpty) return null;

    final packagesMonthlyPrice = packages.map((package) => package.getMonthlyPrice()).toList();

    final minumunPrice = packagesMonthlyPrice.whereType<double>().min;
    final firstPackageWithMinimumPrice = packages.firstWhereOrNull(
      (package) => package.getMonthlyPrice() == minumunPrice,
    );

    return firstPackageWithMinimumPrice?.identifier;
  }

  Future<void> _purchaseSelectedPackage() async {
    try {
      final selectedPackage = state.value?.currentOffering?.availablePackages.firstWhere(
        (element) => element.identifier == state.value?.selectedPackageId,
      );
      if (selectedPackage == null) return;

      state = const AsyncValue.loading();
      await purchasesRepository.purchasePackage(selectedPackage);
      state = AsyncValue.data(state.value!.copyWith(stage: PaywallStage.successPurchaseSelectedPackage));
    } catch (e, s) {
      if (e is PlatformException && e.details is Map && (e.details as Map)['userCancelled'] == true) {
        state = AsyncValue.data(state.value!.copyWith(stage: PaywallStage.initial));
        return;
      }
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> _changeSelectedPackageId(String packageId) async {
    state = AsyncValue.data(
      state.value!.copyWith(stage: PaywallStage.successChangeSelectedPackageId, selectedPackageId: packageId),
    );
  }

  Future<void> _restorePurchase() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await purchasesRepository.restorePurchases();
      return state.value!.copyWith(stage: PaywallStage.successRestorePurchase);
    });
  }
}

extension OfferingMetadataModelExt on OfferingMetadataModel {
  double getOldPrice(Package package) {
    final selectedPackage = packages.firstWhere((pkg) => pkg.id == package.identifier);
    final discountInPercentages = selectedPackage.discount;

    final oldPrice = package.storeProduct.price / (1 - (discountInPercentages / 100));

    return oldPrice;
  }
}
