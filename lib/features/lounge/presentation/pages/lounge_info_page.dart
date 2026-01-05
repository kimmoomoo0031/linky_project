import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';

/// ラウンジ情報ページ（未実装の殻）。
///
/// - ラウンジ作成時に入力した「カバー画像/ラウンジ名/紹介」を表示する想定
class LoungeInfoPage extends StatelessWidget {
  const LoungeInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LinkyAppBar(
        title: 'ラウンジ情報',
        // タブ画面なので戻るボタンは表示しない
        showBackButton: false,
      ),
      body: const Center(child: Text('準備中です。')),
    );
  }
}


