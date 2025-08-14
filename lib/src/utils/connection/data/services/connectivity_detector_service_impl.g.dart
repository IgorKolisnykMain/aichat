// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_detector_service_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(connectivityDetectorService)
const connectivityDetectorServiceProvider = ConnectivityDetectorServiceProvider._();

final class ConnectivityDetectorServiceProvider
    extends $FunctionalProvider<ConnectivityDetectorService, ConnectivityDetectorService, ConnectivityDetectorService>
    with $Provider<ConnectivityDetectorService> {
  const ConnectivityDetectorServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityDetectorServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityDetectorServiceHash();

  @$internal
  @override
  $ProviderElement<ConnectivityDetectorService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConnectivityDetectorService create(Ref ref) {
    return connectivityDetectorService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectivityDetectorService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectivityDetectorService>(value),
    );
  }
}

String _$connectivityDetectorServiceHash() => r'1ea9d66324b4589273af9fb2a3a9eb4b8367a04b';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
