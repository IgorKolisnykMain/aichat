// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_sync_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AuthSyncService)
const authSyncServiceProvider = AuthSyncServiceProvider._();

final class AuthSyncServiceProvider extends $NotifierProvider<AuthSyncService, AuthSyncService> {
  const AuthSyncServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authSyncServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authSyncServiceHash();

  @$internal
  @override
  AuthSyncService create() => AuthSyncService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthSyncService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthSyncService>(value),
    );
  }
}

String _$authSyncServiceHash() => r'b53fdf442ee83ee4af79fd27285bbc1f17ac2580';

abstract class _$AuthSyncService extends $Notifier<AuthSyncService> {
  AuthSyncService build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AuthSyncService, AuthSyncService>;
    final element =
        ref.element
            as $ClassProviderElement<AnyNotifier<AuthSyncService, AuthSyncService>, AuthSyncService, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
