import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/features/auth/di/auth_di.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/login_controller.dart';
import 'package:linky_project_0318/features/auth/presentation/states/login_state.dart';

/// ログイン画面用 StateNotifierProvider。
final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginState>((ref) {
  final useCase = ref.watch(loginUseCaseProvider);
  return LoginController(ref, useCase);
});


