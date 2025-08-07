// ignore: library_annotations
@Timeout(Duration(seconds: 10))
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/enums/sign_source.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/additional_app_user_info.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_controller.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks.dart';

void main() {
  late ProviderContainer container;
  late AuthRepository mockAuthRepository;
  late AppUser testUser;
  const String testEmail = 'test@example.com';
  const String testPassword = 'Qwerty123';

  setUp(() {
    mockAuthRepository = MockAuthFirebaseRepository();
    testUser = AppUser(uid: 'test-uid', email: testEmail);

    // Create container with overridden provider
    container = ProviderContainer(overrides: [authRepoProvider.overrideWith((ref) => mockAuthRepository)]);
  });

  tearDown(() {
    container.dispose();
  });

  group('SignController', () {
    test('initial state should be SignStage.init', () {
      // Arrange & Act
      final controller = container.read(signControllerProvider.notifier);
      final state = controller.state;

      // Assert
      expect(state.value?.stage, SignStage.init);
    });

    group('signVia google', () {
      test(
        '''
      Given signSource is google
      When new user sign up successed
      Then state is AsyncData(SignState(stage: SignStage.signUpSuccess))
      ''',
        () async {
          // Arrange
          final appUserInfo = AdditionalAppUserInfo(user: testUser, isNewUser: true);
          when(() => mockAuthRepository.signVia(SignSource.google)).thenAnswer((_) async => appUserInfo);

          // Act
          final controller = container.read(signControllerProvider.notifier);
          await controller.signVia(SignSource.google);

          // Assert
          expect(controller.state, const AsyncData(SignState(stage: SignStage.signUpSuccess)));
        },
      );

      test(
        '''
      Given signSource is google
      When existing user sign in successed
      Then state is AsyncData(SignState(stage: SignStage.signInSuccess))
      ''',
        () async {
          // Arrange
          final appUserInfo = AdditionalAppUserInfo(user: testUser, isNewUser: false);
          when(() => mockAuthRepository.signVia(SignSource.google)).thenAnswer((_) async => appUserInfo);

          // Act
          container.read(signControllerProvider);
          final controller = container.read(signControllerProvider.notifier);
          await controller.signVia(SignSource.google);

          // Assert
          expect(controller.state, const AsyncData(SignState(stage: SignStage.signInSuccess)));
        },
      );

      test(
        '''
      Given signSource is google
      When signVia fails
      Then state is AsyncError
      ''',
        () async {
          // Arrange
          final exception = Exception('Sign in failed');
          when(() => mockAuthRepository.signVia(SignSource.google)).thenThrow(exception);

          // Act
          container.read(signControllerProvider);
          final controller = container.read(signControllerProvider.notifier);
          await controller.signVia(SignSource.google);

          // Assert
          expect(controller.state.hasError, isTrue);
          expect(controller.state, isA<AsyncError>());
        },
      );
    });

    group('signUpViaEmail', () {
      test(
        '''
      Given email and password
      When sign up succeeds
      Then state is AsyncData(SignState(stage: SignStage.signUpSuccess))
      ''',
        () async {
          // Arrange
          when(
            () => mockAuthRepository.signUpWithEmailAndPassword(email: testEmail, password: testPassword),
          ).thenAnswer((_) async => testUser);

          // Act
          container.read(signControllerProvider);
          final controller = container.read(signControllerProvider.notifier);
          await controller.signUpViaEmail(email: testEmail, password: testPassword);

          // Assert
          expect(controller.state, const AsyncData(SignState(stage: SignStage.signUpSuccess)));
        },
      );

      test(
        '''
      Given email and password
      When sign up fails
      Then state is AsyncError
      ''',
        () async {
          // Arrange
          final exception = Exception('Sign up failed');
          when(
            () => mockAuthRepository.signUpWithEmailAndPassword(email: testEmail, password: testPassword),
          ).thenThrow(exception);

          // Act
          container.read(signControllerProvider);
          final controller = container.read(signControllerProvider.notifier);
          await controller.signUpViaEmail(email: testEmail, password: testPassword);

          // Assert
          expect(controller.state.hasError, isTrue);
          expect(controller.state, isA<AsyncError>());
        },
      );
    });

    group('signInViaEmail', () {
      test(
        '''
      Given email and password
      When sign in succeeds
      Then state is AsyncData(SignState(stage: SignStage.signInSuccess))
      ''',
        () async {
          // Arrange
          when(
            () => mockAuthRepository.signInWithEmailAndPassword(email: testEmail, password: testPassword),
          ).thenAnswer((_) async => testUser);

          // Act
          container.read(signControllerProvider);
          final controller = container.read(signControllerProvider.notifier);
          await controller.signInViaEmail(email: testEmail, password: testPassword);

          // Assert
          expect(controller.state, const AsyncData(SignState(stage: SignStage.signInSuccess)));
        },
      );

      test(
        '''
      Given email and password
      When sign in fails
      Then state is AsyncError
      ''',
        () async {
          // Arrange
          final exception = Exception('Sign in failed');
          when(
            () => mockAuthRepository.signInWithEmailAndPassword(email: testEmail, password: testPassword),
          ).thenThrow(exception);

          // Act
          container.read(signControllerProvider);
          final controller = container.read(signControllerProvider.notifier);
          await controller.signInViaEmail(email: testEmail, password: testPassword);

          // Assert
          expect(controller.state.hasError, isTrue);
          expect(controller.state, isA<AsyncError>());
        },
      );
    });
  });
}
