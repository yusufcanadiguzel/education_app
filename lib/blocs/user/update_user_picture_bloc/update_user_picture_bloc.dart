import 'dart:developer';

import 'package:education_app/blocs/user/update_user_picture_bloc/update_user_picture_event.dart';
import 'package:education_app/blocs/user/update_user_picture_bloc/update_user_picture_state.dart';
import 'package:education_app/repositories/abstract/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateUserPictureBloc extends Bloc<UpdateUserPictureEvent, UpdateUserPictureState>{
  final UserRepository userRepository;
  UpdateUserPictureBloc({required UserRepository repository}) : userRepository = repository, super(UpdateUserPictureStateInitial()){
    on<UpdateUserPicture>(_onUpdateUserPicture);
  }

  Future<void> _onUpdateUserPicture(UpdateUserPicture event, Emitter<UpdateUserPictureState> emit) async {
    emit(UpdateUserPictureStateProcess());
    try{
      await userRepository.updatePicture(event.userId, event.path, event.file);
      emit(UpdateUserPictureStateSuccess());
    } catch (exception) {
      log(exception.toString());
      emit(UpdateUserPictureStateFailure());
    }
  }
}