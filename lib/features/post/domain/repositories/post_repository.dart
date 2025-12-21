import '../entities/my_post.dart';

abstract class PostRepository {
  Future<List<MyPost>> getMyPosts();
}


