import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/message/message.dart';

abstract class MessageRepository{
  Future<void> sendMessage(Message message);
  Future<List<Message>> getMessages();
  Future<List<Message>> getMessagesByReceiverId(String id);
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getMessagesStreamByUser(String receiverId);
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getAllMessages(String receiverId);
  Future<Stream<List<Message>>> getMessageStream();
}