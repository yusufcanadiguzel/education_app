import 'package:education_app/models/user.dart';

abstract class AuthEvent{}

class RegisterUser extends AuthEvent{
  final String email;
  final String password;

  RegisterUser({required this.email, required this.password});
}

class LoginUser extends AuthEvent{
  final String email;
  final String password;

  LoginUser({required this.email, required this.password});
}

class CheckUser extends AuthEvent{}