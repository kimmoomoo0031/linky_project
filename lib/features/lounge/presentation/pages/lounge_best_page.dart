import 'package:flutter/material.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';

/// ベストタブ（未実装の殻）。
class LoungeBestPage extends StatelessWidget {
  const LoungeBestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LinkyAppBar(
        title: 'ベスト投稿',
        // タブ画面なので戻るボタンは表示しない
        showBackButton: false,
      ),
      body: const Center(child: Text('準備中です。')),
    );
  }
}


