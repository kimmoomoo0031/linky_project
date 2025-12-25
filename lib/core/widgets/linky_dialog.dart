import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';

/// アプリ共通のシンプルなダイアログ。
///
/// [type] によって色味を少し変えて、
/// - info: 通常の案内
/// - warning: 注意
/// - error: エラー
/// のニュアンスを出す。
Future<void> showLinkyDialog({
  required BuildContext context,
  String? title,
  required String message,
  String closeText = 'とじる',
  LinkyDialogType type = LinkyDialogType.info,
  String? svgAssetPath,

}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      final cs = Theme.of(ctx).colorScheme;
      final Color borderColor;
      final Color textColor;

      switch (type) {
        case LinkyDialogType.warning:
          borderColor = cs.primary;
          textColor = cs.onSurfaceVariant;
          break;
        case LinkyDialogType.error:
          borderColor = cs.error;
          textColor = cs.error;
          break;
        case LinkyDialogType.info:
          borderColor = cs.primary;
          textColor = cs.onSurfaceVariant;
          break;
      }

      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
            decoration: BoxDecoration(
              color: cs.surface,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (svgAssetPath != null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: SvgPicture.asset(
                      svgAssetPath,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ],
                if (title != null && title.isNotEmpty) ...[
                  //タイトル
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.heading20.copyWith(
                      color: cs.onSurface,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
                //本文
                Text(
                  message,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.body14.copyWith(
                    color: textColor,
                    height: 2
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: borderColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: cs.surface,
                    ),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text(
                      closeText,
                      style: AppTextStyles.body16Bold.copyWith(
                        color: cs.onSurface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

