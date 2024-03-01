import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/message/message.dart';
import 'package:education_app/models/message/message_entity.dart';
import 'package:education_app/repositories/abstract/message_repository.dart';
import 'package:uuid/uuid.dart';

class FirebaseMessageRepository extends MessageRepository {
  final _collection = FirebaseFirestore.instance.collection('messages');

  @override
  Future<List<Message>> getMessagesByReceiverId(String id) async {
    try {
      return await _collection.orderBy('sendedAt')
          .where('receiverId', isGreaterThanOrEqualTo: id)
          .get()
          .then((value) =>
          value.docs
              .map((e) =>
              Message.fromEntity(MessageEntity.fromDocument(e.data())))
              .toList());
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getMessagesStreamByUser(
      String receiverId) async {
    try {
      return _collection.where('receiverId', isEqualTo: receiverId).snapshots();
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  @override
  Future<List<Message>> getMessages() {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  Future<void> sendMessage(Message message) async {
    try {
      message.id = const Uuid().v4();
      message.sendedAt = DateTime.now();

      await _collection.doc(message.id).set(message.toEntity().toDocument());
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getAllMessages(String) {
    // TODO: implement getAllMessages
    throw UnimplementedError();
  }

  @override
  Future<Stream<List<Message>>> getMessageStream() async {
    try {
      return _collection.orderBy('sendedAt').snapshots().map((snapshot) {
        return snapshot.docs.map((document) {
          var message = Message.fromEntity(MessageEntity.fromDocument(document.data()));

          return message;
        }).toList();
      },);
    } catch (exception) {
    log(exception.toString());
    rethrow;
    }
  }
}
