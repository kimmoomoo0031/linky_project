import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/my_post.dart';
import '../../post_exports.dart';

class MyPostsController extends AsyncNotifier<List<MyPost>> {
  @override
  Future<List<MyPost>> build() async {
    final repo = ref.read(postRepositoryProvider);
    return repo.getMyPosts();
  }
}


