import 'package:flutter/material.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/features/auth/presentation/pages/policy_webview_page.dart';

/// プライバシーポリシー (WebView).
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PolicyWebViewPage(
      title: 'プライバシーポリシー',
      source: PolicyWebViewAsset(assetPath: AppAssets.privacyPolicyTestKoHtml),
      footerHintText: '上記のプライバシーポリシーをよくお読みいただき、内容に同意いただける場合は「同意する」を押してください。',
    );
  }
}

