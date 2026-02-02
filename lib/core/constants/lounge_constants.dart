/// ラウンジ（Lounge）関連の定数を集約する。
class LoungeConstants {
  const LoungeConstants._();

  /// [Lounge/Theme] ボトムナビ（NavigationBar）の高さ（px）。
  static const double navigationBarHeight = 60;

  /// [Lounge/Create] ラウンジ名の最小文字数。
  static const int nameMinLength = 2;

  /// [Lounge/Create] ラウンジ名の最大文字数。
  static const int nameMaxLength = 12;

  /// [Lounge/Create] ラウンジ紹介の最小文字数。
  static const int descriptionMinLength = 5;

  /// [Lounge/Create] ラウンジ紹介の最大文字数。
  static const int descriptionMaxLength = 50;

  /// [Lounge/Create] カバー画像の最大アップロード容量（MB）。
  static const int maxUploadMb = 5;

  /// [Lounge/Create] カバー画像の最大アップロード容量（bytes）。
  static const int maxUploadBytes = maxUploadMb * 1024 * 1024;

  /// [Lounge/PostCreate] 投稿タイトルの最大文字数。
  static const int postTitleMaxLength = 100;

  /// [Lounge/PostCreate] 投稿本文の最大文字数。
  static const int postContentMaxLength = 65500;

  /// [Lounge/PostCreate] 投稿画像の最大アップロード容量（MB）。
  static const int postImageMaxUploadMb = 5;

  /// [Lounge/PostCreate] 投稿画像の最大アップロード容量（bytes）。
  static const int postImageMaxUploadBytes = postImageMaxUploadMb * 1024 * 1024;

  /// [Lounge/PostCreate] 投稿画像の最大許容辺長（px）。
  static const int postImageMaxSidePx = 2048;

  /// [Lounge/Create] カバー画像の最小推奨サイズ（短辺px、未満なら弾く）。
  static const int coverImageMinRecommendedSidePx = 256;

  /// [Lounge/Create] カバー画像サムネ（正方形）を生成するサイズ（px）。
  static const int coverThumbnailSizePx = 256;

  /// [Lounge/Create] カバー画像プレビューの表示サイズ（dp）。
  static const double coverImageSize = 90;

  /// [Post/List] 「人気（★）」として扱う最小いいね数。
  static const int popularStarMinLikeCount = 20;

  /// [Lounge/Create] ラウンジ名入力欄の hintText 例文。
  static const String loungeNameExample = '日本生活';

  /// [Lounge/Create] ラウンジ紹介入力欄の hintText 例文。
  static const String loungeDescriptionExample = '日本での生活を共有できる場所です';

  /// [Lounge/Create] ラウンジ名の入力ルール表示文言。
  static const String nameRuleText =
      '英字・日本語・「-」のみ、（$nameMinLength〜$nameMaxLength文字）';

  /// [Lounge/Create] ラウンジ紹介の入力ルール表示文言。
  static const String descriptionRuleText =
      '英字・日本語・「-」のみ、（$descriptionMinLength〜$descriptionMaxLength文字）';

  /// [Lounge/Create] 画面上部に表示する説明文。
  static const String makeLoungeDescription = '''
・カバー画像は1枚のみ登録できます。
・登録した画像は、ラウンジアイコンとして表示されます。
・同じ名前のラウンジは作成できません。
''';
}

