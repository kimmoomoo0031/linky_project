import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/core/export/widgets_exports.dart';

/// User 機能の「1回限り」ダイアログイベント。
final profileEditDialogEventProvider =
    StateProvider.autoDispose<LinkyDialogEvent?>((ref) => null);

/// 退会（アカウント削除）画面の「1回限り」ダイアログイベント。
final withdrawDialogEventProvider =
    StateProvider.autoDispose<LinkyDialogEvent?>((ref) => null);


