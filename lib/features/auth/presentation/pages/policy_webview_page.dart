import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/core/theme/app_typography.dart';
import 'package:linky_project_0318/features/auth/presentation/widgets/auth_action_button.dart';
import 'package:linky_project_0318/core/enums/auth_action_button_style.dart';

/// 規約/ポリシー共通の WebView ページ。
///
/// - ローカル HTML(asset) または URL を WebView で表示する
/// - WebView 内から `ScrollChannel.postMessage('bottom')` が呼ばれたら、
///   「同意する」ボタンを有効化する
/// - `onAgreed`/`onDisagreed` を渡さない場合は、デフォルトで `pop(true/false)` する
class PolicyWebViewPage extends StatefulWidget {
  const PolicyWebViewPage({
    super.key,
    required this.title,
    required this.source,
    required this.footerHintText,
    this.onAgreed,
    this.onDisagreed,
  });

  final String title;
  final PolicyWebViewSource source;
  final String footerHintText;
  final VoidCallback? onAgreed;
  final VoidCallback? onDisagreed;

  @override
  State<PolicyWebViewPage> createState() => _PolicyWebViewPageState();
}

class _PolicyWebViewPageState extends State<PolicyWebViewPage> {
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
            setState(() => _hasReachedBottom = true);
          }
        },
      );

    switch (widget.source) {
      case PolicyWebViewAsset(assetPath: final assetPath):
        _webViewController.loadFlutterAsset(assetPath);
      case PolicyWebViewUrl(url: final url):
        _webViewController.loadRequest(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final canAgree = _hasReachedBottom;

    return Scaffold(
      appBar: LinkyAppBar(
        title: widget.title,
        showBackButton: true,
      ),
      body: SafeArea(
        child: _PolicyBody(
          webViewController: _webViewController,
          canAgree: canAgree,
          onPressedAgree: canAgree
              ? () {
                  final onAgreed = widget.onAgreed;
                  if (onAgreed != null) {
                    onAgreed();
                    return;
                  }
                  context.pop(true);
                }
              : null,
          onPressedDisagree: () {
            final onDisagreed = widget.onDisagreed;
            if (onDisagreed != null) {
              onDisagreed();
              return;
            }
            context.pop(false);
          },
          footerHintText: widget.footerHintText,
        ),
      ),
    );
  }
}

class _PolicyBody extends StatelessWidget {
  const _PolicyBody({
    required this.webViewController,
    required this.canAgree,
    required this.onPressedAgree,
    required this.onPressedDisagree,
    required this.footerHintText,
  });

  final WebViewController webViewController;
  final bool canAgree;
  final VoidCallback? onPressedAgree;
  final VoidCallback onPressedDisagree;
  final String footerHintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        children: [
          Expanded(
            child: _PolicyWebViewSection(controller: webViewController),
          ),
          const SizedBox(height: 24),
          _AgreeButtonSection(
            canAgree: canAgree,
            onPressed: onPressedAgree,
          ),
          const SizedBox(height: 24),
          _DisagreeButtonSection(onPressed: onPressedDisagree),
          const SizedBox(height: 8),
          _FooterHintText(text: footerHintText),
        ],
      ),
    );
  }
}

class _PolicyWebViewSection extends StatelessWidget {
  const _PolicyWebViewSection({required this.controller});

  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(color: cs.surface),
      child: WebViewWidget(controller: controller),
    );
  }
}

class _AgreeButtonSection extends StatelessWidget {
  const _AgreeButtonSection({
    required this.canAgree,
    required this.onPressed,
  });

  final bool canAgree;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return AuthActionButton(
      label: '同意する',
      onPressed: canAgree ? onPressed : null,
      backgroundColor: cs.primary,
      textColor: cs.onPrimary,
      style: AuthActionButtonStyle.filled,
    );
  }
}

class _DisagreeButtonSection extends StatelessWidget {
  const _DisagreeButtonSection({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return AuthActionButton(
      label: '同意しない',
      onPressed: onPressed,
      backgroundColor: cs.surface,
      textColor: cs.onSurfaceVariant,
      borderColor: cs.outlineVariant,
      style: AuthActionButtonStyle.outlined,
    );
  }
}

class _FooterHintText extends StatelessWidget {
  const _FooterHintText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Text(
      text,
      style: AppTextStyles.body12.copyWith(
        color: cs.onSurfaceVariant,
      ),
      textAlign: TextAlign.center,
    );
  }
}

sealed class PolicyWebViewSource {
  const PolicyWebViewSource();
}

class PolicyWebViewAsset extends PolicyWebViewSource {
  const PolicyWebViewAsset({required this.assetPath});
  final String assetPath;
}

class PolicyWebViewUrl extends PolicyWebViewSource {
  const PolicyWebViewUrl({required this.url});
  final Uri url;
}

