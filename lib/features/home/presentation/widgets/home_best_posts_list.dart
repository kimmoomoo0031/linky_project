import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/features/home/domain/entities/best_post.dart';

class HomeBestPostsList extends StatelessWidget {
  const HomeBestPostsList({super.key, required this.items});

  final List<BestPost> items;

  @override
  Widget build(BuildContext context) {
    final list = items;
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: cs.surface,
        border: Border.all(color: cs.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: List.generate(list.length, (i) {
          final item = list[i];
          final title = item.title;
          final date = item.dateLabel;
          final rank = i + 1;
          final isTop3 = rank <= 3;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Text(
                    '$rank.',
                    style: AppTextStyles.body12.copyWith(
                      // 1〜3位は赤文字にする
                      color: isTop3 ? AppColors.emphasisRed : cs.onSurfaceVariant,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.body12.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ),
                Text(
                  date,
                  style: AppTextStyles.body12.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}



