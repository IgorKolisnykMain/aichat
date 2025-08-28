// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entitlements_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// Controller for managing premium status with caching and refresh capability
@ProviderFor(EntitlementsController)
const entitlementsControllerProvider = EntitlementsControllerProvider._();

/// Controller for managing premium status with caching and refresh capability
final class EntitlementsControllerProvider
    extends $AsyncNotifierProvider<EntitlementsController, bool> {
  /// Controller for managing premium status with caching and refresh capability
  const EntitlementsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'entitlementsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$entitlementsControllerHash();

  @$internal
  @override
  EntitlementsController create() => EntitlementsController();
}

String _$entitlementsControllerHash() =>
    r'516c8d5f123aba6959eb1de78f55abc82733126c';

abstract class _$EntitlementsController extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
