import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

/// ラウンジ投稿本文に画像を挿入し、必ず「画像の下」にカーソルを移動する。
void insertImagesIntoQuill({
  required quill.QuillController controller,
  required List<String> imagePaths,
  TextSelection? initialSelection,
}) {
  if (imagePaths.isEmpty) return;

  final sel = initialSelection ?? controller.selection;

  final docEnd = (controller.document.length - 1).clamp(0, 1 << 30);
  final isSelectionInvalid = sel.baseOffset < 0 || sel.extentOffset < 0;

  var index = isSelectionInvalid ? docEnd : sel.start;
  var len = 0;

  if (!isSelectionInvalid) {
    final start = sel.start;
    final end = sel.end;
    index = start < end ? start : end;
    len = (start - end).abs();
  }

  for (var i = 0; i < imagePaths.length; i++) {
    final path = imagePaths[i];
    final replaceLen = i == 0 ? len : 0;

    if (i == 0) {
      controller.replaceText(
        index,
        replaceLen,
        '\n',
        TextSelection.collapsed(offset: index + 1),
      );
      index += 1;
    }

    controller.replaceText(
      index,
      0,
      quill.BlockEmbed.image(path),
      TextSelection.collapsed(offset: index + 1),
    );

    controller.replaceText(
      index + 1,
      0,
      '\n',
      TextSelection.collapsed(offset: index + 2),
    );

    index += 2; // embed(1) + '\n'(1)
  }
}


