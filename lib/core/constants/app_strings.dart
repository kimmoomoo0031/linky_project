/// アプリ内で表示する「文言」を集約するファイル。
///
/// # 使い分け（重要）
/// ✅ 定数（AppLabels/AppHints）に入れる
/// - 複数画面で繰り返し使われる（=検索・修正・統一がしたい）
/// - 仕様/デザイン変更で文言が変わりやすい（例: 入力フォーム周り）
/// - 1か所に集めておくことでレビュー/修正コストが下がる
///
/// ✅ 画面内にハードコードで残す（=オーバーエンジニアリング回避）
/// - その画面でしか使わない
/// - 文言の意味が明確で、他で重複する可能性が低い
/// - 変更可能性がほぼ無い（or 変わってもその画面だけ直せば十分）
///
/// 注意:
/// - このファイルは「入力フィールドのラベル/プレースホルダー」向けに使う。
/// - ボタン文言やタブ名などまで何でも入れ始めると肥大化するので、対象を絞る。

/// 入力フィールドのラベル（label）で再利用する文言。
class AppLabels {
  const AppLabels._();

  static const String email = 'メールアドレス';
  static const String password = 'パスワード';
  static const String passwordConfirm = 'パスワード再確認';
  static const String nickname = 'ニックネーム';
  static const String newPassword = '新しいパスワード';
  static const String newPasswordConfirm = '新しいパスワード再確認';
  static const String currentPassword = '現在のパスワード';
  static const String withdrawReason = '退会理由を教えてください';
  static const String loungeName = 'ラウンジ名';
  static const String loungeDescription = 'ラウンジ紹介';
}

/// 入力フィールドのプレースホルダー（hintText）で再利用する文言。
class AppHints {
  const AppHints._();

  static const String email = 'linky@example.com';
  static const String nickname = 'リンゴ';
  static const String loungeSearch = 'ラウンジ検索';
  static const String currentPassword = '現在のパスワードを入力してください';
  static const String loungeNameExample = '日本生活';
  static const String loungeDescriptionExample = '日本での生活を共有できる場所です';
}


