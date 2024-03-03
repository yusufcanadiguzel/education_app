import 'package:education_app/models/communityUser/communityUser.dart';

abstract class CommunityUsersRepository{
  Future<void> joinCommunity(CommunityUser communityUser);
  Future<void> leaveCommunity(String docId);
}