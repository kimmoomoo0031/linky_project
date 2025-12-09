class RegexPatterns {
  ///メールアドレス(@, .を含めて入力する)
  static final email = RegExp(r'^[^@]+@[^@]+\.[^@]+');

  ///パスワード(英大・数字を含め、特殊文字を含める)
  static final password = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z0-9!@]{8,}$'
  );

  ///ニックネーム(半角・全角を問わず、2〜12文字)
  static final nickName = RegExp(
    r'^[A-Za-z0-9\uFF10-\uFF19\uFF21-\uFF3A\uFF41-\uFF5A\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFF]{2,12}$'
  );
}