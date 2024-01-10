import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/user.dart' as user_model;
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void registerUser(user_model.User user){
    var credential = _auth.createUserWithEmailAndPassword(email: user.email, password: user.password);
    
    if(credential == null){
      print('kullanıcı oluşturulamadı.');
    }
  }
  
  Future<void> createUser(user_model.User user) async {
    await _firestore.collection('users').add({
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'password': user.password
    });
  }
}