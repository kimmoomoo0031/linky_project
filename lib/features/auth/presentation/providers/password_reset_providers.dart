import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/password_reset_code_controller.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/password_reset_controller.dart';
import 'package:linky_project_0318/features/auth/presentation/states/password_reset_code_state.dart';
import 'package:linky_project_0318/features/auth/presentation/states/password_reset_state.dart';

/// パスワード再設定画面用 StateNotifierProvider。
final passwordResetControllerProvider =
    StateNotifierProvider.autoDispose<PasswordResetController, PasswordResetState>(
        (ref) {
  return PasswordResetController(ref);
});

/// 認証コード入力画面用 StateNotifierProvider。
final passwordResetCodeControllerProvider = StateNotifierProvider.autoDispose<
    PasswordResetCodeController, PasswordResetCodeState>((ref) {
  return PasswordResetCodeController(ref);
});


