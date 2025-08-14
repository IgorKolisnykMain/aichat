// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_date_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// A provider that returns a function that returns the current date.
/// This makes it easy to mock the current date in tests.
@ProviderFor(currentDateBuilder)
const currentDateBuilderProvider = CurrentDateBuilderProvider._();

/// A provider that returns a function that returns the current date.
/// This makes it easy to mock the current date in tests.
final class CurrentDateBuilderProvider
    extends $FunctionalProvider<DateTime Function(), DateTime Function(), DateTime Function()>
    with $Provider<DateTime Function()> {
  /// A provider that returns a function that returns the current date.
  /// This makes it easy to mock the current date in tests.
  const CurrentDateBuilderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentDateBuilderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentDateBuilderHash();

  @$internal
  @override
  $ProviderElement<DateTime Function()> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DateTime Function() create(Ref ref) {
    return currentDateBuilder(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime Function() value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime Function()>(value),
    );
  }
}

String _$currentDateBuilderHash() => r'3c13c2677145ec110573dcac8d254705b2e5ca85';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
