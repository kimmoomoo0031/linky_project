import 'package:flutter/material.dart';

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

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Text(
                    '${i + 1}.',
                    style: AppTextStyles.body12.copyWith(
                      color: cs.onSurfaceVariant,
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


