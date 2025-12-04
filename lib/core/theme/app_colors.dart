import 'package:flutter/material.dart';

/// アプリ全体で使用するカラー定義。
class AppColors {
  /// 完全に static メンバーだけをまとめたユーティリティクラスであることを明確にし、インスタンス生成を禁止するためのコードです。
  const AppColors._();

  /// スプラッシュ画面の背景色 (#E6F7FF)。
  static const Color splashBackground = Color(0xFFE6F7FF);

  /// 左から右（45度方向）に向かって #4A90E2 から #50E3C2 に変化するグラデーション。
  static const LinearGradient linky45degGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: <Color>[Color(0xFF4A90E2), Color(0xFF50E3C2)],
  );
}


