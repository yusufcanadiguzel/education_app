import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/post/post.dart';
import 'package:education_app/models/post/post_entity.dart';
import 'package:education_app/repositories/abstract/post_repository.dart';
import 'package:uuid/uuid.dart';

class FirebasePostRepository extends PostRepository {
  final _collection = FirebaseFirestore.instance.collection('posts');

  @override
  Future<void> createPost(Post post) async {
    try {
      post.id = const Uuid().v4();
      post.createdAt = DateTime.now();

      await _collection.doc(post.id).set(post.toEntity().toDocument());
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  @override
  Future<List<Post>> getPostByCommunityId(String communityId) async {
    try {
      return await _collection
          .where('communityId', isEqualTo: communityId)
          .get()
          .then((value) => value.docs
              .map((e) => Post.fromEntity(PostEntity.fromDocument(e.data())))
              .toList());
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getPostStreamByCommunity(String communityId) async {
    try {
      return _collection.where('communityId', isEqualTo: communityId).snapshots();
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }
}
