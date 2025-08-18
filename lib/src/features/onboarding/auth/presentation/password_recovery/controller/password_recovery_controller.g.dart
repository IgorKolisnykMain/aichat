// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_recovery_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(PasswordRecoveryController)
const passwordRecoveryControllerProvider = PasswordRecoveryControllerProvider._();

final class PasswordRecoveryControllerProvider
    extends $AsyncNotifierProvider<PasswordRecoveryController, PasswordRecoveryState> {
  const PasswordRecoveryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passwordRecoveryControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordRecoveryControllerHash();

  @$internal
  @override
  PasswordRecoveryController create() => PasswordRecoveryController();
}

String _$passwordRecoveryControllerHash() => r'97a40b9bbaae40f0f3615add485673b9a6f6a5b2';

abstract class _$PasswordRecoveryController extends $AsyncNotifier<PasswordRecoveryState> {
  FutureOr<PasswordRecoveryState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<PasswordRecoveryState>, PasswordRecoveryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PasswordRecoveryState>, PasswordRecoveryState>,
              AsyncValue<PasswordRecoveryState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
