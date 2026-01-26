import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';

/// lounge 各画面のダイアログ表示イベント（1回限り）。
///
/// - Controller が event を流す
/// - UI が listen して showLinkyDialog を表示
/// - 表示後に null へクリア（再ビルドでの二重表示を防ぐ）
final loungeCreateDialogEventProvider =
    StateProvider.autoDispose<LinkyDialogEvent?>((ref) => null);

/// lounge 投稿作成画面のダイアログ表示イベント（1回限り）。
final loungePostCreateDialogEventProvider =
    StateProvider.autoDispose<LinkyDialogEvent?>((ref) => null);


