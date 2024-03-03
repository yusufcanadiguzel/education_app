import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/chat/chat.dart';
import 'package:education_app/repositories/abstract/chat_repository.dart';
import 'package:uuid/uuid.dart';

class FirebaseChatRepository extends ChatRepository{
  final _collection = FirebaseFirestore.instance.collection('chats');

  @override
  Future<void> createChat(Chat chat) async {
    try{
      chat.id == const Uuid().v4();
      await _collection.doc(chat.id).set(chat.toEntity().toDocument());
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

}