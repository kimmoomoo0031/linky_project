import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/utils/validators.dart';

import '../../../../core/utils/regex.dart';
import 'password_reset_code_state.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/ui/events/linky_dialog_event.dart';
import 'package:linky_project_0318/features/auth/presentation/auth_dialog_event_providers.dart';

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
    if (state.isLoading) return;

    if (!_validateCode()) return;

    // 連続で試すケースに備え、成功フラグは毎回リセットしてから開始する。
    state = state.copyWith(isLoading: true, isSuccess: false);

    try {
      // TODO(api): 認証コード検証用の UseCase を呼び出す。
      await Future.delayed(const Duration(seconds: 1));

      state = state.copyWith(isSuccess: true);
    } catch (_) {
      state = state.copyWith(isSuccess: false);
      _emitDialog(
        const LinkyDialogEvent(
          type: LinkyDialogType.error,
          message: '認証コードの確認に失敗しました。\n時間をおいて再度お試しください。',
        ),
      );
    } finally {
      // 成功/失敗どちらでも必ずローディングを解除する。
      state = state.copyWith(isLoading: false);
    }
  }

  /// 認証コードの再送信。
  ///
  /// いまは API 未連携のため、ダミー遅延 + 成功/失敗ダイアログのみ。
  /// 成功したら true を返す（画面側で入力欄クリアするかの判断用）。
  Future<bool> resendEmail({required String email}) async {
    if (_isResending) return false;
    _isResending = true;

    try {
      // TODO(api): 認証コード再送信の UseCase を呼び出す。
      await Future.delayed(const Duration(seconds: 1));

      resetCode();

      _emitDialog(
        const LinkyDialogEvent(
          type: LinkyDialogType.info,
          message: '認証コードを再送信しました。',
        ),
      );
      return true;
    } catch (_) {
      _emitDialog(
        const LinkyDialogEvent(
          type: LinkyDialogType.error,
          message: '再送信に失敗しました。\n時間をおいて再度お試しください。',
        ),
      );
      return false;
    } finally {
      _isResending = false;
    }
  }
}



