import 'package:linky_project_0318/core/dialog_type_exports.dart';

/// ダイアログ表示のための「1回限りのイベント」データ。
///
/// UI(=showLinkyDialog)はそのまま使い、
/// 「いつ/何を表示するか」をイベントとして流すことで
/// 再ビルドや画面復帰での再表示を避けやすくする。
class LinkyDialogEvent {
  const LinkyDialogEvent({
    required this.message,
    this.title,
    this.type = LinkyDialogType.info,
  });

  final String message;
  final String? title;
  final LinkyDialogType type;
}


