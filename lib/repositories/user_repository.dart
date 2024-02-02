import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/user.dart' as user_model;

class UserRepository{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(user_model.User user) async {
    await _firestore.collection('users').add({
      'userId': user.userId,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'title': user.title,
      'profilePictureUrl': user.profilePictureUrl
    });
  }
}