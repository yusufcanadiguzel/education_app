import 'package:education_app/blocs/user_details_bloc/user_detail_event.dart';
import 'package:education_app/blocs/user_details_bloc/user_detail_state.dart';
import 'package:education_app/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState>{
  UserDetailBloc() : super(UserDetailInitial()){
    on<GetUserDetail>(_onGetUserDetail);
  }

  final UserRepository _repository = UserRepository();

  Future<void> _onGetUserDetail(GetUserDetail event, Emitter<UserDetailState> emit) async {
    try{
      emit(UserDetailLoaded(user: await _repository.getUserById(event.userId)));
    }catch (exception){
      emit(UserDetailError());
    }
  }
}
