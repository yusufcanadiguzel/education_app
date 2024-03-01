import 'package:education_app/models/chat/chat_entity.dart';
import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final String id;
  final String starterId;
  final String receiverId;
  final DateTime startedAt;

  const Chat({
    required this.id,
    required this.starterId,
    required this.receiverId,
    required this.startedAt,
  });

  static final empty = Chat(
    id: '',
    starterId: '',
    receiverId: '',
    startedAt: DateTime.now(),
  );

  Chat copyWith({
    String? id,
    String? starterId,
    String? receiverId,
    DateTime? startedAt,
  }) {
    return Chat(
      id: id ?? this.id,
      starterId: starterId ?? this.starterId,
      receiverId: receiverId ?? this.receiverId,
      startedAt: startedAt ?? this.startedAt,
    );
  }

  bool get isEmpty => this == Chat.empty;

  bool get isNotEmpty => this != Chat.empty;

  ChatEntity toEntity() {
    return ChatEntity(
      id: id,
      starterId: starterId,
      receiverId: receiverId,
      startedAt: startedAt,
    );
  }

  static Chat fromEntity(ChatEntity chatEntity) {
    return Chat(
      id: chatEntity.id,
      starterId: chatEntity.starterId,
      receiverId: chatEntity.receiverId,
      startedAt: chatEntity.startedAt,
    );
  }

  @override
  String toString() {
    return ''' Chat : { 
    id: $id,
    starterId: $starterId,
    receiverId: $receiverId,
    startedAt: $startedAt,
    }''';
  }

  @override
  List<Object?> get props => [id, starterId, receiverId, startedAt];
}
