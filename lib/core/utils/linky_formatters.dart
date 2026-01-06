import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Linky アプリ共通のフォーマッタ（表示用の整形）を集約するユーティリティ。
///
/// - 画面側で DateFormat / NumberFormat を直書きしない
/// - フォーマット追加/変更の差分を1箇所に集約できる
class LinkyFormatters {
  const LinkyFormatters._();

  static String date(
    DateTime value, {
    String pattern = 'yyyy.MM.dd',
    String? locale,
  }) {
    return DateFormat(pattern, locale).format(value);
  }

  static String number(
    num value, {
    String? locale,
  }) {
    return NumberFormat.decimalPattern(locale).format(value);
  }
}

/// 日付を指定フォーマットで表示する共通 Text ウィジェット。
class LinkyDateText extends StatelessWidget {
  const LinkyDateText(
    this.date, {
    super.key,
    this.pattern = 'yyyy.MM.dd',
    this.style,
    this.locale,
  });

  final DateTime date;
  final String pattern;
  final TextStyle? style;
  final String? locale;

  @override
  Widget build(BuildContext context) {
    return Text(
      LinkyFormatters.date(date, pattern: pattern, locale: locale),
      style: style,
    );
  }
}

/// 数値を 3桁区切り等で表示する共通 Text ウィジェット。
class LinkyNumberText extends StatelessWidget {
  const LinkyNumberText(
    this.value, {
    super.key,
    this.style,
    this.locale,
  });

  final num value;
  final TextStyle? style;
  final String? locale;

  @override
  Widget build(BuildContext context) {
    return Text(
      LinkyFormatters.number(value, locale: locale),
      style: style,
    );
  }
}


