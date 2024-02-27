import 'package:education_app/models/community/community.dart';
import 'package:equatable/equatable.dart';

import 'communityUserEntity.dart';

class CommunityUser extends Equatable {
  String id;
  String communityId;
  String userId;

  CommunityUser(
      {required this.id, required this.communityId, required this.userId});

  static final empty = CommunityUser(
    id: '',
    communityId: '',
    userId: '',
  );

  CommunityUser copyWith({
    String? id,
    String? communityId,
    String? userId,
  }) {
    return CommunityUser(
      id: id ?? this.id,
      communityId: communityId ?? this.communityId,
      userId: userId ?? this.userId,
    );
  }

  bool get isEmpty => this == CommunityUser.empty;

  bool get isNotEmpty => this != CommunityUser.empty;

  CommunityUserEntity toEntity() {
    return CommunityUserEntity(
      id: id,
      communityId: communityId,
      userId: userId,
    );
  }

  static CommunityUser fromEntity(CommunityUserEntity communityUserEntity) {
    return CommunityUser(
      id: communityUserEntity.id,
      communityId: communityUserEntity.communityId,
      userId: communityUserEntity.userId,
    );
  }

  @override
  String toString() {
    return ''' CommunityUser : {
    id: $id,
    communityId: $communityId,
    userId: $userId,
    }''';
  }

  @override
  List<Object?> get props => [id, communityId, userId];
}
