import 'dart:async';

import 'package:education_app/models/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository{
  Stream<User?> get currentUser;

  Future<void> signIn(String email, String password);

  Future<UserModel> signUp(UserModel userModel, String password);

  Future<void> logOut();

  Future<void> resetPassword(String email);

  Future<UserModel> getUserById(String id);

  Future<void> createUser(UserModel userModel);

  Future<String> updatePicture(String userId, String file);
}