import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/features/auth/di/auth_di.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/password_reset_new_password_controller.dart';
import 'package:linky_project_0318/features/auth/presentation/states/password_reset_new_password_state.dart';

/// 新しいパスワード設定画面用 StateNotifierProvider。
final passwordResetNewPasswordControllerProvider = StateNotifierProvider.autoDispose<
    PasswordResetNewPasswordController, PasswordResetNewPasswordState>((ref) {
  final useCase = ref.watch(resetPasswordUseCaseProvider);
  return PasswordResetNewPasswordController(ref, useCase);
});


