// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paywall_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(PaywallController)
const paywallControllerProvider = PaywallControllerProvider._();

final class PaywallControllerProvider extends $AsyncNotifierProvider<PaywallController, PaywallState> {
  const PaywallControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paywallControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paywallControllerHash();

  @$internal
  @override
  PaywallController create() => PaywallController();
}

String _$paywallControllerHash() => r'0c772d0e97cf6a10e37e5b5868e868e877581ddc';

abstract class _$PaywallController extends $AsyncNotifier<PaywallState> {
  FutureOr<PaywallState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<PaywallState>, PaywallState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PaywallState>, PaywallState>,
              AsyncValue<PaywallState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
