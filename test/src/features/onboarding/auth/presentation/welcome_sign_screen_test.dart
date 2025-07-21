import 'dart:ui';

import 'package:aichat/src/constants/design_sizes.dart';
import 'package:flutter_test/flutter_test.dart';

import '../auth_robot.dart';

void main() {
  testWidgets('email and google auth btns', (tester) async {
    final r = AuthRobot(tester: tester);
    await r.pumpWelcomeSignScreen();
    await r.expectWelcomeSignScreen();
    await r.expectGoogleAndEmailContinueBtns();
  }, variant: ValueVariant<Size>({DesignSize.mobile}));
}
