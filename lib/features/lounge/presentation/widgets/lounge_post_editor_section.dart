import 'package:flutter/material.dart';
import 'package:fleather/fleather.dart';

import 'package:linky_project_0318/core/widgets/display/divider.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';

/// ラウンジ投稿作成用のエディターセクション（UIのみ）
class LoungePostEditorSection extends StatelessWidget {
  const LoungePostEditorSection({
    super.key,
    required this.titleController,
    required this.titleFocusNode,
    required this.contentController,
    required this.contentFocusNode,
  });

  final TextEditingController titleController;
  final FocusNode titleFocusNode;

  final FleatherController contentController;
  final FocusNode contentFocusNode;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    const double bodyLineHeight = 1.3;
    final tunedTheme = FleatherThemeData.fallback(context).copyWith(
      paragraph: TextBlockTheme(
        style: AppTextStyles.body16Regular.copyWith(
          color: cs.onSurface,
          height: bodyLineHeight,
        ),
        spacing: const VerticalSpacing.zero(),
        lineSpacing: const VerticalSpacing.zero(),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: titleController,
          focusNode: titleFocusNode,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'タイトル',
            hintStyle: AppTextStyles.body16.copyWith(
              color: cs.outlineVariant,
              decoration: TextDecoration.none,
              height: bodyLineHeight,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
        const LinkyDivider(height: 1, thickness: 1),
        Expanded(
          child: FleatherTheme(
            data: tunedTheme,
            child: FleatherField(
              controller: contentController,
              focusNode: contentFocusNode,
              decoration: InputDecoration(
                hintText: '内容',
                hintStyle: AppTextStyles.body16Regular.copyWith(
                  color: cs.outlineVariant,
                  decoration: TextDecoration.none,
                  height: bodyLineHeight,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
