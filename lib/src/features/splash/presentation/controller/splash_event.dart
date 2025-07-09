import 'package:equatable/equatable.dart';

sealed class SplashEvent extends Equatable {}

class DelaySplashTimeEvent extends SplashEvent {
  DelaySplashTimeEvent();

  @override
  List<Object?> get props => [];
}
