import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entitlements_service.g.dart';

/// Stateless service to check user premium status via Firebase Auth Claims
/// Claims are automatically updated by RevenueCat Firebase Extension
class EntitlementsService {
  const EntitlementsService();

  /// Check if user has premium access from Firebase Auth Claims
  /// Claims are automatically set by RevenueCat Firebase Extension
  Future<bool> hasPremiumAccess() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return false;
      }

      // Force refresh token to get latest claims
      final idTokenResult = await user.getIdTokenResult(true);
      final claims = idTokenResult.claims ?? {};

      // Check premium claim set by RevenueCat Extension
      return claims['premium'] == true;
    } catch (e) {
      // Return false on error - user won't have access
      return false;
    }
  }
}

/// Provider for stateless service
@riverpod
EntitlementsService entitlementsService(Ref ref) {
  return const EntitlementsService();
}

/// Provider for premium access check
@riverpod
Future<bool> hasPremiumAccess(Ref ref) async {
  final service = ref.watch(entitlementsServiceProvider);
  return await service.hasPremiumAccess();
}
