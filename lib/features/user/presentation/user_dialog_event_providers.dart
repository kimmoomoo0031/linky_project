import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linky_project_0318/core/ui/events/linky_dialog_event.dart';

/// User 機能の「1回限り」ダイアログイベント。
final profileEditDialogEventProvider =
    StateProvider.autoDispose<LinkyDialogEvent?>((ref) => null);


