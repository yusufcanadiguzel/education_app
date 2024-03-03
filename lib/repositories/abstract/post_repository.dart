import 'package:education_app/models/post/post.dart';

abstract class PostRepository{
  Future<void> createPost(Post post);
  Future<List<Post>> getPostByCommunityId(String communityId);
  Future<Stream<List<Post>>> getPostStreamByCommunity(String communityId);
  Future<Stream<List<Post>>> getPostStream();
  Future<List<Post>> getAllPosts();
}