import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/widgets/display/divider.dart';

/// PopupMenu 用の共通エントリ群。
class LinkyPopupMenuItem<T> extends PopupMenuItem<T> {
  LinkyPopupMenuItem({
    super.key,
    required T value,
    required String label,
    TextStyle? style,
    bool enabled = true,
  }) : super(
          value: value,
          enabled: enabled,
          child: Text(
              label,
              style: style),
        );
}


