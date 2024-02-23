import 'package:equatable/equatable.dart';

import '../../models/user/user_model.dart';

class GetUsersState extends Equatable{
  const GetUsersState();

  @override
  List<Object?> get props => [];
}

class GetUsersInitial extends GetUsersState{}

class GetUsersProcess extends GetUsersState{}

class GetUsersSuccess extends GetUsersState{
  final List<UserModel> users;

  const GetUsersSuccess({required this.users});
}

class GetUsersFailure extends GetUsersState{}