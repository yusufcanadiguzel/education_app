import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/blocs/auth_bloc/auth_event.dart';
import 'package:education_app/blocs/auth_bloc/auth_state.dart';
import 'package:education_app/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthBloc() : super(AuthInitial()){
    on<LoginUser>(_onLoginUser);

    on<RegisterUser>(_onRegisterUser);

    on<CheckUser>(_onCheckUser);


  }

  final AuthRepository _repository = AuthRepository();

  void _onLoginUser(LoginUser event, Emitter<AuthState> emit) async{
    emit(AuthLoading());

    try{
      //_auth.signInWithEmailAndPassword(email: event.email, password: event.password);
    }catch(exception){
      emit(AuthError());
    }
  }

  void _onRegisterUser(RegisterUser event, Emitter<AuthState> emitter) async{
    emitter(AuthLoading());
    
    try{
      await _repository.registerUser(event.email, event.password);
    }catch (exception) {
      emitter(AuthError());
    }
  }

  void _onCheckUser(CheckUser event, Emitter<AuthState> emitter) async{
    try{
      emitter(AuthLoaded());
    }catch (exception){
      emitter(AuthError());
    }
  }
}

