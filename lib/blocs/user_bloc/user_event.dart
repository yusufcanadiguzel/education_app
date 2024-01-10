import 'package:education_app/models/user.dart';

abstract class UserEvent{}

class FetchUsers extends UserEvent{}

class AddUser extends UserEvent{
  final User user;

  AddUser({required this.user});
}