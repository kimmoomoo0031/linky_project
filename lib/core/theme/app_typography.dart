import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// アプリ全体で使用するテキストスタイル定義。
///
/// 基本フォントとして Open Sans を利用し、
/// 「どの画面でも再利用しやすいデザイン・トークン（見出し/本文/キャプションなど）」
/// を中心に定義します。
class AppTextStyles {
  const AppTextStyles._();

  /// 大きな見出し（32px, Bold）。
  /// ログイン画面タイトルや主要画面タイトルなどに使用します。
  static TextStyle get heading32 =>
      GoogleFonts.openSans(fontSize: 32, fontWeight: FontWeight.bold);

  /// 中くらいの見出し（24px, Bold）。
  /// スプラッシュタイトルやセクションタイトルなどに使用します。
  static TextStyle get heading24 =>
      GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.bold);

  /// 中くらいの見出し（20px, Bold）。
  /// スプラッシュタイトルやセクションタイトルなどに使用します。
  static TextStyle get heading20 =>
      GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.bold);

  /// 一般的な本文（18px, bold）。
  static TextStyle get body18 =>
      GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold);

  /// 一般的な本文（16px, bold）。
  static TextStyle get body16 =>
      GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold);

  /// 一般的な本文（14px, bold）。
  /// 補足テキストやサブ説明に使用します。
  static TextStyle get body14 =>
      GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.bold);

  /// 一般的な本文（12px, bold）。
  /// 補足情報やラベル用の小さなテキスト。
  static TextStyle get body12 =>
      GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold);

  /// 一般的な本文（10px, bold）。
  /// 補足情報やラベル用の小さなテキスト。
  static TextStyle get body10 =>
      GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.bold);

  /// 一般的な本文（8px, bold）。
  /// 補足テキストやサブ説明に使用します。
  static TextStyle get body8 =>
      GoogleFonts.openSans(fontSize: 8, fontWeight: FontWeight.bold);

  /// 強調された本文（16px, Bold）。
  /// ボタンラベルや重要なテキストに使用します。
  static TextStyle get body16Bold =>
      GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold);

  /// 補足的なキャプション（12px, Bold）。
  static TextStyle get caption12Bold =>
      GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold);

  /// 一般的な本文（16px, regular）。
  static TextStyle get body16Regular =>
      GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w400);

  /// スプラッシュ画面タイトル用のショートカット。
  /// 内部的には [heading24] を利用します。
  static TextStyle get splashTitleTextStyle24 => heading24;
}

