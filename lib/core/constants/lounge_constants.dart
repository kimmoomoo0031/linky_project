/// ラウンジ（Lounge）関連の定数を集約する。
class LoungeConstants {
  const LoungeConstants._();

  /// [ラウンジ作成] ラウンジ名の最小文字数。
  static const int nameMinLength = 2;

  /// [ラウンジ作成] ラウンジ名の最大文字数。
  static const int nameMaxLength = 12;

  /// [ラウンジ作成] ラウンジ紹介の最小文字数。
  static const int descriptionMinLength = 5;

  /// [ラウンジ作成] ラウンジ紹介の最大文字数。
  static const int descriptionMaxLength = 50;

  /// [ラウンジ作成] カバー画像の最大アップロード容量（MB）。
  static const int maxUploadMb = 5;

  /// [ラウンジ作成] カバー画像の最大アップロード容量（bytes）。
  static const int maxUploadBytes = maxUploadMb * 1024 * 1024;

  /// [ラウンジ作成] カバー画像の最小推奨サイズ（短辺px、未満なら弾く）。
  static const int coverImageMinRecommendedSidePx = 256;

  /// [ラウンジ作成] カバー画像サムネ（正方形）を生成するサイズ（px）。
  static const int coverThumbnailSizePx = 256;

  /// [ラウンジ作成] カバー画像プレビューの表示サイズ（dp）。
  static const double coverImageSize = 90;

  /// [投稿] 「人気（★）」として扱う最小いいね数。
  static const int popularStarMinLikeCount = 20;

  /// [ラウンジ作成] ラウンジ名入力欄の hintText 例文。
  static const String loungeNameExample = '日本生活';

  /// [ラウンジ作成] ラウンジ紹介入力欄の hintText 例文。
  static const String loungeDescriptionExample = '日本での生活を共有できる場所です';

  /// [ラウンジ作成] ラウンジ名の入力ルール表示文言。
  static const String nameRuleText =
      '英字・日本語・「-」のみ、（$nameMinLength〜$nameMaxLength文字）';

  /// [ラウンジ作成] ラウンジ紹介の入力ルール表示文言。
  static const String descriptionRuleText =
      '英字・日本語・「-」のみ、（$descriptionMinLength〜$descriptionMaxLength文字）';
}

