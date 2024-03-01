import 'package:education_app/models/community/community_entity.dart';
import 'package:equatable/equatable.dart';

import '../user/user_model.dart';

class Community extends Equatable{
  String id;
  String name;
  String description;
  int memberCount;
  DateTime createdAt;
  UserModel creator;

  Community({
    required this.id,
    required this.name,
    required this.description,
    this.memberCount = 0,
    required this.createdAt,
    required this.creator,
  });

  static final empty = Community(
    id: '',
    name: '',
    description: '',
    memberCount: 0,
    createdAt: DateTime.now(),
    creator: UserModel.empty,
  );

  Community copyWith({
    String? id,
    String? name,
    String? description,
    int? memberCount,
    DateTime? createdAt,
    UserModel? creator,
  }) {
    return Community(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
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
      description: description,
      memberCount: memberCount,
      createdAt: createdAt,
      creator: creator,
    );
  }

  static Community fromEntity(CommunityEntity communityEntity) {
    return Community(
      id: communityEntity.id,
      name: communityEntity.name,
      description: communityEntity.description,
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
    description: $description,
    memberCount: $memberCount,
    createdAt: $createdAt,
    creator: $creator,
    }''';
  }

  @override
  List<Object?> get props => [id, name, description, memberCount, createdAt, creator];
}
