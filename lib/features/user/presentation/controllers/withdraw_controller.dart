import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/error/common_messages.dart';
import 'package:linky_project_0318/core/dialog_type_exports.dart';
import 'package:linky_project_0318/core/enums/withdraw_reason.dart';
import 'package:linky_project_0318/core/ui/events/linky_dialog_event.dart';
import 'package:linky_project_0318/core/utils/validators.dart';
import 'package:linky_project_0318/features/user/presentation/states/withdraw_state.dart';
import 'package:linky_project_0318/features/user/presentation/user_dialog_event_providers.dart';

/// 退会フォーム（モック）の入力値・バリデーション・送信中状態を管理するコントローラ。
class WithdrawController extends StateNotifier<WithdrawState> {
  WithdrawController(this._ref) : super(const WithdrawState());

  final Ref _ref;

  void onCurrentPasswordChanged(String value) {
    state = state.copyWith(currentPassword: value, currentPasswordError: null);
  }

  void onReasonChanged(WithdrawReason? reason) {
    state = state.copyWith(reason: reason, reasonError: null);
  }

  void _emitDialog(LinkyDialogEvent event) {
    _ref.read(withdrawDialogEventProvider.notifier).state = event;
  }

  bool _validate() {
    final currentPasswordError = Validators.validatePassword(state.currentPassword);
    final reasonError = state.reason == null ? '退会理由を選択してください' : null;

    if (currentPasswordError != null || reasonError != null) {
      state = state.copyWith(
        currentPasswordError: currentPasswordError,
        reasonError: reasonError,
      );
      return false;
    }
    return true;
  }

  /// 退会処理（モック）。
  ///
  /// - 画面側で確認ダイアログが OK の場合のみ呼び出す
  /// - 成功時: true
  /// - 失敗時: false（ダイアログイベントを発火）
  Future<bool> withdraw() async {
    if (state.isSubmitting) return false;
    if (!_validate()) return false;

    state = state.copyWith(isSubmitting: true);
    try {
      // TODO(api): 退会APIを呼び出す（現在はモック）
      await Future<void>.delayed(const Duration(milliseconds: 500));
      return true;
    } catch (_) {
      _emitDialog(
          LinkyDialogEvent(
          type: LinkyDialogType.error,
          message: CommonMessages.errors.unexpected.message,
        ),
      );
      return false;
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }
}


