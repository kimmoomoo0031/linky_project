import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/features/home/presentation/controllers/home_controller.dart';

/// Home 機能の画面向け Provider 群。
final homeControllerProvider =
    AsyncNotifierProvider<HomeController, HomeViewData>(HomeController.new);


