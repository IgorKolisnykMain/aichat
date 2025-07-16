import 'package:aichat/src/features/onboarding/subscription/data/repo/purchases_repository_impl.dart' show PurchasesRepositoryImpl;
import 'package:flutter_test/flutter_test.dart';

import '../../../../../mocks.dart';

void main() {
  group('PurchasesRepositoryImpl', () {
    test(
      '''
    When create PurchasesRepositoryImpl
    Then hasPremium return false
    ''',
      () {
        final appConfigRepository = MockAppConfigRepository();
        final purchasesRepository = PurchasesRepositoryImpl(appConfigRepository: appConfigRepository);
        expect(purchasesRepository.hasPremium, false);
      },
    );
  });
}
