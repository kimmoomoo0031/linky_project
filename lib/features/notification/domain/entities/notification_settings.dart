/// 通知設定の状態を表すエンティティ。
///
/// API 連携後に項目が増えても拡張しやすいように、画面側はこの型だけを見る。
class NotificationSettings {
  const NotificationSettings({
    required this.commentEnabled,
    required this.loungeRequestEnabled,
  });

  /// コメント通知の受信可否。
  final bool commentEnabled;

  /// ラウンジ申請通知の受信可否。
  final bool loungeRequestEnabled;

  NotificationSettings copyWith({
    bool? commentEnabled,
    bool? loungeRequestEnabled,
  }) {
    return NotificationSettings(
      commentEnabled: commentEnabled ?? this.commentEnabled,
      loungeRequestEnabled: loungeRequestEnabled ?? this.loungeRequestEnabled,
    );
  }
}


