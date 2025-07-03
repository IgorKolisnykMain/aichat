import 'package:aichat/domain/model/offering_metadata_model.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

abstract interface class PurchasesRepository {
  Future<void> init();

  Stream<bool> get hasPremiumAccess;
  Stream<String?> get premiumSkuStream;

  bool get hasPremium;
  String? get premiumSku;

  Future<Offering?> getCurrentOffering();
  Future<OfferingMetadataModel?> getOfferingMetadata(Offering? offering);
  Future<List<String>> getPackagesWithFreeTrialEnabled(List<Package> packages);
  Future<void> purchasePackage(Package package);
  Future<void> restorePurchases();
}
