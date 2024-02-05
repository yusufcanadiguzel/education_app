import 'package:education_app/models/user.dart';

abstract class UserDetailState {}

class UserDetailInitial extends UserDetailState {}

class UserDetailLoaded extends UserDetailState {
  final User user;

  UserDetailLoaded({required this.user});
}

class UserDetailError extends UserDetailState {}
