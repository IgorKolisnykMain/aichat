// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_firebase_repo_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(authRepo)
const authRepoProvider = AuthRepoProvider._();

final class AuthRepoProvider extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
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
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

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

String _$authRepoHash() => r'ae73bf9f7bd53681094c2488e1b0fa6b05334b4a';

@ProviderFor(idTokenChanges)
const idTokenChangesProvider = IdTokenChangesProvider._();

final class IdTokenChangesProvider extends $FunctionalProvider<AsyncValue<AppUser?>, AppUser?, Stream<AppUser?>>
    with $FutureModifier<AppUser?>, $StreamProvider<AppUser?> {
  const IdTokenChangesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'idTokenChangesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$idTokenChangesHash();

  @$internal
  @override
  $StreamProviderElement<AppUser?> $createElement($ProviderPointer pointer) => $StreamProviderElement(pointer);

  @override
  Stream<AppUser?> create(Ref ref) {
    return idTokenChanges(ref);
  }
}

String _$idTokenChangesHash() => r'3b640dc97caa27e3d21dfe13e0e36a15092dc334';

@ProviderFor(isCurrentUserAdmin)
const isCurrentUserAdminProvider = IsCurrentUserAdminProvider._();

final class IsCurrentUserAdminProvider extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const IsCurrentUserAdminProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isCurrentUserAdminProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isCurrentUserAdminHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return isCurrentUserAdmin(ref);
  }
}

String _$isCurrentUserAdminHash() => r'b542c95009454e9386db32c4916bd6b9e2ba4a24';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
