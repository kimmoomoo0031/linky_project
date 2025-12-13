import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:linky_project_0318/core/constants/app_assets.dart';
import 'package:linky_project_0318/core/theme/app_colors.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/core/widgets/linky_app_bar.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';

/// 利用規約画面（WebView 版）。
///
/// - 上部に共通ヘッダー
/// - 中央に WebView（ローカル HTML 資産を表示）
/// - 最下部に「同意する / 同意しない」ボタン
///
/// WebView 内の JavaScript から ScrollChannel.postMessage('bottom') が呼ばれたら、
/// 「同意する」ボタンを有効化する。
class TermsOfServicePage extends StatefulWidget {
  const TermsOfServicePage({super.key});

  @override
  State<TermsOfServicePage> createState() => _TermsOfServicePageState();
}

class _TermsOfServicePageState extends State<TermsOfServicePage> {
  late final WebViewController _webViewController;
  bool _hasReachedBottom = false;

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'ScrollChannel',
        onMessageReceived: (JavaScriptMessage message) {
          if (message.message == 'bottom' && !_hasReachedBottom) {
            setState(() {
              _hasReachedBottom = true;
            });
          }
        },
      )
      ..loadFlutterAsset(AppAssets.termsOfServiceJaHtml);
  }

  @override
  Widget build(BuildContext context) {
    final bool canAgree = _hasReachedBottom;

    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: const LinkyAppBar(
        title: '利用規約',
        showBackButton: true,
      ),
      body: SafeArea(
        child: _TermsBody(
          webViewController: _webViewController,
          canAgree: canAgree,
          onPressedAgree: canAgree ? () => context.push('/signUp') : null,
          onPressedDisagree: () => context.pop(false),
        ),
      ),
    );
  }
}

/// 利用規約画面の本文領域（WebView + ボタン類）をまとめるクラス。
class _TermsBody extends StatelessWidget {
  const _TermsBody({
    required this.webViewController,
    required this.canAgree,
    required this.onPressedAgree,
    required this.onPressedDisagree,
  });

  final WebViewController webViewController;
  final bool canAgree;
  final VoidCallback? onPressedAgree;
  final VoidCallback onPressedDisagree;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        children: [
          Expanded(
            child: _TermsWebViewSection(controller: webViewController),
          ),
          const SizedBox(height: 24),
          _AgreeButtonSection(
            canAgree: canAgree,
            onPressed: onPressedAgree,
          ),
          const SizedBox(height: 24),
          _DisagreeButtonSection(onPressed: onPressedDisagree),
          const SizedBox(height: 8),
          const _TermsFooterHintText(),
        ],
      ),
    );
  }
}

/// 利用規約のWebView（ローカルHTML）を表示するセクション用クラス。
class _TermsWebViewSection extends StatelessWidget {
  const _TermsWebViewSection({required this.controller});

  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryWhite,
      ),
      child: WebViewWidget(controller: controller),
    );
  }
}

/// 「同意する」ボタンを表示するクラス。
///
/// [canAgree] が false の場合は無効化（押せない）する。
class _AgreeButtonSection extends StatelessWidget {
  const _AgreeButtonSection({
    required this.canAgree,
    required this.onPressed,
  });

  final bool canAgree;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AuthActionButton(
      label: '同意する',
      onPressed: canAgree ? onPressed : null,
      backgroundColor: AppColors.primaryActionBlue,
      textColor: AppColors.primaryWhite,
      style: AuthActionButtonStyle.filled,
    );
  }
}

/// 「同意しない」ボタンを表示するクラス。
class _DisagreeButtonSection extends StatelessWidget {
  const _DisagreeButtonSection({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AuthActionButton(
      label: '同意しない',
      onPressed: onPressed,
      backgroundColor: AppColors.primaryWhite,
      textColor: AppColors.primaryGray,
      borderColor: AppColors.outlineGray,
      style: AuthActionButtonStyle.outlined,
    );
  }
}

/// 画面下部の注意書きを表示するクラス。
class _TermsFooterHintText extends StatelessWidget {
  const _TermsFooterHintText();

  @override
  Widget build(BuildContext context) {
    return Text(
      '上記の利用規約をよくお読みいただき、内容に同意いただける場合は「同意する」を押してください。',
      style: AppTextStyles.body12.copyWith(
        color: AppColors.primaryGray,
      ),
      textAlign: TextAlign.center,
    );
  }
}

