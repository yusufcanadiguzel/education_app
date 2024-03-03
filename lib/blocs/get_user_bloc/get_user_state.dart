import 'package:education_app/models/user/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class GetUserState extends Equatable{
  const GetUserState();

  @override
  List<Object?> get props => [];
}

class GetUserInitial extends GetUserState{}

class GetUserProcess extends GetUserState{}

class GetUserSuccess extends GetUserState{
  final UserModel userModel;

  const GetUserSuccess({required this.userModel});
}

class GetUserFailure extends GetUserState{}