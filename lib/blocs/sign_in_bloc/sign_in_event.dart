import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable{
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

class SignInWithMail extends SignInEvent{
  final String email;
  final String password;

  const SignInWithMail({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignOut extends SignInEvent{}