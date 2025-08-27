// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_firestore_repo_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(userFirestoreRepo)
const userFirestoreRepoProvider = UserFirestoreRepoProvider._();

final class UserFirestoreRepoProvider extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  const UserFirestoreRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userFirestoreRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userFirestoreRepoHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userFirestoreRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userFirestoreRepoHash() => r'c324736141bd697de28a7fdcefd5fb3da2bb119f';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
