import 'package:education_app/models/user.dart';

abstract class UserEvent{}

class FetchUsers extends UserEvent{}

class AddUser extends UserEvent{
  final User user;

  AddUser({required this.user});
}

class UpdateUser extends UserEvent{
  final User user;
  final String docId;

  UpdateUser({required this.user, required this.docId});
}