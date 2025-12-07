import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
      ..loadFlutterAsset('assets/html/terms_of_service_ja.html');
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primaryWhite,
                  ),
                  child: WebViewWidget(
                    controller: _webViewController,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              AuthActionButton(
                label: '同意する',
                onPressed: canAgree
                    ? () {
                        context.push('/signUp');
                      }
                    : null,
                backgroundColor: AppColors.primaryActionBlue,
                textColor: AppColors.primaryWhite,
                style: AuthActionButtonStyle.filled,
              ),
              const SizedBox(height: 24),
              AuthActionButton(
                label: '同意しない',
                onPressed: () {
                  context.pop(false);
                },
                backgroundColor: AppColors.primaryWhite,
                textColor: AppColors.primaryGray,
                borderColor: AppColors.outlineGray,
                style: AuthActionButtonStyle.outlined,
              ),
              const SizedBox(height: 8),
              Text(
                '上記の利用規約をよくお読みいただき、内容に同意いただける場合は「同意する」を押してください。',
                style: AppTextStyles.body12.copyWith(
                  color: AppColors.primaryGray,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

