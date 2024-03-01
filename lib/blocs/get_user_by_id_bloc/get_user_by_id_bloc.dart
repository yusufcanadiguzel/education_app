import 'dart:developer';

import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_event.dart';
import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_state.dart';
import 'package:education_app/repositories/abstract/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserByIdBloc extends Bloc<GetUserByIdEvent, GetUserByIdState>{
  final UserRepository userRepository;
  GetUserByIdBloc({required UserRepository repository}) : userRepository = repository, super(GetUserByIdInitial()){
    on<GetUserById>(_onGetUserById);
  }

  Future<void> _onGetUserById(GetUserById event, Emitter<GetUserByIdState> emit) async {
    emit(GetUserByIdProcess());
    try{
      var user = await userRepository.getUserById(event.id);
      emit(GetUserByIdSuccess(user: user));
    } catch (exception) {
      log(exception.toString());
      emit(GetUserByIdFailure());
    }
  }
}