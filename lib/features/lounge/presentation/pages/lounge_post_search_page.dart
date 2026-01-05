import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';

/// ラウンジ内投稿検索ページ（未実装の殻）。
///
/// - 投稿タイトル/作成者などで検索できる想定
class LoungePostSearchPage extends StatelessWidget {
  const LoungePostSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LinkyAppBar(title: '投稿検索', showBackButton: true),
      body: Center(
        child: Text('準備中です。'),
      ),
    );
  }
}


