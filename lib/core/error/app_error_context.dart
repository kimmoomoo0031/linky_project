/// [Core/Error] ユーザー向けエラーメッセージ生成時に使う「画面/機能」コンテキスト。
enum AppErrorContext {
  notifications,
  notificationSettings,
  home,
  myPosts,
  loungeSearch,
  loungeMain,
}

extension AppErrorContextLabel on AppErrorContext {
  /// [Core/Error] 画面/機能を表す表示ラベル（日本語）。
  String get label => switch (this) {
        AppErrorContext.notifications => '通知',
        AppErrorContext.notificationSettings => '通知設定',
        AppErrorContext.home => 'ホーム',
        AppErrorContext.myPosts => '投稿',
        AppErrorContext.loungeSearch => '検索',
        AppErrorContext.loungeMain => 'ラウンジ',
      };
}


