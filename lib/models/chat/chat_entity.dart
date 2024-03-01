import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatEntity extends Equatable {
  final String id;
  final String starterId;
  final String receiverId;
  final DateTime startedAt;

  const ChatEntity({
    required this.id,
    required this.starterId,
    required this.receiverId,
    required this.startedAt,
  });

  Map<String, Object?> toDocument(){
    return {
      'id': id,
      'starterId': starterId,
      'receiverId': receiverId,
      'startedAt': startedAt,
    };
  }

  ChatEntity fromDocument(Map<String, dynamic> document) {
    return ChatEntity(
      id: document['id'] as String,
      starterId: document['starterId'] as String,
      receiverId: document['receiverId'] as String,
      startedAt: (document['startedAt'] as Timestamp).toDate(),
    );
  }

  @override
  String toString() {
    return ''' ChatEntity : { 
    id: $id,
    starterId: $starterId,
    receiverId: $receiverId,
    startedAt: $startedAt,
    }''';
  }

  @override
  List<Object?> get props => [id, starterId, receiverId, startedAt];
}
