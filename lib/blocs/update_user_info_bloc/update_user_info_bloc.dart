import 'dart:developer';

import 'package:education_app/blocs/update_user_info_bloc/update_user_info_event.dart';
import 'package:education_app/blocs/update_user_info_bloc/update_user_info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/abstract/user_repository.dart';

class UpdateUserInfoBloc extends Bloc<UpdateUserInfoEvent, UpdateUserInfoState>{
  final UserRepository _userRepository;
  UpdateUserInfoBloc({required UserRepository repository}) : _userRepository = repository, super(UpdateUserInfoInitial()){
    on<UpdateUserInfo>(_onUpdateUserInfo);
  }

  Future<void> _onUpdateUserInfo(UpdateUserInfo event, Emitter<UpdateUserInfoState> emit) async {
    emit(UpdateUserInfoProcess());
    try{
      await _userRepository.updateUserInfo(event.userModel);
      emit(UpdateUserInfoSuccess());
    } catch (exception) {
      log(exception.toString());
      emit(UpdateUserInfoFailure());
    }
  }
}