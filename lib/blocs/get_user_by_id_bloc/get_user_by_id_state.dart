import 'package:education_app/models/user/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class GetUserByIdState extends Equatable{
  const GetUserByIdState();

  @override
  List<Object?> get props => [];
}

class GetUserByIdInitial extends GetUserByIdState{}

class GetUserByIdProcess extends GetUserByIdState{}

class GetUserByIdSuccess extends GetUserByIdState{
  final UserModel user;

  const GetUserByIdSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

class GetUserByIdFailure extends GetUserByIdState{}