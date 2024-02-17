import 'package:education_app/models/user/user_model.dart';

abstract class UserState{}

class UserInitial extends UserState{}

class UserLoading extends UserState{
  final String currentUserId;

  UserLoading({required this.currentUserId});
}

class UserLoaded extends UserState{}

class UserError extends UserState{}

class UserChangesSaved extends UserState{}