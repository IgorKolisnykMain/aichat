import 'dart:ui';

import 'package:aichat/src/constants/design_sizes.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks.dart';
import '../auth_robot.dart';

void main() {
  late MockAuthFirebaseRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthFirebaseRepository();
  });

  testWidgets('email and google auth btns', (tester) async {
    final r = AuthRobot(tester: tester);
    await r.pumpWelcomeSignScreen(authRepo: mockAuthRepository);
    await r.expectWelcomeSignScreen();
    await r.expectGoogleAndEmailContinueBtns();
  }, variant: ValueVariant<Size>({DesignSize.mobile}));
}
