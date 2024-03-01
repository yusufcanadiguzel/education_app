import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  String id;
  String communityId;
  String creatorId;
  String post;
  DateTime createdAt;

  PostEntity({
    required this.id,
    required this.communityId,
    required this.creatorId,
    required this.post,
    required this.createdAt,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'communityId': communityId,
      'creatorId': creatorId,
      'post': post,
      'createdAt': createdAt,
    };
  }

  static PostEntity fromDocument(Map<String, dynamic> document) {
    return PostEntity(
      id: document['id'] as String,
      communityId: document['communityId'] as String,
      creatorId: document['creatorId'] as String,
      post: document['post'] as String,
      createdAt: (document['createdAt'] as Timestamp).toDate(),
    );
  }

  @override
  List<Object?> get props => [id, communityId, creatorId, post, createdAt];
}
