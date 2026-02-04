import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/policy_webview_page.dart';

/// 利用規約画面（WebView 版）。
///
/// この画面自体は `pop(true/false)` で結果を返す。
/// （「同意後にどこへ進むか」は呼び出し元で制御する）
class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PolicyWebViewPage(
      title: '利用規約',
      source: PolicyWebViewAsset(assetPath: AppAssets.termsOfServiceJaHtml),
      footerHintText:
          '上記の利用規約をよくお読みいただき、内容に同意いただける場合は「同意する」を押してください。',
    );
  }
}
