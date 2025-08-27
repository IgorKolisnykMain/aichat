// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_tutor_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AiTutorController)
const aiTutorControllerProvider = AiTutorControllerProvider._();

final class AiTutorControllerProvider extends $AsyncNotifierProvider<AiTutorController, AiTutorState> {
  const AiTutorControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiTutorControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiTutorControllerHash();

  @$internal
  @override
  AiTutorController create() => AiTutorController();
}

String _$aiTutorControllerHash() => r'4cebdfed473be8fb5d9d2b3789cf7495bb6a32ce';

abstract class _$AiTutorController extends $AsyncNotifier<AiTutorState> {
  FutureOr<AiTutorState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<AiTutorState>, AiTutorState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AiTutorState>, AiTutorState>,
              AsyncValue<AiTutorState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
