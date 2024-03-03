// import 'dart:developer';
//
// import 'package:education_app/blocs/user_bloc/user_event.dart';
// import 'package:education_app/blocs/user_bloc/user_state.dart';
// import 'package:education_app/models/user/user_model.dart';
// import 'package:education_app/repositories/abstract/user_repository.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class UserBloc extends Bloc<UserEvent, UserState> {
//   final UserRepository _userRepository;
//
//   UserBloc({required UserRepository repository})
//       : _userRepository = repository,
//         super(UserInitial()) {
//     on<GetUserById>(_onGetUserById);
//   }
//
// Future<void> _onGetUserById(GetUserById event, Emitter<UserState> emit) async {
//     emit(UserProcess());
//     try{
//       UserModel user = await _userRepository.getUserById(event.id);
//       emit(UserSuccess(userModel: user));
//     } catch (exception) {
//       log(exception.toString());
//       emit(UserFailure());
//     }
//   }
// }
