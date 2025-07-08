part of 'paywall_bloc.dart';

enum PaywallStage {
  initial,
  loading,
  successGetCurrentOffering,
  successChangeSelectedPackageId,
  successPurchaseSelectedPackage,
  successRestorePurchase,
  error,
}

@freezed
class PaywallState with _$PaywallState {
  const factory PaywallState({
    required PaywallStage stage,
    required Offering? currentOffering,
    required OfferingMetadataModel? offeringMetadata,
    required List<String> packagesWithFreeTrialEligible,
    required String? selectedPackageId,
    required String? cheapestPackageId,
    required Object? error,
  }) = _PaywallState;
}
