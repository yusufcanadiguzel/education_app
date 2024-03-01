import 'package:education_app/models/post/post_entity.dart';
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  String id;
  String communityId;
  String creatorId;
  String post;
  DateTime createdAt;

  Post({
    required this.id,
    required this.communityId,
    required this.creatorId,
    required this.post,
    required this.createdAt,
  });

  static final empty = Post(
    id: '',
    communityId: '',
    creatorId: '',
    post: '',
    createdAt: DateTime.now(),
  );

  Post copyWith({
    String? id,
    String? communityId,
    String? creatorId,
    String? post,
    DateTime? createdAt,
  }) {
    return Post(
      id: id ?? this.id,
      communityId: communityId ?? this.communityId,
      creatorId: creatorId ?? this.creatorId,
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
      creatorId: creatorId,
      post: post,
      createdAt: createdAt,
    );
  }

  static Post fromEntity(PostEntity postEntity) {
    return Post(
      id: postEntity.id,
      communityId: postEntity.communityId,
      creatorId: postEntity.creatorId,
      post: postEntity.post,
      createdAt: postEntity.createdAt,
    );
  }

  @override
  String toString() {
    return ''' Post : { 
    id: $id,
    communityId: $communityId,
    creatorId: $creatorId,
    post: $post,
    createdAt: $createdAt,
    }''';
  }

  @override
  List<Object?> get props => [id, communityId, creatorId, post, createdAt];
}
