
import 'dart:io';

import 'package:education_app/models/user/user_model.dart';

abstract class UserEvent{}

class FetchUsers extends UserEvent{}

class AddUser extends UserEvent{
  final UserModel user;

  AddUser({required this.user});
}

class UpdateUser extends UserEvent{
  final UserModel user;
  final String docId;

  UpdateUser({required this.user, required this.docId});
}

class UpdateUserPicture extends UserEvent{
  final File? pickedFile;
  final String docId;

  UpdateUserPicture({required this.pickedFile, required this.docId});
}