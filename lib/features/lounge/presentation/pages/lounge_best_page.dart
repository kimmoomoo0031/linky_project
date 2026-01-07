import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';

/// ベストタブ（未実装の殻）。
class LoungeBestPage extends StatelessWidget {
  const LoungeBestPage({super.key, required this.loungeId});

  final int loungeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LinkyAppBar(
        title: 'ベスト投稿',
        showBackButton: true,
        onBackPressed: () {
          context.go('/lounge/$loungeId?tab=home');
        },
      ),
      body: const Center(child: Text('準備中です。')),
    );
  }
}


