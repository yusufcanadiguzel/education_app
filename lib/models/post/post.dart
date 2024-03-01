import 'package:education_app/models/post/post_entity.dart';
import 'package:equatable/equatable.dart';

import '../user/user_model.dart';

class Post extends Equatable {
  String id;
  String communityId;
  UserModel creator;
  String post;
  DateTime createdAt;

  Post({
    required this.id,
    required this.communityId,
    required this.creator,
    required this.post,
    required this.createdAt,
  });

  static final empty = Post(
    id: '',
    communityId: '',
    creator: UserModel.empty,
    post: '',
    createdAt: DateTime.now(),
  );

  Post copyWith({
    String? id,
    String? communityId,
    UserModel? creator,
    String? post,
    DateTime? createdAt,
  }) {
    return Post(
      id: id ?? this.id,
      communityId: communityId ?? this.communityId,
      creator: creator ?? this.creator,
      post: post ?? this.post,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  bool get isEmpty => this == Post.empty;

  bool get isNotEmpty => this != Post.empty;

  PostEntity toEntity() {
    return PostEntity(
      id: id,
      communityId: communityId,
      creator: creator,
      post: post,
      createdAt: createdAt,
    );
  }

  static Post fromEntity(PostEntity postEntity) {
    return Post(
      id: postEntity.id,
      communityId: postEntity.communityId,
      creator: postEntity.creator,
      post: postEntity.post,
      createdAt: postEntity.createdAt,
    );
  }

  @override
  String toString() {
    return ''' Post : { 
    id: $id,
    communityId: $communityId,
    creator: $creator,
    post: $post,
    createdAt: $createdAt,
    }''';
  }

  @override
  List<Object?> get props => [id, communityId, creator, post, createdAt];
}
