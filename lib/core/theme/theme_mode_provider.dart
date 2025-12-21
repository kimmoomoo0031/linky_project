import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/core/storage/shared_prefs_provider.dart';
import 'package:linky_project_0318/core/theme/theme_storage.dart';

final themeStorageProvider = Provider<ThemeStorage>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return ThemeStorage(prefs);
});

/// アプリ全体の ThemeMode（ライト/ダーク）を管理する Provider。
final themeModeProvider =
    NotifierProvider<ThemeModeNotifier, ThemeMode>(ThemeModeNotifier.new);

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.light; // デフォルトはライト

  /// スプラッシュで1回呼ぶ：最後に保存されたテーマを読み、state を確定する。
  Future<void> load() async {
    final storage = ref.read(themeStorageProvider);
    final saved = storage.readMode();
    state = saved == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  /// ライト/ダークをトグルして保存する。
  Future<void> toggle() async {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    final storage = ref.read(themeStorageProvider);
    await storage.writeMode(state == ThemeMode.dark ? 'dark' : 'light');
  }
}


