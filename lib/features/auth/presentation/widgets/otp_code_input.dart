import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpCodeInput extends StatefulWidget {
  const OtpCodeInput({
    super.key,
    this.length = 4,
    this.onChanged,
    this.onCompleted,
    this.initialValue = '',
    this.hasError = false,
  });

  /// OTP の桁数
  final int length;

  /// 各桁の入力が変わった際に呼ばれるコールバック（index, value）
  final void Function(int index, String value)? onChanged;

  /// すべての桁が埋まったときに呼ばれるコールバック
  final VoidCallback? onCompleted;

  /// 初期値（自動入力・デバッグ用）
  final String initialValue;

  /// エラー状態（true のとき、全フィールドの枠線をエラー色で表示）
  final bool hasError;

  @override
  State<OtpCodeInput> createState() => OtpCodeInputState();
}

class OtpCodeInputState extends State<OtpCodeInput> {
  late final List<FocusNode> _focusNodes;
  late final List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();

    // 各フィールド用の FocusNode / Controller を生成
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
    _controllers = List.generate(widget.length, (_) => TextEditingController());

    // 初期値を適用
    _applyInitialValue();
  }

  /// 初期値を各入力フィールドに適用
  void _applyInitialValue() {
    if (widget.initialValue.isEmpty) return;

    final chars = widget.initialValue.split('');
    for (var i = 0; i < widget.length; i++) {
      if (i < chars.length) {
        _controllers[i].text = chars[i];
        widget.onChanged?.call(i, chars[i]);
      }
    }

    final lastFilled = chars.length - 1;
    if (lastFilled >= 0 && lastFilled < widget.length) {
      _focusNodes[lastFilled].requestFocus();
    }

    _notifyCompletedIfNeeded();
  }

  @override
  void dispose() {
    for (final f in _focusNodes) {
      f.dispose();
    }
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  /// すべての入力値をクリアし、先頭フィールドにフォーカスを戻す
  void clear() {
    for (var i = 0; i < _controllers.length; i++) {
      _controllers[i].clear();
      widget.onChanged?.call(i, '');
    }
    if (_focusNodes.isNotEmpty) {
      _focusNodes.first.requestFocus();
    }
  }

  /// 先頭フィールドにフォーカスを移動
  void focusFirst() {
    if (_focusNodes.isNotEmpty) {
      _focusNodes.first.requestFocus();
    }
  }

  /// 貼り付けられた文字列を各フィールドに分配
  void _handlePaste(String text) {
    final chars = text.replaceAll(RegExp(r'\D'), '').split('');

    for (var i = 0; i < widget.length; i++) {
      final v = i < chars.length ? chars[i] : '';
      _controllers[i].text = v;
      widget.onChanged?.call(i, v);
    }

    final last = chars.length.clamp(1, widget.length) - 1;
    if (last >= 0) {
      _focusNodes[last].requestFocus();
    } else if (_focusNodes.isNotEmpty) {
      _focusNodes.first.requestFocus();
    }

    _notifyCompletedIfNeeded();
  }

  void _notifyCompletedIfNeeded() {
    final isFilled = _controllers.every((c) => c.text.isNotEmpty);
    if (isFilled) {
      widget.onCompleted?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        final length = widget.length;
        final maxWidth = constraints.maxWidth;

        // 端末幅に応じた動的なサイズ調整
        const baseSize = 56.0; // 基準サイズ
        const minSize = 48.0; // 最小サイズ
        const maxSize = 64.0; // 最大サイズ
        const spacing = 16.0; // フィールド間の余白

        final totalSpacing = spacing * (length - 1);
        var fieldSize = (maxWidth - totalSpacing) / length;

        fieldSize = fieldSize.clamp(minSize, maxSize);

        if (fieldSize > baseSize &&
            maxWidth > (baseSize * length + totalSpacing)) {
          fieldSize = baseSize;
        }

        final children = <Widget>[];

        for (var index = 0; index < length; index++) {
          final enabledBorderColor =
              widget.hasError ? cs.error : cs.outlineVariant;
          final focusedBorderColor =
              widget.hasError ? cs.error : cs.primary;

          children.add(
            SizedBox(
              width: fieldSize,
              height: fieldSize,
              child: TextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                autofillHints: const [AutofillHints.oneTimeCode],
                maxLength: 1,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: enabledBorderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: focusedBorderColor,
                      width: 1,
                    ),
                  ),
                ),
                onChanged: (value) {
                  widget.onChanged?.call(index, value);

                  if (value.length > 1) {
                    _handlePaste(value);
                    return;
                  }

                  if (value.isNotEmpty && index < length - 1) {
                    _focusNodes[index + 1].requestFocus();
                  } else if (value.isEmpty && index > 0) {
                    _focusNodes[index - 1].requestFocus();
                  }

                  _notifyCompletedIfNeeded();
                },
              ),
            ),
          );

          if (index != length - 1) {
            children.add(const SizedBox(width: spacing));
          }
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        );
      },
    );
  }
}
