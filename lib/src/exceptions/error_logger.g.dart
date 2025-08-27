// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_logger.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ErrorLogger)
const errorLoggerProvider = ErrorLoggerProvider._();

final class ErrorLoggerProvider extends $NotifierProvider<ErrorLogger, ErrorLogger> {
  const ErrorLoggerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'errorLoggerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$errorLoggerHash();

  @$internal
  @override
  ErrorLogger create() => ErrorLogger();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ErrorLogger value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ErrorLogger>(value),
    );
  }
}

String _$errorLoggerHash() => r'e54974fab65199c0e7d4fad42749040d5733eef4';

abstract class _$ErrorLogger extends $Notifier<ErrorLogger> {
  ErrorLogger build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ErrorLogger, ErrorLogger>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<ErrorLogger, ErrorLogger>, ErrorLogger, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
