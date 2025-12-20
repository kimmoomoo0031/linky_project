import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/features/auth/di/auth_di.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/register_controller.dart';
import 'package:linky_project_0318/features/auth/presentation/states/register_state.dart';

/// 新規登録画面用 StateNotifierProvider。
/// autoDisposeを書くことでバリデーションエラー時、画面から離れたらエラーがリセット
final registerControllerProvider =
    StateNotifierProvider.autoDispose<RegisterController, RegisterState>((ref) {
  final useCase = ref.watch(registerUseCaseProvider);
  return RegisterController(ref, useCase);
});


