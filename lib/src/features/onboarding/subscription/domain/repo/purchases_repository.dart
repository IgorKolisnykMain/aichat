import 'package:aichat/src/features/onboarding/subscription/domain/models/offering_metadata_model.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

// ? Maybe move PremiumAccess logic to common PremiumRepo
abstract interface class PurchasesRepository {
  Future<void> init();

  Stream<bool> get watchPremiumAccess;
  Stream<String?> get watchPremiumSku;

  bool get hasPremium;
  String? get premiumSku;

  Future<Offering?> getCurrentOffering();
  Future<OfferingMetadataModel?> getOfferingMetadata(Offering? offering);
  Future<List<String>> getPackagesWithFreeTrialEnabled(List<Package> packages);
  Future<void> purchasePackage(Package package);
  Future<void> restorePurchases();
}
