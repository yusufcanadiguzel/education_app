import 'package:education_app/blocs/user_bloc/user_event.dart';
import 'package:education_app/blocs/user_bloc/user_state.dart';
import 'package:education_app/models/user.dart';
import 'package:education_app/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  UserBloc() : super(UserInitial()){
    on<FetchUsers>(_onFetchUser);

    on<AddUser>(_onAddUser);

    on<UpdateUser>(_onUserUpdate);
  }

  final UserRepository _repository = UserRepository();

  void _onFetchUser(FetchUsers event, Emitter<UserState> emit) async{
    emit(UserLoading(currentUserId: _repository.currentUserId));
    
    try{
      emit(UserLoaded());
    }catch(exception){
      emit(UserError());
    }
  }

  void _onAddUser(AddUser event, Emitter<UserState> emit) async{
    try{
      await _repository.createUser(event.user);
    }catch(exception){
      emit(UserError());
    }
  }

  void _onUserUpdate(UpdateUser event, Emitter<UserState> emit) async {
    try{
      await _repository.updateUser(event.user, event.docId);
      emit(UserChangesSaved());
    }catch (exception) {
      emit(UserError());
    }
  }
}
