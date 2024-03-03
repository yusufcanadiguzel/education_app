import 'dart:developer';
import 'package:education_app/blocs/get_users_by_name_bloc/get_users_by_name_event.dart';
import 'package:education_app/blocs/get_users_by_name_bloc/get_users_by_name_state.dart';
import 'package:education_app/repositories/abstract/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUsersByNameBloc extends Bloc<GetUsersByNameEvent, GetUsersByNameState>{
  final UserRepository userRepository;
  GetUsersByNameBloc({required UserRepository repository}) : userRepository = repository, super(GetUsersByNameInitial()){
    on<GetUsersByName>(_onGetUsersByName);
  }

  Future<void> _onGetUsersByName(GetUsersByName event, Emitter<GetUsersByNameState> emit) async {
    emit(GetUsersByNameProcess());
    try{
      var users = await userRepository.getUsersByName(event.name);
      emit(GetUsersByNameSuccess(users: users));
    } catch (exception) {
      log(exception.toString());
      emit(GetUsersByNameFailure());
    }
  }
}