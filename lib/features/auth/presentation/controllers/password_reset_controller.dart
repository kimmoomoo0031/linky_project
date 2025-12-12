import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'password_reset_state.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/utils/validators.dart';

/// パスワード再設定画面の入力値・バリデーション・ローディング状態を管理するコントローラ。
class PasswordResetController extends StateNotifier<PasswordResetState> {
  PasswordResetController() : super(const PasswordResetState());

  void onEmailChanged(String value) {
    state = state.copyWith(email: value, emailError: null);
  }

  /// ダイアログ表示後などに全体メッセージをリセットするためのヘルパー。
  void clearGeneralMessage() {
    state = state.copyWith(
      generalErrorMessage: null,
      generalErrorType: null,
    );
  }

  bool _validateEmail() {
    final emailError = Validators.validateEmail(state.email);
    if (emailError != null) {
      state = state.copyWith(
        isSuccess: false,
        emailError: emailError,
      );
      return false;
    }
    return true;
  }

  Future<void> submit() async {
    if (state.isLoading) return;

    if (!_validateEmail()) return;

    // 連続で再送信するケースに備え、成功フラグは毎回リセットしてから開始する。
    // これにより、画面側の `previous?.isSuccess != true && next.isSuccess` が再度成立する。
    state = state.copyWith(isLoading: true, isSuccess: false);

    try {
      // TODO(api): パスワード再設定メール送信 UseCase を呼び出す。
      // いまは UI 動作確認のためにダミーの待ち時間だけ入れている。
      await Future.delayed(const Duration(seconds: 1));

      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        generalErrorMessage:
            'パスワード再設定用のコードを送信しました。',
        generalErrorType: LinkyDialogType.info,
      );
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        generalErrorMessage:
            'メール送信に失敗しました。\n時間をおいて再度お試しください。',
        generalErrorType: LinkyDialogType.error,
      );
    }
  }
}


