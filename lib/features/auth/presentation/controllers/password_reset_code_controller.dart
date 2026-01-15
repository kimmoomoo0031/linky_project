import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/debug/app_log.dart';
import 'package:linky_project_0318/core/debug/logged_action.dart';
import 'package:linky_project_0318/core/utils/validators.dart';
import 'package:linky_project_0318/core/utils/regex.dart';
import 'package:linky_project_0318/features/auth/presentation/states/password_reset_code_state.dart';
import 'package:linky_project_0318/core/dialog_type_exports.dart';
import 'package:linky_project_0318/core/ui/events/linky_dialog_event.dart';
import 'package:linky_project_0318/features/auth/presentation/auth_dialog_event_providers.dart';
import 'package:linky_project_0318/features/auth/presentation/constants/auth_dialog_messages.dart';
import 'package:linky_project_0318/core/constants/dialog_messages.dart';

/// パスワード再設定の「認証コード入力」画面用コントローラ。
///
/// 4桁のコード入力値とバリデーション、ローディング状態を管理する。
class PasswordResetCodeController extends StateNotifier<PasswordResetCodeState> {
  PasswordResetCodeController(this._ref) : super(const PasswordResetCodeState());

  final Ref _ref;
  bool _isResending = false;

  void onCodeChanged(int index, String value) {
    // 常に最後の1文字だけを保持し、数字以外は受け付けない。
    String trimmed = value;
    if (trimmed.length > 1) {
      trimmed = trimmed.substring(trimmed.length - 1);
    }
    if (trimmed.isNotEmpty && !RegexPatterns.otpDigit.hasMatch(trimmed)) {
      trimmed = '';
    }

    switch (index) {
      case 0:
        state = state.copyWith(code1: trimmed, codeError: null);
        break;
      case 1:
        state = state.copyWith(code2: trimmed, codeError: null);
        break;
      case 2:
        state = state.copyWith(code3: trimmed, codeError: null);
        break;
      case 3:
        state = state.copyWith(code4: trimmed, codeError: null);
        break;
    }
  }

  /// ダイアログイベントをクリアする（画面側で showDialog 後に呼ぶ想定）。
  void clearDialogEvent() {
    _ref.read(passwordResetCodeDialogEventProvider.notifier).state = null;
  }

  void _emitDialog(LinkyDialogEvent event) {
    _ref.read(passwordResetCodeDialogEventProvider.notifier).state = event;
  }

  /// 画面をリフレッシュしたいときにコード入力とエラーをまとめてリセットする。
  void resetCode() {
    state = const PasswordResetCodeState();
  }

  bool _validateCode() {
    final error = Validators.validateOtpCode(state.combinedCode, length: 4);
    if (error != null) {
      state = state.copyWith(isSuccess: false, codeError: error);
      return false;
    }
    return true;
  }

  /// 認証コード送信ボタンタップ時の処理。
  ///
  /// いまは API 未連携のため、ローカルバリデーションと
  /// ダミーの成功メッセージのみ実装している。
  Future<void> submit({required String email}) async {
    return runLogged(
      feature: 'AUTH',
      action: 'passwordResetCode.submit',
      fields: {
        'email': AppLog.maskEmail(email),
        'code': AppLog.maskSecret(),
      },
      blockReason: () {
        if (state.isLoading) return 'isLoading';
        if (!_validateCode()) return 'validation';
        return null;
      },
      blockFields: () => {
        'error': state.codeError,
      },
      run: () async {
        // 連続で試すケースに備え、成功フラグは毎回リセットしてから開始する。
        state = state.copyWith(isLoading: true, isSuccess: false);
        try {
          // TODO(api): 認証コード検証用の UseCase を呼び出す。
          // 現在はモック：1234 のみ有効とする。
          await Future.delayed(const Duration(seconds: 1));

          if (state.combinedCode != '1234') {
            _emitDialog(
              const LinkyDialogEvent(
                type: LinkyDialogType.error,
                title: AuthDialogMessages.invalidOtpCodeTitle,
                message: AuthDialogMessages.invalidOtpCodeMessage,
              ),
            );
            state = state.copyWith(isSuccess: false);
            return;
          }

          state = state.copyWith(isSuccess: true);
        } finally {
          // 成功/失敗どちらでも必ずローディングを解除する。
          state = state.copyWith(isLoading: false);
        }
      },
      onException: (e, st) {
        state = state.copyWith(isSuccess: false);
        _emitDialog(
            LinkyDialogEvent(
            type: LinkyDialogType.error,
            message: CommonMessages.failures.verifyResetCodeFailed.message,
          ),
        );
      },
    );
  }

  /// 認証コードの再送信。
  ///
  /// いまは API 未連携のため、ダミー遅延 + 成功/失敗ダイアログのみ。
  /// 成功したら true を返す（画面側で入力欄クリアするかの判断用）。
  Future<bool> resendEmail({required String email}) async {
    return runLoggedValue<bool>(
      feature: 'AUTH',
      action: 'passwordResetCode.resendEmail',
      fields: {'email': AppLog.maskEmail(email)},
      blockedValue: false,
      blockReason: () {
        if (_isResending) return '_isResending';
        return null;
      },
      run: () async {
        _isResending = true;
        try {
          // TODO(api): 認証コード再送信の UseCase を呼び出す。
          await Future.delayed(const Duration(seconds: 1));

          resetCode();

          _emitDialog(
              LinkyDialogEvent(
              type: LinkyDialogType.info,
              message: CommonMessages.success.resendResetCodeSucceeded.message,
            ),
          );
          return true;
        } finally {
          _isResending = false;
        }
      },
      ok: (v) => v,
      onException: (e, st) {
        _emitDialog(
            LinkyDialogEvent(
            type: LinkyDialogType.error,
            message: CommonMessages.failures.resendResetCodeFailed.message,
          ),
        );
        return false;
      },
    );
  }
}



