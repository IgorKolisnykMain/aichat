// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(StoreController)
const storeControllerProvider = StoreControllerProvider._();

final class StoreControllerProvider extends $AsyncNotifierProvider<StoreController, List<Product>> {
  const StoreControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storeControllerHash();

  @$internal
  @override
  StoreController create() => StoreController();
}

String _$storeControllerHash() => r'e398c4cb2da0dda11568a5439e858121dd2e9fc4';

abstract class _$StoreController extends $AsyncNotifier<List<Product>> {
  FutureOr<List<Product>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Product>>, List<Product>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Product>>, List<Product>>,
              AsyncValue<List<Product>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
