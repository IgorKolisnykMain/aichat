part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({required SplashStage stage, String? notificationPayload}) = _SplashState;
}

enum SplashStage { init, showMainScreen, showWelcomeScreen, error, loading }
