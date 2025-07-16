import 'package:aichat/src/core/config/domain/repository/app_config_repository.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/subscription/data/repo/purchases_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthFirebaseRepository extends Mock implements AuthFirebaseRepositoryImpl {}

class MockPurchasesRepository extends Mock implements PurchasesRepositoryImpl {}

class MockAppConfigRepository extends Mock implements AppConfigRepository {}
