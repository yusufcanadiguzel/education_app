import 'package:equatable/equatable.dart';

import '../../models/user/user_model.dart';

abstract class GetUsersByNameState extends Equatable{
  const GetUsersByNameState();

  @override
  List<Object?> get props => [];
}

class GetUsersByNameInitial extends GetUsersByNameState{}

class GetUsersByNameProcess extends GetUsersByNameState{}

class GetUsersByNameSuccess extends GetUsersByNameState{
  final List<UserModel> users;

  const GetUsersByNameSuccess({required this.users});

  @override
  List<Object?> get props => [users];
}

class GetUsersByNameFailure extends GetUsersByNameState{}