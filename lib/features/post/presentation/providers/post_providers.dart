import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';
import 'package:linky_project_0318/features/post/presentation/controllers/post_detail_controller.dart';
import 'package:linky_project_0318/features/post/presentation/controllers/my_posts_controller.dart';

final myPostsControllerProvider =
    AsyncNotifierProvider<MyPostsController, List<MyPost>>(MyPostsController.new);

/// 投稿詳細画面用 Provider（postId ごと）。
final postDetailControllerProvider = AsyncNotifierProvider.autoDispose
    .family<PostDetailController, PostDetailViewData, String>(
  PostDetailController.new,
);

/// 投稿詳細画面のスナックバー用ワンショットイベント。
final postDetailSnackEventProvider =
    StateProvider.autoDispose<String?>((ref) => null);


