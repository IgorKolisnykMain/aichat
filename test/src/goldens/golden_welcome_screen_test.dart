import 'package:aichat/src/constants/design_sizes.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/welcome_sign_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../domain/models/platform_design_size.dart';
import '../robot.dart';
import '../utils/golden_test_helper.dart';

void main() {
  final sizeOsVariants = ValueVariant<PlatformDesignSize>({
    PlatformDesignSize(size: DesignSize.mobile, platform: TargetPlatform.android),
    // ! Since it is not possible to set a specific platform in golden tests, the test will not pass for the web UI. It is necessary to either remove the ScreenUtils library or find a way to set the platform in the test so that it is possible to determine the platform in the UI without context. Setting debugDefaultTargetPlatformOverride does not work.
    // PlatformDesignSize(size: DesignSize.web, platform: TargetPlatform.macOS),
  });

  testGoleden(
    'Golden Welcome screen',
    sizeOsVariants,
    (tester, size, platform) async {
      final r = Robot.goldenTest(tester: tester, designSize: size);
      await r.golden.setSurfaceSize(size);
      await r.golden.loadRobotoFont();
      await r.golden.loadMaterialIconFont();
      await r.pumpWelcomeSignScreen();
      await r.golden.precacheImages();

      await expectLater(
        find.byType(WelcomeSignScreen),
        matchesGoldenFile('welcome_sign_screen_${size.width.toInt()}x${size.height.toInt()}_${platform.name}.png'),
      );
    },
    variant: sizeOsVariants,
    tags: ['golden'],
  );
}
