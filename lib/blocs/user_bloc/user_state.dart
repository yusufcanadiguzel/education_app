import 'package:education_app/models/user.dart';

abstract class UserState{}

class UserInitial extends UserState{}

class UserLoading extends UserState{}

class UserLoaded extends UserState{}

class UserError extends UserState{}