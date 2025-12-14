/// アプリ全体で共通に使うダイアログ文言。
///
/// feature 固有の文言は `features/.../constants` に置く。
class CommonDialogMessages {
  const CommonDialogMessages._();

  static const String networkError =
      'ネットワークエラーが発生しました。\n通信状況を確認してから、もう一度お試しください。';

  static const String serverError =
      'サーバーエラーが発生しました。\nしばらく時間をおいて再度お試しください。';

  static const String unexpectedError =
      '予期せぬエラーが発生しました。\nしばらく時間をおいて再度お試しください。';
}


