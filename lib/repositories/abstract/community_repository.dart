import 'package:education_app/models/community/community.dart';

abstract class CommunityRepository{
  Future<void> createCommunity(Community community);
  Future<void> deleteCommunity(int id);
  Future<List<Community>> getAllCommunities();
  Future<Community> getCommunityById(String id);
  Future<void> joinCommunity(String communityId, String userId);
  Future<void> leaveCommunity(String docId);
}