import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/features/notification/domain/entities/notification_settings.dart';
import 'package:linky_project_0318/features/notification/notification_exports.dart';

/// 通知設定の状態を管理する Controller。
///
/// - 画面入場時に通知設定を取得する
/// - スイッチ切り替え時に更新を行う（API 差し替えに備えて repository 経由）
class NotificationSettingsController
    extends AutoDisposeAsyncNotifier<NotificationSettings> {
  @override
  Future<NotificationSettings> build() async {
    final repo = ref.read(notificationRepositoryProvider);
    return repo.getSettings();
  }

  Future<void> setCommentEnabled(bool value) async {
    final current = state.valueOrNull;
    if (current == null) return;

    final next = current.copyWith(commentEnabled: value);
    state = AsyncData(next);

    final repo = ref.read(notificationRepositoryProvider);
    await repo.updateSettings(next);
  }

  Future<void> setLoungeRequestEnabled(bool value) async {
    final current = state.valueOrNull;
    if (current == null) return;

    final next = current.copyWith(loungeRequestEnabled: value);
    state = AsyncData(next);

    final repo = ref.read(notificationRepositoryProvider);
    await repo.updateSettings(next);
  }
}


