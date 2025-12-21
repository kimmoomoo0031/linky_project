import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';

/// 共通の検索バー UI。
///
/// - 見た目は Home の検索バーと同一のデザインを想定
/// - 入力ありの場合、右側にクリア（X）ボタンを表示できる
class LinkySearchBar extends StatelessWidget {
  const LinkySearchBar({
    super.key,
    required this.hintText,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.showClearButton = false,
    this.onPressedClear,
  });

  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool showClearButton;
  final VoidCallback? onPressedClear;

  // suffixIcon の幅を固定し、入力テキストが長くなってもアイコン位置が揺れないようにする。
  static const double _suffixWidthWithoutClear = 44;
  static const double _suffixWidthWithClear = 84;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final iconColor = cs.outlineVariant;

    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus,
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: true,
          // 高さ40の中でプレースホルダー／カーソルが中央に見えるように調整する
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          hintText: hintText,
          hintStyle: AppTextStyles.body12.copyWith(color: iconColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: cs.outlineVariant),
          ),
          suffixIcon: SizedBox(
            width: showClearButton ? _suffixWidthWithClear : _suffixWidthWithoutClear,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (showClearButton)
                  IconButton(
                    onPressed: onPressedClear,
                    padding: EdgeInsets.zero,
                    // 見た目の余白は最小にしつつ、タップ領域は確保する
                    constraints:
                        const BoxConstraints.tightFor(width: 40, height: 40),
                    icon: SvgPicture.asset(
                      AppAssets.searchXButtonLogoSvg,
                      width: 18,
                      height: 18,
                      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(
                    AppAssets.searchLogoSvg,
                    width: 25,
                    height: 25,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ),
          // suffixIcon の最小幅（デフォルト48程度）で右側に余白が出やすいため、幅の下限を外す
          suffixIconConstraints: const BoxConstraints(minHeight: 40),
        ),
      ),
    );
  }
}


