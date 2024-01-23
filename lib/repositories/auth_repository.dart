import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser(String email, String password) async {
    var credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    if(credential == null){
      print('register error');
    }
  }

  User? getCurrentUser(){
    var user = _auth.currentUser;

    return user;
  }
}