import 'dart:developer';

import 'package:education_app/blocs/get_user_bloc/get_user_event.dart';
import 'package:education_app/blocs/get_user_bloc/get_user_state.dart';
import 'package:education_app/repositories/abstract/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState>{
  final UserRepository userRepository;
  GetUserBloc({required UserRepository repository}) : userRepository = repository, super(GetUserInitial()){
    on<GetUser>(_onGetUser);
  }

  Future<void> _onGetUser(GetUser event, Emitter<GetUserState> emit) async {
    emit(GetUserProcess());
    try{
      var userModel = await userRepository.getUserById(event.userId);
      emit(GetUserSuccess(userModel: userModel));
    } catch (exception){
      log(exception.toString());
      emit(GetUserFailure());
    }
  }
}