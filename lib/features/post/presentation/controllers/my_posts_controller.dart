import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';
import 'package:linky_project_0318/core/export/post_exports.dart';

class MyPostsController extends AsyncNotifier<List<MyPost>> {
  @override
  Future<List<MyPost>> build() async {
    final repo = ref.read(postRepositoryProvider);
    return repo.getMyPosts();
  }
}


