import 'package:education_app/models/user/user_model.dart';

abstract class UserDetailState {}

class UserDetailInitial extends UserDetailState {}

class UserDetailLoaded extends UserDetailState {
  final UserModel user;

  UserDetailLoaded({required this.user});
}

class UserDetailError extends UserDetailState {}
