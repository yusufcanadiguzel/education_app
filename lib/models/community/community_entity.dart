import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/user/user_entity.dart';
import 'package:education_app/models/user/user_model.dart';
import 'package:equatable/equatable.dart';

class CommunityEntity extends Equatable {
  final String id;
  final String name;
  final int memberCount;
  final DateTime createdAt;
  final UserModel creator;

  const CommunityEntity({
    required this.id,
    required this.name,
    this.memberCount = 0,
    required this.createdAt,
    required this.creator,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'name': name,
      'memberCount': memberCount,
      'createdAt': createdAt,
      'creator': creator.toEntity().toDocument(),
    };
  }

  static CommunityEntity fromDocument(Map<String, dynamic> document) {
    return CommunityEntity(
      id: document['id'] as String,
      name: document['name'] as String,
      memberCount: document['memberCount'] as int,
      createdAt: (document['createdAt'] as Timestamp).toDate(),
      creator:
          UserModel.fromEntity(UserEntity.fromDocument(document['creator'])),
    );
  }

  @override
  String toString() {
    return ''' CommunityEntity : { 
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
