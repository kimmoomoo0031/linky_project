import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/lounge/presentation/controllers/lounge_search_controller.dart';

/// ラウンジ検索画面向け Provider。
final loungeSearchControllerProvider =
    AsyncNotifierProvider<LoungeSearchController, LoungeSearchViewData>(
  LoungeSearchController.new,
);


