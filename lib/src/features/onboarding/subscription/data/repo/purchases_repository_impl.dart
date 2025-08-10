import 'dart:convert';

import 'package:aichat/src/core/config/data/repository/app_config_repository_impl.dart';
import 'package:aichat/src/core/config/domain/repository/app_config_repository.dart';
import 'package:aichat/src/features/onboarding/subscription/domain/models/offering_metadata_model.dart';
import 'package:aichat/src/features/onboarding/subscription/domain/repo/purchases_repository.dart';
import 'package:aichat/src/utils/app/domain/enums/user_platform.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:rxdart/rxdart.dart';

final purchasesRepositoryProvider = Provider<PurchasesRepository>((ref) {
  final appConfig = ref.read(appConfigRepositoryProvider);
  return PurchasesRepositoryImpl(appConfigRepository: appConfig);
});

class PurchasesRepositoryImpl implements PurchasesRepository {
  final AppConfigRepository appConfigRepository;

  PurchasesRepositoryImpl({required this.appConfigRepository});

  final BehaviorSubject<bool> _hasPremiumSubject = BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<String?> _premiumSku = BehaviorSubject<String?>.seeded(null);

  @override
  Future<void> init() async {
    await Purchases.setLogLevel(LogLevel.debug);
    final revenueCatConfiuration = PurchasesConfiguration(appConfigRepository.config.revenueCatPublicKey);
    await Purchases.configure(revenueCatConfiuration);
    Purchases.addCustomerInfoUpdateListener(_onCustomerInfoUpdate);
  }

  @override
  Stream<bool> get watchPremiumAccess => _hasPremiumSubject.stream.distinct();

  @override
  Stream<String?> get watchPremiumSku => _premiumSku.stream;

  @override
  bool get hasPremium => _hasPremiumSubject.value;

  @override
  String? get premiumSku => _premiumSku.value;

  // ignore: unused_element
  void _onCustomerInfoUpdate(CustomerInfo customerInfo) {
    _hasPremiumSubject.value = customerInfo.entitlements.all["premium"]?.isActive ?? false;
    _premiumSku.value = customerInfo.entitlements.all["premium"]?.productIdentifier;
  }

  @override
  Future<Offering?> getCurrentOffering() async {
    final offerings = await Purchases.getOfferings();
    return offerings.current;
  }

  @override
  Future<List<String>> getPackagesWithFreeTrialEnabled(List<Package> packages) async {
    final packagesWithFreeTrial = packages
        .where((element) => element.storeProduct.introductoryPrice?.price == 0.0)
        .toList();

    final userPlatform = appConfigRepository.config.platform;
    switch (userPlatform) {
      case UserPlatform.ios:
        final eligablePackages = await Purchases.checkTrialOrIntroductoryPriceEligibility(
          packagesWithFreeTrial.map((package) => package.storeProduct.identifier).toList(),
        );

        // TODO Check if I should select packages with unknown status
        final eligiblePackagesStoreProductIds = eligablePackages.entries
            .where(
              (package) =>
                  package.value.status == IntroEligibilityStatus.introEligibilityStatusEligible ||
                  package.value.status == IntroEligibilityStatus.introEligibilityStatusUnknown,
            )
            .map((package) => package.key)
            .toList();

        return packages
            .where((package) => eligiblePackagesStoreProductIds.contains(package.storeProduct.identifier))
            .map((package) => package.identifier)
            .toList();
      case UserPlatform.android:
        final eligiblePackages = packagesWithFreeTrial.where(
          (package) =>
              package.storeProduct.subscriptionOptions?.any(
                (option) => option.freePhase?.offerPaymentMode == OfferPaymentMode.freeTrial,
              ) ??
              false,
        );
        return eligiblePackages.map((package) => package.identifier).toList();
      case UserPlatform.undefined:
        return [];
    }
  }

  @override
  Future<OfferingMetadataModel?> getOfferingMetadata(Offering? offering) async {
    if (offering == null) return null;

    final offeringMedata = jsonEncode(offering.metadata);
    return OfferingMetadataModel.fromJson(jsonDecode(offeringMedata) as Map<String, dynamic>);
  }

  @override
  Future<void> purchasePackage(Package package) async {
    await Purchases.purchasePackage(package);
  }

  @override
  Future<void> restorePurchases() async {
    await Purchases.restorePurchases();
  }
}
