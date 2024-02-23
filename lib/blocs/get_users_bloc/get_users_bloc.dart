import 'dart:developer';

import 'package:education_app/blocs/get_users_bloc/get_users_event.dart';
import 'package:education_app/blocs/get_users_bloc/get_users_state.dart';
import 'package:education_app/repositories/abstract/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState>{
  final UserRepository _userRepository;
  GetUsersBloc({required UserRepository repository}) : _userRepository = repository, super(GetUsersInitial()){
    on<GetUsersByName>(_onGetUsersByName);
  }

  Future<void> _onGetUsersByName(GetUsersByName event, Emitter<GetUsersState> emit) async {
    emit(GetUsersProcess());
    try{
      var users = await _userRepository.getUsersByName(event.name);
      emit(GetUsersSuccess(users: users));
    } catch (exception) {
      log(exception.toString());
      emit(GetUsersFailure());
    }
  }
}