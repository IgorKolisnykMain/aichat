import 'package:aichat/src/features/onboarding/subscription/domain/models/offering_metadata_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/models/offering_wrapper.dart';

part 'paywall_state.freezed.dart';

@freezed
class PaywallState with _$PaywallState {
  const factory PaywallState({
    required PaywallStage stage,
    required Offering? currentOffering,
    required OfferingMetadataModel? offeringMetadata,
    required List<String> packagesWithFreeTrialEligible,
    required String? selectedPackageId,
    required String? cheapestPackageId,
  }) = _PaywallState;
}

enum PaywallStage {
  initial,
  loading,
  successGetCurrentOffering,
  successChangeSelectedPackageId,
  successPurchaseSelectedPackage,
  successRestorePurchase,
  error,
}
