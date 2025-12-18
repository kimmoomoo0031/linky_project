import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/entities/my_post.dart';
import 'presentation/controllers/my_posts_controller.dart';

final myPostsControllerProvider =
    AsyncNotifierProvider<MyPostsController, List<MyPost>>(MyPostsController.new);


