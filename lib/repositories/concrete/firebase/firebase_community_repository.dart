import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/community/community.dart';
import 'package:education_app/models/community/community_entity.dart';
import 'package:education_app/repositories/abstract/community_repository.dart';
import 'package:uuid/uuid.dart';

class FirebaseCommunityRepository extends CommunityRepository {
  final _communityCollection =
      FirebaseFirestore.instance.collection('communities');

  //Bir topluluk oluşturur
  @override
  Future<void> createCommunity(Community community) async {
    try {
      community.id = const Uuid().v4();
      community.createdAt = DateTime.now();

      await _communityCollection
          .doc(community.id)
          .set(community.toEntity().toDocument());
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  //Bir topluluk siler
  @override
  Future<void> deleteCommunity(int id) {
    // TODO: implement deleteCommunity
    throw UnimplementedError();
  }

  @override
  Future<Community> getCommunityById(String id) async {
    try {
      return await _communityCollection.doc(id).get().then((value) =>
          Community.fromEntity(CommunityEntity.fromDocument(value.data()!)));
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  @override
  Future<List<Community>> getAllCommunities() async {
    try {
      return await _communityCollection.get().then((value) => value.docs
          .map((e) =>
              Community.fromEntity(CommunityEntity.fromDocument(e.data())))
          .toList());
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  @override
  Future<List<Community>> getAllCommunitiesByName(String name) async {
    try {
      return await _communityCollection
          .where('name', isLessThanOrEqualTo: name)
          .get()
          .then((snapshot) => snapshot.docs
              .map((document) => Community.fromEntity(
                  CommunityEntity.fromDocument(document.data())))
              .toList());
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  @override
  Future<void> joinCommunity(String communityId, String userId) {
    // TODO: implement joinCommunity
    throw UnimplementedError();
  }

  @override
  Future<void> leaveCommunity(String docId) {
    // TODO: implement leaveCommunity
    throw UnimplementedError();
  }
}
