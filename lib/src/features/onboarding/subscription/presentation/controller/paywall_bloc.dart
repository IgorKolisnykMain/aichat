import 'package:aichat/src/features/onboarding/subscription/domain/models/offering_metadata_model.dart';
import 'package:aichat/src/features/onboarding/subscription/domain/repo/purchases_repository.dart';
import 'package:aichat/src/utils/connection/domain/services/connectivity_detector_service.dart';
import 'package:aichat/src/utils/error/domain/models/no_internet_exception.dart';
import 'package:aichat/src/utils/pay/paywall_package_utils.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

part 'paywall_bloc.freezed.dart';
part 'paywall_event.dart';
part 'paywall_state.dart';

class PaywallBloc extends Bloc<PaywallEvent, PaywallState> {
  final PurchasesRepository purchasesRepository;
  final ConnectivityDetectorService connectivityService;
  PaywallEvent? previousEvent;

  PaywallBloc({required this.purchasesRepository, required this.connectivityService})
    : super(
        const PaywallState(
          stage: PaywallStage.initial,
          currentOffering: null,
          packagesWithFreeTrialEligible: [],
          offeringMetadata: null,
          selectedPackageId: null,
          cheapestPackageId: null,
          error: null,
        ),
      ) {
    on<PaywallEvent>(_handler, transformer: droppable());
  }

  EventHandler<PaywallEvent, PaywallState> get _handler => (event, emit) async {
    if (await connectivityService.isConnected() == false) {
      emit(state.copyWith(stage: PaywallStage.error, error: NoInternetException()));
      return;
    }
    return switch (event) {
      GetCurrentOfferingEvent() => _getCurrentOffering(emit),
      ChangeSelectedPackageIdEvent(:final packageId) => _changeSelectedPackageId(emit, packageId),
      PurchaseSelectedPackageEvent() => _purchaseSelectedPackage(emit),
      RestorePurchaseEvent() => _restorePurchase(emit),
    };
  };

  @override
  void onEvent(PaywallEvent event) {
    previousEvent = event;
    super.onEvent(event);
  }

  Future<void> _getCurrentOffering(Emitter emit) async {
    try {
      emit(state.copyWith(stage: PaywallStage.loading));
      final currentOffering = await purchasesRepository.getCurrentOffering();
      final offeringMetadata = await purchasesRepository.getOfferingMetadata(currentOffering);
      final List<String> packagesWithFreeTrialEnabled = currentOffering != null
          ? await purchasesRepository.getPackagesWithFreeTrialEnabled(currentOffering.availablePackages)
          : [];
      final cheapestPackageId = _findCheapestPackageId(currentOffering?.availablePackages ?? []);

      emit(
        state.copyWith(
          stage: PaywallStage.successGetCurrentOffering,
          currentOffering: currentOffering,
          offeringMetadata: offeringMetadata,
          packagesWithFreeTrialEligible: packagesWithFreeTrialEnabled,
          selectedPackageId: cheapestPackageId,
          cheapestPackageId: cheapestPackageId,
        ),
      );
    } catch (e) {
      emit(state.copyWith(stage: PaywallStage.error, error: e));
    }
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

  Future<void> _purchaseSelectedPackage(Emitter<PaywallState> emit) async {
    try {
      final selectedPackage = state.currentOffering?.availablePackages.firstWhere(
        (element) => element.identifier == state.selectedPackageId,
      );
      if (selectedPackage == null) return;

      emit(state.copyWith(stage: PaywallStage.loading));
      await purchasesRepository.purchasePackage(selectedPackage);
      emit(state.copyWith(stage: PaywallStage.successPurchaseSelectedPackage));
    } catch (e) {
      if (e is PlatformException && e.details is Map && (e.details as Map)['userCancelled'] == true) {
        emit(state.copyWith(stage: PaywallStage.initial));
        return;
      }
      emit(state.copyWith(stage: PaywallStage.error, error: e));
    }
  }

  Future<void> _changeSelectedPackageId(Emitter emit, String packageId) async {
    emit(state.copyWith(stage: PaywallStage.successChangeSelectedPackageId, selectedPackageId: packageId));
  }

  Future<void> _restorePurchase(Emitter emit) async {
    try {
      emit(state.copyWith(stage: PaywallStage.loading));
      await purchasesRepository.restorePurchases();
      emit(state.copyWith(stage: PaywallStage.successRestorePurchase));
    } catch (e) {
      emit(state.copyWith(stage: PaywallStage.error, error: e));
    }
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
