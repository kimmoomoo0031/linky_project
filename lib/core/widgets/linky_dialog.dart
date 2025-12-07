import 'package:flutter/material.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
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
}) {
  Color borderColor;
  Color textColor;

  switch (type) {
    case LinkyDialogType.warning:
      borderColor = AppColors.primaryActionBlue;
      textColor = AppColors.primaryGray;
      break;
    case LinkyDialogType.error:
      borderColor = AppColors.error;
      textColor = AppColors.error;
      break;
    case LinkyDialogType.info:
    default:
      borderColor = AppColors.primaryActionBlue;
      textColor = AppColors.primaryGray;
      break;
  }

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            decoration: BoxDecoration(
              color: AppColors.backgroundBlue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null && title.isNotEmpty) ...[
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.heading24.copyWith(
                      color: AppColors.primaryBlack,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body16.copyWith(
                    color: textColor,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: borderColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: AppColors.primaryWhite,
                    ),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text(
                      closeText,
                      style: AppTextStyles.body16Bold.copyWith(
                        color: AppColors.primaryGray,
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

