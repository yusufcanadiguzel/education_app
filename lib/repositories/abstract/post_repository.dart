import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/post/post.dart';

abstract class PostRepository{
  Future<void> createPost(Post post);
  Future<List<Post>> getPostByCommunityId(String communityId);
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getPostStreamByCommunity(String communityId);
}