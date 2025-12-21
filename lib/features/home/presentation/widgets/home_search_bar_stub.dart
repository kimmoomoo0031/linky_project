import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_typography.dart';

class HomeSearchBarStub extends StatelessWidget {
  const HomeSearchBarStub({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: cs.surface,
        border: Border.all(color: cs.outlineVariant),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Expanded(
              child: Text(
                'ラウンジ検索',
                style: AppTextStyles.body12.copyWith(
                  color: cs.outlineVariant,
                ),
              ),
            ),
            Icon(Icons.search, color: cs.outlineVariant),
          ],
        ),
      ),
    );
  }
}


