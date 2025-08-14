// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(appConfigRepository)
const appConfigRepositoryProvider = AppConfigRepositoryProvider._();

final class AppConfigRepositoryProvider
    extends $FunctionalProvider<AppConfigRepository, AppConfigRepository, AppConfigRepository>
    with $Provider<AppConfigRepository> {
  const AppConfigRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appConfigRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appConfigRepositoryHash();

  @$internal
  @override
  $ProviderElement<AppConfigRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppConfigRepository create(Ref ref) {
    return appConfigRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppConfigRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppConfigRepository>(value),
    );
  }
}

String _$appConfigRepositoryHash() => r'6c044470f764c775bde88e75b5fe0ef285d76dd2';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
