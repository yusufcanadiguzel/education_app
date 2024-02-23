import 'package:education_app/models/user/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable{
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState{}

class UserProcess extends UserState{}

class UserSuccess extends UserState{
  final UserModel userModel;

  const UserSuccess({required this.userModel});
}

class UserFailure extends UserState{}