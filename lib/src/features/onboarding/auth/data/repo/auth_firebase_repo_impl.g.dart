// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_firebase_repo_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(authRepo)
const authRepoProvider = AuthRepoProvider._();

final class AuthRepoProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  const AuthRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepoHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepoHash() => r'8c49a1ef1885d58c321dd94f80284796e4ca1c12';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
