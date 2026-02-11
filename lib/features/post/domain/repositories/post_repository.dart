import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';
import 'package:linky_project_0318/features/post/domain/entities/post_detail.dart';
import 'package:linky_project_0318/features/post/domain/entities/reaction_counts.dart';

abstract class PostRepository {
  Future<List<MyPost>> getMyPosts();

  Future<PostDetail> getPostDetail({required String postId});

  Future<ReactionCounts> likePost({required String postId});

  Future<ReactionCounts> dislikePost({required String postId});
}


