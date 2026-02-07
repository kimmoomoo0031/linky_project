import 'package:flutter/material.dart';

/// Home のメニュー項目（UI構成）。
///
/// - 画面遷移や表示テキスト等の “プレゼンテーション都合” を表すため、domain ではなく presentation に置く。
enum HomeMenuItem {
  myPosts,
  profileEdit,
  createLounge,
}

extension HomeMenuItemX on HomeMenuItem {
  String title() {
    switch (this) {
      case HomeMenuItem.myPosts:
        return '自分の投稿';
      case HomeMenuItem.profileEdit:
        return 'プロフィール編集';
      case HomeMenuItem.createLounge:
        return 'ラウンジ作成';
    }
  }
}

enum SettingsItem {
  notificationSettings,
  logout,
  withdraw,
}

extension SettingsItemX on SettingsItem {
  String title() {
    switch (this) {
      case SettingsItem.notificationSettings:
        return '通知設定';
      case SettingsItem.logout:
        return 'ログアウト';
      case SettingsItem.withdraw:
        return '退会する';
    }
  }

  Color? titleColor(ColorScheme cs) {
    switch (this) {
      case SettingsItem.withdraw:
        return cs.error;
      default:
        return null;
    }
  }
}


