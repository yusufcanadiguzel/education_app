import 'dart:developer';

import 'package:education_app/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:education_app/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:education_app/repositories/abstract/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  final UserRepository _userRepository;
  SignInBloc({required UserRepository userRepository}) : _userRepository = userRepository, super(SignInInitial()){
    on<SignInWithMail>(_onSignIn);
    on<SignOut>(_onSignOut);
  }

  Future<void> _onSignIn(SignInWithMail event, Emitter<SignInState> emit) async {
    emit(SignInProcess());
    try{
      await _userRepository.signInWithMail(event.email, event.password);
      emit(SignInSuccess());
    } catch (exception) {
      log(exception.toString());
      emit(SignInFailure());
    }
  }

  Future<void> _onSignOut(SignOut event, Emitter<SignInState> emit) async {
    await _userRepository.logOut();
  }
}