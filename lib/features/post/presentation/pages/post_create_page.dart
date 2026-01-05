import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';

/// 投稿作成（未実装の殻）。
class PostCreatePage extends StatelessWidget {
  const PostCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LinkyAppBar(title: '投稿作成', showBackButton: true),
      body: Center(
        child: Text('準備中です。'),
      ),
    );
  }
}


