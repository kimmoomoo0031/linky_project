import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/post/domain/entities/my_post.dart';
import 'package:linky_project_0318/core/export/post_exports.dart';
import 'package:linky_project_0318/core/error/app_error_messages.dart';

class MyPostsController extends AsyncNotifier<List<MyPost>> {
  @override
  Future<List<MyPost>> build() async {
    final result = await ref.read(getMyPostsUseCaseProvider).call();
    return result.when(
      success: (items) => items,
      networkError: () => throw const AppErrorNetwork(),
      serverError: () => throw const AppErrorServer(),
    );
  }
}


