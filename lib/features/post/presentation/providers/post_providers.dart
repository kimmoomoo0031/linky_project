import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';
import 'package:linky_project_0318/features/post/presentation/controllers/my_posts_controller.dart';

final myPostsControllerProvider =
    AsyncNotifierProvider<MyPostsController, List<MyPost>>(MyPostsController.new);


