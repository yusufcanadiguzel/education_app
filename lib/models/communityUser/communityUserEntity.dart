import 'package:equatable/equatable.dart';

class CommunityUserEntity extends Equatable {
  final String id;
  final String communityId;
  final String userId;

  const CommunityUserEntity({
    required this.id,
    required this.communityId,
    required this.userId,
  });

  Map<String, Object?> toDocument(){
    return {
      'id': id,
      'communityId': communityId,
      'userId': userId
    };
  }

  static CommunityUserEntity fromDocument(Map<String, dynamic> document) {
    return CommunityUserEntity(
      id: document['id'] as String,
      communityId: document['communityId'] as String,
      userId: document['userId'] as String,
    );
  }

  @override
  List<Object?> get props => [id, communityId, userId];
}
