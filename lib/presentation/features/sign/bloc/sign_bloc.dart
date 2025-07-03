import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:aichat/domain/enum/firebase_sign.dart';
import 'package:aichat/domain/repository/auth_firebase_repository.dart';
import 'package:aichat/presentation/features/sign/bloc/sign_event.dart';

part 'sign_state.dart';
part 'sign_bloc.freezed.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final AuthFirebaseRepository authFirebaseRep;

  SignBloc(this.authFirebaseRep) : super(const SignState(stage: SignStage.init)) {
    on<SignEvent>(_handler, transformer: sequential());
  }

  EventHandler<SignEvent, SignState> get _handler =>
      (event, emit) => switch (event) {
        SignViaAppleEvent() => _signVia(emit, FirebaseSignType.apple),
        SignViaGoogleEvent() => _signVia(emit, FirebaseSignType.google),
        SignViaAnonymous() => _signVia(emit, FirebaseSignType.anonymous),
        SignUpViaEmailEvent(email: final email, password: final password) => _signUpViaEmail(emit, email, password),
        SignInViaEmailEvent(email: final email, password: final password) => _signInViaEmail(emit, email, password),
      };

  Future<void> _signVia(Emitter<SignState> emit, FirebaseSignType signType) async {
    emit(state.copyWith(stage: SignStage.loading));
    try {
      final userCredential = switch (signType) {
        FirebaseSignType.google => await authFirebaseRep.signVia(FirebaseSignType.google),
        FirebaseSignType.apple => await authFirebaseRep.signVia(FirebaseSignType.apple),
        FirebaseSignType.anonymous => await authFirebaseRep.signInAnonymously(),
      };
      if (userCredential != null) {
        (userCredential.additionalUserInfo?.isNewUser ?? true)
            ? await _successSignUp(emit)
            : await _successSignIn(emit);
      }
      emit(state.copyWith(stage: SignStage.init));
    } catch (e) {
      emit(state.copyWith(stage: SignStage.error, error: e));
    }
  }

  Future<void> _signUpViaEmail(Emitter<SignState> emit, String email, String password) async {
    emit(state.copyWith(stage: SignStage.loading));
    try {
      final userCredential = await authFirebaseRep.signUpWithEmailAndPassword(email: email, password: password);
      if (userCredential != null) {
        await _successSignUp(emit);
      }
    } catch (e) {
      emit(state.copyWith(stage: SignStage.error, error: e));
    }
  }

  Future<void> _signInViaEmail(Emitter<SignState> emit, String email, String password) async {
    emit(state.copyWith(stage: SignStage.loading));
    try {
      final userCredential = await authFirebaseRep.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential != null) {
        await _successSignIn(emit);
      }
    } catch (e) {
      emit(state.copyWith(stage: SignStage.error, error: e));
    }
  }

  Future<void> _successSignIn(Emitter<SignState> emit) async {
    emit(state.copyWith(stage: SignStage.signInSuccess));
  }

  Future<void> _successSignUp(Emitter<SignState> emit) async {
    emit(state.copyWith(stage: SignStage.signUpSuccess));
  }
}
