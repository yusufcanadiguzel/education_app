import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState{}

class AuthInitial extends AuthState{}

class AuthLoading extends AuthState{}

class AuthLoaded extends AuthState{}

class AuthSuccesfull extends AuthState{}

class AuthError extends AuthState{}