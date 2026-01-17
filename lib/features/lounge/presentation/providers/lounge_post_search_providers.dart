import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_post_search_controller.dart';

/// ラウンジ内投稿検索画面向け Provider。
final loungePostSearchControllerProvider = AsyncNotifierProvider<
    LoungePostSearchController, LoungePostSearchViewData>(
  LoungePostSearchController.new,
);

