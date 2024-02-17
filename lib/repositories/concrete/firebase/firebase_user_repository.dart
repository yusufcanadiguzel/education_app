import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/user/user_entity.dart';
import 'package:education_app/models/user/user_model.dart';
import 'package:education_app/repositories/abstract/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseUserRepository extends UserRepository {
  FirebaseUserRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final _userCollection = FirebaseFirestore.instance.collection('users');

  //Kullanıcı sisteme kayıt olur.
  @override
  Future<UserModel> signUp(UserModel userModel, String password) async {
    try {
      var credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: userModel.email, password: password);

      var createdUser = userModel.copyWith(id: credential.user!.uid);

      return createdUser;
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  //Kullanıcı email ve şifresi ile sisteme giriş yapar.
  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  //Kullanıcını hesabından çıkış yapar.
  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  //Kullanıcının emailine şifre sıfırlama maili gönderir.
  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  //Db üzerinde bir kullanıcı oluşturur.
  @override
  Future<void> createUser(UserModel userModel) async {
    try {
      await _userCollection
          .doc(userModel.id)
          .set(userModel.toEntity().toDocument());
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  //Gönderilen id ile eşleşen kullanıcıyı getirir.
  @override
  Future<UserModel> getUserById(String id) async {
    try {
      return await _userCollection.doc(id).get().then((value) =>
          UserModel.fromEntity(UserEntity.fromDocument(value.data()!)));
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  //Mevcut kullanıcı döndürür.
  @override
  Stream<User?> get currentUser {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      var user = firebaseUser;

      return user;
    });
  }

  //Kullanıcının profil fotoğrafını günceller.
  @override
  Future<String> updatePicture(String userId, String file) async {
    try {
      File imageFile = File(file);
      var firebaseStorageRef =
          FirebaseStorage.instance.ref().child('$userId/PP/${userId}_lead');
      firebaseStorageRef.putFile(imageFile);

      String imageUrl = await firebaseStorageRef.getDownloadURL();
      await _userCollection.doc(userId).update({'profilePictureUrl': imageUrl});
      return imageUrl;
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }
}
