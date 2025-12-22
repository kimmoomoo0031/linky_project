import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';

abstract class PostRepository {
  Future<List<MyPost>> getMyPosts();
}


