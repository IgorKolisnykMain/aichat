// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entitlements_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// Provider for stateless service
@ProviderFor(entitlementsService)
const entitlementsServiceProvider = EntitlementsServiceProvider._();

/// Provider for stateless service
final class EntitlementsServiceProvider
    extends
        $FunctionalProvider<
          EntitlementsService,
          EntitlementsService,
          EntitlementsService
        >
    with $Provider<EntitlementsService> {
  /// Provider for stateless service
  const EntitlementsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'entitlementsServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$entitlementsServiceHash();

  @$internal
  @override
  $ProviderElement<EntitlementsService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EntitlementsService create(Ref ref) {
    return entitlementsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EntitlementsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EntitlementsService>(value),
    );
  }
}

String _$entitlementsServiceHash() =>
    r'047ece8e8a6cbd59ade05a20ac8932ef3b4ccb38';

/// Provider for premium access check
@ProviderFor(hasPremiumAccess)
const hasPremiumAccessProvider = HasPremiumAccessProvider._();

/// Provider for premium access check
final class HasPremiumAccessProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// Provider for premium access check
  const HasPremiumAccessProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasPremiumAccessProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasPremiumAccessHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return hasPremiumAccess(ref);
  }
}

String _$hasPremiumAccessHash() => r'96431ea942bc2afeb1244cfedb4526c7f6575c27';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
