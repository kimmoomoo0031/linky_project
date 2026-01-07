import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/auth/di/auth_di.dart';
import 'package:linky_project_0318/features/auth/domain/entities/auth_user.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/auth_session_controller.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/login_controller.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/password_reset_code_controller.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/password_reset_controller.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/password_reset_new_password_controller.dart';
import 'package:linky_project_0318/features/auth/presentation/controllers/register_controller.dart';
import 'package:linky_project_0318/features/auth/presentation/states/login_state.dart';
import 'package:linky_project_0318/features/auth/presentation/states/password_reset_code_state.dart';
import 'package:linky_project_0318/features/auth/presentation/states/password_reset_new_password_state.dart';
import 'package:linky_project_0318/features/auth/presentation/states/password_reset_state.dart';
import 'package:linky_project_0318/features/auth/presentation/states/register_state.dart';

/// Auth 関連 Provider を1ファイルに集約。
///
/// NOTE:
/// - ファイル数が増えすぎて追いづらい問題を避けるため、現段階では「まとめる」方針。

/// 現在ログインしているユーザー（未ログインなら null）。
///
/// NOTE:
/// - 現状はモック段階のため、アプリ再起動で消える（永続化は後で対応）。
final authUserProvider = StateProvider<AuthUser?>((ref) => null);

/// セッション操作（ログアウト等）用。
final authSessionControllerProvider =
    AsyncNotifierProvider<AuthSessionController, void>(AuthSessionController.new);

/// ログイン画面用 StateNotifierProvider。
final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginState>((ref) {
  final useCase = ref.watch(loginUseCaseProvider);
  return LoginController(ref, useCase);
});

/// 新規登録画面用 StateNotifierProvider。
/// autoDisposeを書くことでバリデーションエラー時、画面から離れたらエラーがリセット
final registerControllerProvider =
    StateNotifierProvider.autoDispose<RegisterController, RegisterState>((ref) {
  final useCase = ref.watch(registerUseCaseProvider);
  return RegisterController(ref, useCase);
});

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

/// 新しいパスワード設定画面用 StateNotifierProvider。
final passwordResetNewPasswordControllerProvider =
    StateNotifierProvider.autoDispose<PasswordResetNewPasswordController,
        PasswordResetNewPasswordState>((ref) {
  final useCase = ref.watch(resetPasswordUseCaseProvider);
  return PasswordResetNewPasswordController(ref, useCase);
});


