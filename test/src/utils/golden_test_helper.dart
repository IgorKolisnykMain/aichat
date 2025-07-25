import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/models/platform_design_size.dart';

@isTest
void testGoleden(
  String description,
  ValueVariant<PlatformDesignSize> sizeOsVariants,
  Future<void> Function(WidgetTester widgetTester, Size size, TargetPlatform platform) callback, {
  bool? skip,
  Timeout? timeout,
  bool semanticsEnabled = true,
  TestVariant<Object?> variant = const DefaultTestVariant(),
  dynamic tags,
  int? retry,
}) {
  testWidgets(
    description,
    (tester) async {
      final sizeOsVariant = sizeOsVariants.currentValue!;
      final size = sizeOsVariant.size;
      final platform = sizeOsVariant.platform;

      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      await callback(tester, size, platform);
      debugDefaultTargetPlatformOverride = null;
    },
    skip: skip,
    timeout: timeout,
    semanticsEnabled: semanticsEnabled,
    variant: variant,
    tags: tags,
    retry: retry,
  );
}
