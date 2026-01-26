/// マイページ（Mypage）関連の定数を集約する。
class MyPageConstants {
  const MyPageConstants._();

  /// [MyPage/Withdraw] ドロップダウン矢印アイコンの幅。
  static const double arrowIconWidthSize = 40;

  /// [MyPage/Withdraw] ドロップダウン矢印アイコンの高さ。
  static const double arrowIconHeightSize = 40;

  /// [MyPage/WithdrawCompleted] 完了画面へ遷移するまでの遅延（ms）。
  static const int completedDelayMs = 3000;

  /// [MyPage/WithdrawCompleted] 完了画面のアニメーション時間（ms）。
  static const int completedAnimMs = 300;

  /// [MyPage/WithdrawCompleted] 完了画面の開始スケール。
  static const double completedBeginScale = 0.98;

  /// [MyPage/Withdraw] 退会前の説明文。
  static const String description =
      'いつもご利用いただきありがとうございます。\n'
      '退会手続きを行うと、アカウントにログインできなくなり、元に戻すことはできません。\n'
      'お手数ですが、以下の注意事項をご確認のうえ、お手続きをお願いします。';

  /// [MyPage/Withdraw] 注意事項（InfoBox）に表示する文言。
  static const String infoBoxText =
      '・退会すると、このアカウントでは再ログインできなくなります。\n'
      '・投稿・コメントなどの一部情報は、相手側の画面に残る場合があります。（表示名は「退会ユーザー」になります）\n';

  /// [MyPage/WithdrawCompleted] 完了メッセージ本文。
  static const String completedContext =
      '退会が完了しました。\n今までLinkyをご利用いただきまして、誠にありがとうございました。';

  /// [MyPage/ProfileEdit] 入力ルールのタイトル。
  static const String editProfileInputRuleTitle = '入力ルール';

  /// [MyPage/ProfileEdit] 入力ルール本文。
  static const String editProfileInputRuleBody = '''
・ニックネームは半角・全角を問わず、2〜12文字で入力してください。
・パスワードは8文字以上で入力してください。
・パスワードは英大・数字を含めてください。
・特殊文字を含めるとより安全です。
''';
}


