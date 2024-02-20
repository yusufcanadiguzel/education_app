import 'dart:developer';

import 'package:education_app/blocs/sign_up_bloc/sign_up_event.dart';
import 'package:education_app/blocs/sign_up_bloc/sign_up_state.dart';
import 'package:education_app/repositories/abstract/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState>{
  final UserRepository _userRepository;
  SignUpBloc({required UserRepository userRepository}) : _userRepository = userRepository, super(SignUpInitial()){
    on<SignUp>(_onSignUp);
  }
  
  Future<void> _onSignUp(SignUp event, Emitter<SignUpState> emit) async {
    emit(SignUpProcess());
    try{
      var result = await _userRepository.signUp(event.user, event.password);
      await _userRepository.createUser(result);
      emit(SignUpSuccess());
    } catch (exception) {
      log(exception.toString());
      emit(SignUpFailure());
    }
  }
}