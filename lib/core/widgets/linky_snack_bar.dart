import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';

/// Linky 共通スナックバー（ロゴ + メッセージ）。
///
/// - UX: 連続で出ると邪魔なので、出す前に現在の SnackBar を閉じる
/// - デザイン: 浮かせる（floating）/ 角丸 / ダーク寄りの背景
void showLinkySnackBar(
  BuildContext context, {
  required String message,
  Duration duration = const Duration(seconds: 4),
}) {
  final cs = Theme.of(context).colorScheme;
  final textStyle = AppTextStyles.body14.copyWith(color: cs.onInverseSurface);

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: duration,
        elevation: 0,
        backgroundColor: cs.inverseSurface.withAlpha(235),
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.linkyLogoSvg,
              width: 22,
              height: 22,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
}


