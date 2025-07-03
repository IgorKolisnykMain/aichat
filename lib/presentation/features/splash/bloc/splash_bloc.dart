import 'dart:async';

import 'package:aichat/domain/repository/ai_tutor_repo.dart';
import 'package:aichat/domain/repository/auth_firebase_repository.dart';
import 'package:aichat/domain/repository/firestore_db_storage.dart';
import 'package:aichat/presentation/features/splash/bloc/splash_event.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_bloc.freezed.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthFirebaseRepository authFirebaseRepo;
  final FireStoreDbStorage fireStoreDbRepository;
  final AiTutorRepo aiTutorRepo;

  SplashBloc(this.authFirebaseRepo, this.fireStoreDbRepository, this.aiTutorRepo)
    : super(const SplashState(stage: SplashStage.init)) {
    on<SplashEvent>(_handler, transformer: sequential());
  }

  EventHandler<SplashEvent, SplashState> get _handler =>
      (event, emit) => switch (event) {
        DelaySplashTimeEvent() => _delaySplashTime(emit),
      };

  Future<void> _delaySplashTime(Emitter<SplashState> emit) async {
    final isLoggedIn = !authFirebaseRepo.isExpiredSession() && await authFirebaseRepo.isUserExists();
    if (!isLoggedIn) {
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(stage: SplashStage.showWelcomeScreen));
      return;
    } else {
      fireStoreDbRepository.userId = authFirebaseRepo.userUid;
      await aiTutorRepo.setupAiChat();
    }
    emit(state.copyWith(stage: SplashStage.showMainScreen));
  }
}
