import 'package:flutter/material.dart';

/// 仮のログイン画面。
///
/// 後で本格的な UI を実装するまでは、スプラッシュからの遷移先として
/// このシンプルな画面を使う。
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Login Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


