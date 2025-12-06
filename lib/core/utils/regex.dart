class RegexPatterns {
  ///メールアドレス(@, .を含めて入力する)
  static final email = RegExp(r'^[^@]+@[^@]+\.[^@]+');

  ///パスワード(英大・数字を含め、特殊文字を含める)
  static final password = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z0-9!@]{8,}$'
  );

}