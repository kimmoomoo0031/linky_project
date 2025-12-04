import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// アプリ全体で使用するテキストスタイル定義。
///
/// 基本フォントとして Open Sans を利用します。
class AppTextStyles {
  const AppTextStyles._();

  /// 起動画面テキスト (24px, Bold).
  static TextStyle get splashTitleTextStyle24 =>
      GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.bold);
}


