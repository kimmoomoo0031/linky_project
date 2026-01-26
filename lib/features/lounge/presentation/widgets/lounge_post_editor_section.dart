import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';

import 'package:linky_project_0318/core/widgets/display/divider.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';

/// ラウンジ投稿エディターで使う入力フィールド種別
enum PostQuillFieldVariant {
  title,
  content,
}

/// ラウンジ投稿作成用のエディターセクション（UIのみ）
class LoungePostEditorSection extends StatelessWidget {
  const LoungePostEditorSection({
    super.key,
    required this.titleController,
    required this.titleFocusNode,
    required this.titleScrollController,
    required this.contentController,
    required this.contentFocusNode,
    required this.contentScrollController,
  });

  final quill.QuillController titleController;
  final FocusNode titleFocusNode;
  final ScrollController titleScrollController;

  final quill.QuillController contentController;
  final FocusNode contentFocusNode;
  final ScrollController contentScrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PostQuillField(
          controller: titleController,
          focusNode: titleFocusNode,
          scrollController: titleScrollController,
          variant: PostQuillFieldVariant.title,
          placeholder: 'タイトル',
        ),
        _PostQuillField(
          controller: contentController,
          focusNode: contentFocusNode,
          scrollController: contentScrollController,
          variant: PostQuillFieldVariant.content,
          placeholder: '内容',
        ),
      ],
    );
  }
}

/// ラウンジ投稿作成用の Quill 入力フィールド（タイトル / 本文 共通）
class _PostQuillField extends StatelessWidget {
  const _PostQuillField({
    required this.controller,
    required this.focusNode,
    required this.scrollController,
    required this.variant,
    required this.placeholder,
  });

  final quill.QuillController controller;
  final FocusNode focusNode;
  final ScrollController scrollController;
  final PostQuillFieldVariant variant;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isTitle = variant == PostQuillFieldVariant.title;

    final editor = quill.QuillEditor(
      controller: controller,
      focusNode: focusNode,
      scrollController: scrollController,
      config: quill.QuillEditorConfig(
        padding: EdgeInsets.zero,
        placeholder: placeholder,
        customStyles: _buildCustomStyles(cs),
        scrollable: !isTitle,
        onTapDown: (details, getPosition) {
          FocusScope.of(context).requestFocus(focusNode);
          return false;
        },
        textInputAction: variant == PostQuillFieldVariant.title
            ? TextInputAction.done
            : TextInputAction.newline,
        embedBuilders: variant == PostQuillFieldVariant.content
            ? (kIsWeb
                ? FlutterQuillEmbeds.editorWebBuilders()
                : FlutterQuillEmbeds.editorBuilders())
            : null,
      ),
    );

    return _buildEditorLayout(editor);
  }

  Widget _buildEditorLayout(Widget editor) {
    final isTitle = variant == PostQuillFieldVariant.title;

    if (!isTitle) {
      return Expanded(child: editor);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        editor,
        const LinkyDivider(height: 1, thickness: 1),
      ],
    );
  }

  quill.DefaultStyles _buildCustomStyles(ColorScheme cs) {
    return quill.DefaultStyles(
      paragraph: _buildBlockStyle(
        AppTextStyles.body16.copyWith(
          color: cs.onSurface,
          decoration: TextDecoration.none,
        ),
      ),
      placeHolder: _buildBlockStyle(
        AppTextStyles.body16.copyWith(
          color: cs.outlineVariant,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  quill.DefaultTextBlockStyle _buildBlockStyle(TextStyle style) {
    return quill.DefaultTextBlockStyle(
      style,
      const quill.HorizontalSpacing(12, 12),
      const quill.VerticalSpacing(12, 12),
      const quill.VerticalSpacing(0, 0),
      null,
    );
  }
}


