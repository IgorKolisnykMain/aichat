// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_metadata_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// Helper repository class to watch the user medatata in Firestore
@ProviderFor(UserMetadataRepository)
const userMetadataRepositoryProvider = UserMetadataRepositoryProvider._();

/// Helper repository class to watch the user medatata in Firestore
final class UserMetadataRepositoryProvider extends $NotifierProvider<UserMetadataRepository, UserMetadataRepository> {
  /// Helper repository class to watch the user medatata in Firestore
  const UserMetadataRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userMetadataRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userMetadataRepositoryHash();

  @$internal
  @override
  UserMetadataRepository create() => UserMetadataRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserMetadataRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserMetadataRepository>(value),
    );
  }
}

String _$userMetadataRepositoryHash() => r'417562544804305272de83cf7d771915e9b1872b';

abstract class _$UserMetadataRepository extends $Notifier<UserMetadataRepository> {
  UserMetadataRepository build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserMetadataRepository, UserMetadataRepository>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserMetadataRepository, UserMetadataRepository>,
              UserMetadataRepository,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
