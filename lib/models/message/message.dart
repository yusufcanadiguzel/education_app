import 'package:education_app/models/message/message_entity.dart';
import 'package:equatable/equatable.dart';

class Message extends Equatable{
  String id;
  String senderId;
  String receiverId;
  String message;
  DateTime sendedAt;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.sendedAt,
  });

  static final empty = Message(
    id: '',
    senderId: '',
    receiverId: '',
    message: '',
    sendedAt: DateTime.now(),
  );

  Message copyWith({
    String? id,
    String? senderId,
    String? receiverId,
    String? message,
    DateTime? sendedAt,
  }) {
    return Message(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      message: message ?? this.message,
      sendedAt: sendedAt ?? this.sendedAt,
    );
  }

  bool get isEmpty => this == Message.empty;

  bool get isNotEmpty => this != Message.empty;

  MessageEntity toEntity() {
    return MessageEntity(
      id: id,
      senderId: senderId,
      receiverId: receiverId,
      message: message,
      sendedAt: sendedAt,
    );
  }

  static Message fromEntity(MessageEntity messageEntity) {
    return Message(
      id: messageEntity.id,
      senderId: messageEntity.senderId,
      receiverId: messageEntity.receiverId,
      message: messageEntity.message,
      sendedAt: messageEntity.sendedAt,
    );
  }

  @override
  String toString() {
    return ''' Message : { 
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
