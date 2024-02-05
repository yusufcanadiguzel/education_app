import 'package:education_app/blocs/auth_bloc/auth_event.dart';
import 'package:education_app/blocs/auth_bloc/auth_state.dart';
import 'package:education_app/repositories/auth_repository.dart';
import 'package:education_app/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:education_app/models/user.dart' as user_model;

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthBloc() : super(AuthInitial()){
    on<LoginUser>(_onLoginUser);

    on<RegisterUser>(_onRegisterUser);

    on<CheckUser>(_onCheckUser);

    on<LoginSuccessfull>(_onLoginSuccessfull);
  }

  final AuthRepository _repository = AuthRepository();
  final UserRepository _userRepository = UserRepository();

  void _onLoginUser(LoginUser event, Emitter<AuthState> emit) async{
    emit(AuthLoading());

    try{
      await _repository.loginUser(event.email, event.password);

      emit(AuthSuccesfull());
    }catch(exception){
      emit(AuthError());
    }
  }

  Future<bool> _onRegisterUser(RegisterUser event, Emitter<AuthState> emitter) async{
    emitter(AuthLoading());
    var result = true;
    try{
      await _repository.registerUser(event.email, event.password);
      await _userRepository.createUser(user_model.User(userId: _repository.getCurrentUser()!.uid, firstName: '', lastName: '', email: event.email, title: '', profilePictureUrl: ''));
      _userRepository.currentUserId = _repository.getCurrentUser()!.uid;
      emitter(AuthSuccesfull());
    }catch (exception) {
      result = false;
      emitter(AuthError());
    }

    return result;
  }

  void _onCheckUser(CheckUser event, Emitter<AuthState> emitter) async{
    try{
      emitter(AuthLoaded());
    }catch (exception){
      emitter(AuthError());
    }
  }

  void _onLoginSuccessfull(LoginSuccessfull event, Emitter<AuthState> emit){
  }
}

