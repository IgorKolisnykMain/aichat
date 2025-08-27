// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_refresh_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// Class used to force an ID token refresh on sign in
@ProviderFor(UserTokenRefreshService)
const userTokenRefreshServiceProvider = UserTokenRefreshServiceProvider._();

/// Class used to force an ID token refresh on sign in
final class UserTokenRefreshServiceProvider
    extends $NotifierProvider<UserTokenRefreshService, UserTokenRefreshService> {
  /// Class used to force an ID token refresh on sign in
  const UserTokenRefreshServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userTokenRefreshServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userTokenRefreshServiceHash();

  @$internal
  @override
  UserTokenRefreshService create() => UserTokenRefreshService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserTokenRefreshService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserTokenRefreshService>(value),
    );
  }
}

String _$userTokenRefreshServiceHash() => r'da6d56609250b94af4dbee983368e67e1e0a4179';

abstract class _$UserTokenRefreshService extends $Notifier<UserTokenRefreshService> {
  UserTokenRefreshService build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserTokenRefreshService, UserTokenRefreshService>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserTokenRefreshService, UserTokenRefreshService>,
              UserTokenRefreshService,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
