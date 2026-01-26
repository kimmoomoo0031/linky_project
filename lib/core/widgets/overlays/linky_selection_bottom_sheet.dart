import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/display/divider.dart';
import 'package:linky_project_0318/core/widgets/controls/app_buttons.dart';

/// 選択式ボトムシートの項目モデル。
class LinkySelectionItem<T> {
  const LinkySelectionItem({
    required this.value,
    required this.label,
  });

  final T value;
  final String label;
}

/// 選択式ボトムシートを表示する共通関数。
Future<T?> showLinkySelectionBottomSheet<T>({
  required BuildContext context,
  required String title,
  required List<LinkySelectionItem<T>> items,
  required T selectedValue,
  String applyText = '適用',
}) {
  final cs = Theme.of(context).colorScheme;
  T temp = selectedValue;

  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: cs.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          Widget buildOption(LinkySelectionItem<T> item) {
            final selected = temp == item.value;
            return Theme(
              data: Theme.of(context).copyWith(
                splashFactory: NoSplash.splashFactory,
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  item.label,
                  style: AppTextStyles.body14.copyWith(
                    color: selected ? cs.primary : cs.onSurface,
                  ),
                ),
                trailing: selected
                    ? Icon(Icons.check, color: cs.primary, size: 25)
                    : null,
                onTap: () => setState(() => temp = item.value),
              ),
            );
          }

          return SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _LinkySelectionHeader(title: title),
                _LinkySelectionBody(
                  items: items,
                  applyText: applyText,
                  buildOption: buildOption,
                  onApply: () => Navigator.of(context).pop(temp),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

/// 選択ボトムシートのヘッダー（タイトル + 区切り線）。
class _LinkySelectionHeader extends StatelessWidget {
  const _LinkySelectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Text(
            title,
            style: AppTextStyles.body18.copyWith(color: cs.onSurface),
          ),
        ),
        const LinkyDivider(),
      ],
    );
  }
}

/// 選択ボトムシートの本文（選択肢リスト + 適用ボタン）。
class _LinkySelectionBody<T> extends StatelessWidget {
  const _LinkySelectionBody({
    required this.items,
    required this.applyText,
    required this.buildOption,
    required this.onApply,
  });

  final List<LinkySelectionItem<T>> items;
  final String applyText;
  final Widget Function(LinkySelectionItem<T> item) buildOption;
  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          ...items.map(buildOption),
          const SizedBox(height: 8),
          ConfirmButton (
            text: applyText,
            onPressed: onApply,
          ),
        ],
      ),
    );
  }
}


