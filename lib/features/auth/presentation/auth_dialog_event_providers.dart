import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/widgets/linky_dialog.dart';

/// auth 各画面のダイアログ表示イベント（1回限り）。
///
/// - Controller が event を流す
/// - UI が listen して showLinkyDialog を表示
/// - 表示後に null へクリア（再ビルドでの二重表示を防ぐ）

final loginDialogEventProvider =
    StateProvider.autoDispose<LinkyDialogEvent?>((ref) => null);

final registerDialogEventProvider =
    StateProvider.autoDispose<LinkyDialogEvent?>((ref) => null);

final passwordResetDialogEventProvider =
    StateProvider.autoDispose<LinkyDialogEvent?>((ref) => null);

final passwordResetCodeDialogEventProvider =
    StateProvider.autoDispose<LinkyDialogEvent?>((ref) => null);

final passwordResetNewPasswordDialogEventProvider =
    StateProvider.autoDispose<LinkyDialogEvent?>((ref) => null);


