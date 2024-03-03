import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/models/post/post.dart';
import 'package:education_app/models/post/post_entity.dart';
import 'package:education_app/repositories/abstract/post_repository.dart';
import 'package:uuid/uuid.dart';

class FirebasePostRepository extends PostRepository {
  final _collection = FirebaseFirestore.instance.collection(MagicStrings.postCollectionName);

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
          .where(MagicStrings.postCommunityIdFieldName, isEqualTo: communityId)
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
  Future<List<Post>> getAllPosts() async {
    try {
      return await _collection
          .orderBy(MagicStrings.postCreatedAtFieldName, descending: true)
          .get()
          .then((snapshot) => snapshot.docs
              .map((document) =>
                  Post.fromEntity(PostEntity.fromDocument(document.data())))
              .toList());
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  @override
  Future<Stream<List<Post>>> getPostStream() async {
    try {
      return _collection
          .orderBy(MagicStrings.postCreatedAtFieldName, descending: true)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((document) {
          var post = Post.fromEntity(PostEntity.fromDocument(document.data()));
          return post;
        }).toList();
      });
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  @override
  Future<Stream<List<Post>>> getPostStreamByCommunity(String communityId) {
    throw UnimplementedError();
  }
}
