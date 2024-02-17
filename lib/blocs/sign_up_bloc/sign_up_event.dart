import 'package:education_app/models/user/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable{
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SignUp extends SignUpEvent{
  UserModel user;
  String password;

  SignUp({required this.user, required this.password});

  @override
  List<Object?> get props => [];
}