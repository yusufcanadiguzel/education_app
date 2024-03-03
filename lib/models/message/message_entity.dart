import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable{
  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final DateTime sendedAt;

  const MessageEntity({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.sendedAt,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'sendedAt': sendedAt
    };
  }

  static MessageEntity fromDocument(Map<String, dynamic> document) {
    return MessageEntity(
      id: document['id'] as String,
      senderId: document['senderId'] as String,
      receiverId: document['receiverId'] as String,
      message: document['message'] as String,
      sendedAt: (document['sendedAt'] as Timestamp).toDate(),
    );
  }

  @override
  String toString() {
    return ''' MessageEntity : {
      id: $id,
      senderId: $senderId,
      receiverId: $receiverId,
      message: $message,
      sendedAt: $sendedAt,
    }''';
  }

  @override
  List<Object?> get props => [id, senderId, receiverId, message, sendedAt];
}
