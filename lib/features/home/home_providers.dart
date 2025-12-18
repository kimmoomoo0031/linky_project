import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/controllers/home_controller.dart';

/// Home 機能の DI（依存関係のつなぎ込み）を行う Provider 群。

final homeControllerProvider =
    AsyncNotifierProvider<HomeController, HomeViewData>(HomeController.new);


