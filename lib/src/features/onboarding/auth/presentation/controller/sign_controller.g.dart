// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(SignController)
const signControllerProvider = SignControllerProvider._();

final class SignControllerProvider extends $AsyncNotifierProvider<SignController, SignState> {
  const SignControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signControllerHash();

  @$internal
  @override
  SignController create() => SignController();
}

String _$signControllerHash() => r'5eb2a366e12564bd9c384fe977045f7b3408c2e3';

abstract class _$SignController extends $AsyncNotifier<SignState> {
  FutureOr<SignState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<SignState>, SignState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SignState>, SignState>,
              AsyncValue<SignState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
