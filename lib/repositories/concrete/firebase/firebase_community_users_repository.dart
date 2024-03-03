import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/models/communityUser/communityUser.dart';
import 'package:education_app/repositories/abstract/community_users.repository.dart';
import 'package:uuid/uuid.dart';

class FirebaseCommunityUsersRepository extends CommunityUsersRepository{
  final _collection = FirebaseFirestore.instance.collection(MagicStrings.communityUsersCollectionName);

  @override
  Future<void> joinCommunity(CommunityUser communityUser) async {
    try{
      communityUser.id = const Uuid().v4();

      await _collection.doc(communityUser.id).set(communityUser.toEntity().toDocument());
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  @override
  Future<void> leaveCommunity(String docId) async {
    try{
      await _collection.doc(docId).delete();
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

}