import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/error/ui_app_messages.dart';
import 'package:linky_project_0318/core/error/app_error_messages.dart';

import 'package:linky_project_0318/features/notification/domain/entities/notification_settings.dart';
import 'package:linky_project_0318/core/export/notification_exports.dart';

/// 通知設定の状態を管理する Controller。
///
/// - 画面入場時に通知設定を取得する
/// - スイッチ切り替え時に更新を行う（API 差し替えに備えて repository 経由）
class NotificationSettingsController
    extends AutoDisposeAsyncNotifier<NotificationSettings> {
  void _emitSnack(String message) {
    ref.read(notificationSettingsSnackEventProvider.notifier).state = message;
  }

  @override
  Future<NotificationSettings> build() async {
    // TODO: サーバー保存値を基に初期設定を復元し、ローカルキャッシュと同期する。
    final result = await ref.read(getNotificationSettingsUseCaseProvider).call();
    return result.when(
      success: (settings) => settings,
      networkError: () => throw const AppErrorNetwork(),
      serverError: () => throw const AppErrorServer(),
    );
  }

  Future<void> setCommentEnabled(bool value) async {
    final current = state.valueOrNull;
    if (current == null) return;

    final next = current.copyWith(commentEnabled: value);
    state = AsyncData(next);

    try {
      final result =
          await ref.read(updateNotificationSettingsUseCaseProvider).call(next);
      result.when(
        success: () {},
        networkError: () {
          state = AsyncData(current);
          _emitSnack(CommonMessages.errors.network.message);
        },
        serverError: () {
          state = AsyncData(current);
          _emitSnack(CommonMessages.errors.server.message);
        },
      );
    } catch (_) {
      state = AsyncData(current);
      _emitSnack(CommonMessages.errors.unexpected.message);
    }
  }

  Future<void> setLoungeRequestEnabled(bool value) async {
    final current = state.valueOrNull;
    if (current == null) return;

    final next = current.copyWith(loungeRequestEnabled: value);
    state = AsyncData(next);

    try {
      final result =
          await ref.read(updateNotificationSettingsUseCaseProvider).call(next);
      result.when(
        success: () {},
        networkError: () {
          state = AsyncData(current);
          _emitSnack(CommonMessages.errors.network.message);
        },
        serverError: () {
          state = AsyncData(current);
          _emitSnack(CommonMessages.errors.server.message);
        },
      );
    } catch (_) {
      state = AsyncData(current);
      _emitSnack(CommonMessages.errors.unexpected.message);
    }
  }
}


