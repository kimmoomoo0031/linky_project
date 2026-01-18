import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';

/// ページング（無限スクロール）系のリストでよく使う共通ウィジェット集。
///
/// - 空表示（Empty）
/// - 追加取得中の下部ローダー（Bottom loader）

/// リストが空のときに表示する共通 UI。
class LinkyListEmptyState extends StatelessWidget {
  const LinkyListEmptyState({
    super.key,
    required this.message,
    this.fontSize,
    this.textStyle,
    this.textAlign = TextAlign.center,
  });

  final String message;

  /// `AppTextStyles.body14` をベースに、必要ならフォントサイズだけ上書きする。
  final double? fontSize;

  /// 特定画面で見た目を変えたい場合に、スタイルを丸ごと差し替える。
  final TextStyle? textStyle;

  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final style = textStyle ??
        AppTextStyles.body14.copyWith(
          color: cs.onSurfaceVariant,
          fontSize: fontSize,
        );

    return Center(
      child: Text(
        message,
        textAlign: textAlign,
        style: style,
      ),
    );
  }
}

/// 追加取得中にリスト末尾へ表示する共通ローダー。
class LinkyListBottomLoader extends StatelessWidget {
  const LinkyListBottomLoader({super.key, this.padding});

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}


