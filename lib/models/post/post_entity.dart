import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/user/user_entity.dart';
import 'package:education_app/models/user/user_model.dart';
import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  String id;
  String communityId;
  UserModel creator;
  String post;
  DateTime createdAt;

  PostEntity({
    required this.id,
    required this.communityId,
    required this.creator,
    required this.post,
    required this.createdAt,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'communityId': communityId,
      'creator': creator.toEntity().toDocument(),
      'post': post,
      'createdAt': createdAt,
    };
  }

  static PostEntity fromDocument(Map<String, dynamic> document) {
    return PostEntity(
      id: document['id'] as String,
      communityId: document['communityId'] as String,
      creator: UserModel.fromEntity(UserEntity.fromDocument(document['creator'])),
      post: document['post'] as String,
      createdAt: (document['createdAt'] as Timestamp).toDate(),
    );
  }

  @override
  List<Object?> get props => [id, communityId, creator, post, createdAt];
}
