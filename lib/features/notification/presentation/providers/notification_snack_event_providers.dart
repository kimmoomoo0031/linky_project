import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 通知一覧向けの 1 回限りスナックイベント。
final notificationSnackEventProvider =
    StateProvider.autoDispose<String?>((ref) => null);

/// 通知設定向けの 1 回限りスナックイベント。
final notificationSettingsSnackEventProvider =
    StateProvider.autoDispose<String?>((ref) => null);


