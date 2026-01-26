import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

typedef OnQuillContentChanged = void Function({
  required String plainText,
  required String deltaJson,
});

/// QuillController の変更をアプリ状態へ反映するためのバインダー。
///
/// - タイトル: plain text の改行を除去して通知
/// - 本文: plain text + delta json を通知
class LoungePostQuillBinder {
  LoungePostQuillBinder({
    required this.titleController,
    required this.contentController,
    required this.onTitleChanged,
    required this.onContentChanged,
  });

  final quill.QuillController titleController;
  final quill.QuillController contentController;

  final ValueChanged<String> onTitleChanged;
  final OnQuillContentChanged onContentChanged;

  VoidCallback? _titleListener;
  VoidCallback? _contentListener;

  void bind() {
    if (_titleListener != null || _contentListener != null) return;

    _titleListener = () {
      final plainText = titleController.document.toPlainText();
      final normalized = plainText.replaceAll('\n', '').trimRight();
      onTitleChanged(normalized);
    };

    _contentListener = () {
      final plainText = contentController.document.toPlainText();
      final deltaJson = jsonEncode(contentController.document.toDelta().toJson());
      onContentChanged(plainText: plainText, deltaJson: deltaJson);
    };

    titleController.addListener(_titleListener!);
    contentController.addListener(_contentListener!);
  }

  void unbind() {
    if (_titleListener != null) {
      titleController.removeListener(_titleListener!);
      _titleListener = null;
    }
    if (_contentListener != null) {
      contentController.removeListener(_contentListener!);
      _contentListener = null;
    }
  }
}


