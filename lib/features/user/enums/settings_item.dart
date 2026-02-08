import 'package:flutter/material.dart';

/// 設定メニュー項目。
enum SettingsItem {
  /// 通知設定。
  notificationSettings,

  /// ログアウト。
  logout,

  /// 退会する。
  withdraw,
}

extension SettingsItemX on SettingsItem {
  /// 表示タイトル。
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

  /// 表示色（null の場合はデフォルト色）。
  Color? titleColor(ColorScheme cs) {
    switch (this) {
      case SettingsItem.withdraw:
        return cs.error;
      default:
        return null;
    }
  }
}


