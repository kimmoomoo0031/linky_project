import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/utils/validators.dart';
import 'package:linky_project_0318/features/auth/domain/usecases/reset_password_result.dart';
import 'package:linky_project_0318/features/auth/domain/usecases/reset_password_usecase.dart';

import 'password_reset_new_password_state.dart';

/// パスワード再設定の「新しいパスワード設定」画面用コントローラ。
///
/// ・入力値（新パスワード/確認）
/// ・バリデーション
/// ・送信中のローディング
/// ・全体エラー（ダイアログ）
/// を一元管理する。
class PasswordResetNewPasswordController
    extends StateNotifier<PasswordResetNewPasswordState> {
  PasswordResetNewPasswordController(this._useCase)
      : super(const PasswordResetNewPasswordState());

  final ResetPasswordUseCase _useCase;

  void onNewPasswordChanged(String value) {
    state = state.copyWith(newPassword: value, newPasswordError: null);
  }

  void onNewPasswordConfirmChanged(String value) {
    state =
        state.copyWith(newPasswordConfirm: value, newPasswordConfirmError: null);
  }

  /// ダイアログ表示後などに全体メッセージをリセットする。
  void clearGeneralMessage() {
    state = state.copyWith(
      generalErrorMessage: null,
      generalErrorType: null,
    );
  }

  bool _validateAll() {
    final passwordError = Validators.validatePassword(state.newPassword);
    final confirmError = Validators.validatePasswordConfirmation(
      password: state.newPassword,
      confirmation: state.newPasswordConfirm,
    );

    if (passwordError != null || confirmError != null) {
      state = state.copyWith(
        isSuccess: false,
        newPasswordError: passwordError,
        newPasswordConfirmError: confirmError,
      );
      return false;
    }
    return true;
  }

  Future<void> submit({
    required String email,
    required String code,
  }) async {
    if (state.isLoading) return;
    if (!_validateAll()) return;

    // 連続で試すケースに備え、成功フラグは毎回リセットしてから開始する。
    state = state.copyWith(isLoading: true, isSuccess: false);

    try {
      final result = await _requestToServer(email: email, code: code);
      _handleResetPasswordResult(result);
    } catch (_) {
      _handleUnexpectedError();
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// 現在の入力値をもとにサーバーへリクエストを送り、ResetPasswordResult を返す。
  Future<ResetPasswordResult> _requestToServer({
    required String email,
    required String code,
  }) {
    return _useCase(
      email: email,
      code: code,
      newPassword: state.newPassword,
    );
  }

  /// ResetPasswordUseCase の結果に応じて state を更新する。
  void _handleResetPasswordResult(ResetPasswordResult result) {
    result.when(
      success: () {
        state = state.copyWith(isSuccess: true);
      },
      invalidCode: () {
        state = state.copyWith(
          generalErrorMessage: '認証コードが無効です。\nもう一度やり直してください。',
          generalErrorType: LinkyDialogType.error,
        );
      },
      weakPassword: () {
        state = state.copyWith(
          newPasswordError: 'パスワードが弱すぎます。条件を満たすように入力してください。',
        );
      },
      networkError: () {
        state = state.copyWith(
          generalErrorMessage:
              'ネットワークエラーが発生しました。\n通信状況を確認してから、もう一度お試しください。',
          generalErrorType: LinkyDialogType.error,
        );
      },
      serverError: () {
        state = state.copyWith(
          generalErrorMessage:
              'サーバーエラーが発生しました。\nしばらく時間をおいて再度お試しください。',
          generalErrorType: LinkyDialogType.error,
        );
      },
    );
  }

  /// 想定外の例外発生時のエラーハンドリング。
  void _handleUnexpectedError() {
    state = state.copyWith(
      generalErrorMessage:
          '予期せぬエラーが発生しました。\nしばらく時間をおいて再度お試しください。',
      generalErrorType: LinkyDialogType.error,
    );
  }
}


