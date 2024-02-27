import 'package:education_app/models/community/community_entity.dart';
import 'package:equatable/equatable.dart';

import '../user/user_model.dart';

class Community extends Equatable{
  String id;
  String name;
  int memberCount;
  DateTime createdAt;
  UserModel creator;

  Community({
    required this.id,
    required this.name,
    this.memberCount = 0,
    required this.createdAt,
    required this.creator,
  });

  static final empty = Community(
    id: '',
    name: '',
    memberCount: 0,
    createdAt: DateTime.now(),
    creator: UserModel.empty,
  );

  Community copyWith({
    String? id,
    String? name,
    int? memberCount,
    DateTime? createdAt,
    UserModel? creator,
  }) {
    return Community(
      id: id ?? this.id,
      name: name ?? this.name,
      memberCount: memberCount ?? this.memberCount,
      createdAt: createdAt ?? this.createdAt,
      creator: creator ?? this.creator,
    );
  }

  bool get isEmpty => this == Community.empty;

  bool get isNotEmpty => this != Community.empty;

  CommunityEntity toEntity() {
    return CommunityEntity(
      id: id,
      name: name,
      memberCount: memberCount,
      createdAt: createdAt,
      creator: creator,
    );
  }

  static Community fromEntity(CommunityEntity communityEntity) {
    return Community(
      id: communityEntity.id,
      name: communityEntity.name,
      memberCount: communityEntity.memberCount,
      createdAt: communityEntity.createdAt,
      creator: communityEntity.creator,
    );
  }

  @override
  String toString() {
    return ''' Community : {
    id: $id,
    name: $name,
    memberCount: $memberCount,
    createdAt: $createdAt,
    creator: $creator,
    }''';
  }

  @override
  List<Object?> get props => [id, name, memberCount, createdAt, creator];
}
