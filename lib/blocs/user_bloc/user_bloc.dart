import 'package:education_app/blocs/user_bloc/user_event.dart';
import 'package:education_app/blocs/user_bloc/user_state.dart';
import 'package:education_app/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  UserBloc() : super(UserInitial()){
    on<FetchUsers>(_onFetchUser);

    on<AddUser>(_onAddUser);
  }

  final UserRepository _repository = UserRepository();

  void _onFetchUser(FetchUsers event, Emitter<UserState> emitter) async{
    emit(UserLoading());
    
    try{
      emit(UserLoaded());
    }catch(exception){
      emit(UserError());
    }
  }

  void _onAddUser(AddUser event, Emitter<UserState> emitter) async{
    emit(UserLoading());

    try{
      await _repository.createUser(event.user);
    }catch(exception){
      emit(UserError());
    }
  }
}