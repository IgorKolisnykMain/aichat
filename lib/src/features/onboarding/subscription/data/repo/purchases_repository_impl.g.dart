// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchases_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(purchasesRepository)
const purchasesRepositoryProvider = PurchasesRepositoryProvider._();

final class PurchasesRepositoryProvider
    extends $FunctionalProvider<PurchasesRepository, PurchasesRepository, PurchasesRepository>
    with $Provider<PurchasesRepository> {
  const PurchasesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'purchasesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$purchasesRepositoryHash();

  @$internal
  @override
  $ProviderElement<PurchasesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PurchasesRepository create(Ref ref) {
    return purchasesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PurchasesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PurchasesRepository>(value),
    );
  }
}

String _$purchasesRepositoryHash() => r'c8a086eda762173a3893e1a373e5003d0cad2831';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
