import 'package:aichat/src/features/onboarding/subscription/data/repo/purchases_repository_impl.dart';
import 'package:aichat/src/features/subscription/application/entitlements_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entitlements_controller.g.dart';

/// Controller for managing premium status with caching and refresh capability
@riverpod
class EntitlementsController extends _$EntitlementsController {
  @override
  Future<bool> build() async {
    final service = ref.read(entitlementsServiceProvider);
    return await service.hasPremiumAccess();
  }

  /// Refresh premium status from Firebase Auth Claims
  Future<void> refreshPremiumStatus() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final service = ref.read(entitlementsServiceProvider);
      return await service.hasPremiumAccess();
    });
  }

  /// Check if user has premium access (from cached state)
  bool get hasPremiumAccess {
    return state.value ?? false;
  }

  /// Purchase subscription using RevenueCat
  Future<void> purchaseSubscription() async {
    try {
      final purchasesRepository = ref.read(purchasesRepositoryProvider);
      
      // Get current offering
      final offering = await purchasesRepository.getCurrentOffering();
      if (offering == null) {
        throw Exception('No offering available');
      }
      
      // Get premium package (assuming it's the first package)
      final package = offering.availablePackages.first;
      
      // Make purchase
      await purchasesRepository.purchasePackage(package);
      
      // Refresh premium status after successful purchase
      await refreshPremiumStatus();
      
    } catch (e) {
      // Let the error bubble up to be handled by UI
      rethrow;
    }
  }
}
