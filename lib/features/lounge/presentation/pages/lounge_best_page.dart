import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/enums/lounge_tab.dart';
import 'package:linky_project_0318/core/router/router_extensions.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/features/lounge/presentation/providers/lounge_info_providers.dart';

/// ベストタブ（未実装の殻）。
class LoungeBestPage extends ConsumerWidget {
  const LoungeBestPage({super.key, required this.loungeId});

  final int loungeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loungeTitle =
        ref.watch(loungeInfoControllerProvider(loungeId)).valueOrNull?.title;

    return Scaffold(
      appBar: LinkyAppBar(
        title: 'ベスト投稿',
        showBackButton: true,
        onBackPressed: () {
          context.goLounge(
            loungeId,
            tab: LoungeTab.home,
            loungeTitle: loungeTitle,
          );
        },
      ),
      body: const Center(child: Text('準備中です。')),
    );
  }
}


