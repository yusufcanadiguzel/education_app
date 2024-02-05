import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/user.dart' as user_model;

class UserRepository{
  String currentUserId = '';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final collectionName = 'users';

  Future<void> createUser(user_model.User user) async {
    await _firestore.collection(collectionName).add({
      'userId': user.userId,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'title': user.title,
      'profilePictureUrl': user.profilePictureUrl,
    });
  }

  Future<void> updateUser(user_model.User user, String docId) async {
    _firestore.collection(collectionName).doc(docId).update({
      'userId': user.userId,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'title': user.title,
      'profilePictureUrl': user.profilePictureUrl
    });
  }

  Future<user_model.User> getUserById(String docId) async {
    late DocumentSnapshot documentSnapshot;

    await _firestore.collection(collectionName).doc(docId).get().then((value) => documentSnapshot = value);

    var user = user_model.User(
        userId: documentSnapshot['userId'],
        firstName: documentSnapshot['firstName'],
        lastName: documentSnapshot['lastName'],
        email: documentSnapshot['email'],
        title: documentSnapshot['title'],
        profilePictureUrl: documentSnapshot['profilePictureUrl'],
    );

    return user;
  }
}