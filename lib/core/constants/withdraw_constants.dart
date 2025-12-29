/// 退会（アカウント削除）関連の文言・設定値を集約する。
class WithdrawConstants {
  const WithdrawConstants._();

  static const String description =
      'いつもご利用いただきありがとうございます。\n'
      '退会手続きを行うと、アカウントにログインできなくなり、元に戻すことはできません。\n'
      'お手数ですが、以下の注意事項をご確認のうえ、お手続きをお願いします。';

  static const String infoBoxText =
      '・退会すると、このアカウントでは再ログインできなくなります。\n'
      '・投稿・コメントなどの一部情報は、相手側の画面に残る場合があります。（表示名は「退会ユーザー」になります）\n';

  // ---- iconSize ----
  static const double arrowIconWidthSize = 50;
  static const double arrowIconHeightSize = 50;

  // ---- WithdrawCompletedPage ----
  static const int completedDelayMs = 3000;
  static const int completedAnimMs = 300;
  static const double completedBeginScale = 0.98;
  static const String completedContext = '退会が完了しました。\n今までLinkyをご利用いただきまして、誠にありがとうございました。';
}


