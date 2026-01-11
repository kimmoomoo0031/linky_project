/// ラウンジ（Lounge）関連の定数を集約する。
///
/// - ラウンジ配下で使う “仕様の数値/文言/UIルール” を置く
/// - PostConstants も「ラウンジ画面で共通利用」前提でここにまとめる

/// ラウンジ作成画面の定数定義（数値・文言を1か所に集約）。
///
/// - UI文言とバリデーション条件の不一致を防ぐ
/// - “再利用のため”というより“事故防止”のために集約する
class LoungeCreateConstants {
  const LoungeCreateConstants._();

  // ---- テキスト入力ルール ----
  static const int nameMinLength = 2;
  static const int nameMaxLength = 12;
  static const int descriptionMinLength = 5;
  static const int descriptionMaxLength = 50;

  static const String nameRuleText =
      '英字・日本語・「-」のみ、（$nameMinLength〜$nameMaxLength文字）';
  static const String descriptionRuleText =
      '英字・日本語・「-」のみ、（$descriptionMinLength〜$descriptionMaxLength文字）';

  // ---- 画像ルール（フロント側の1次検証）----
  static const int maxUploadMb = 5;
  static const int maxUploadBytes = maxUploadMb * 1024 * 1024;

  /// 最小推奨（小さすぎるとアイコン表示時に荒れやすい）
  static const int minSidePx = 256;

  /// アイコン用サムネサイズ（正方形）
  static const int thumbSizePx = 256;

  // ---- UIレイアウト（ラウンジ作成画面）----
  static const double coverImageSize = 90;
}

/// 投稿（Post）まわりのデザイン/仕様上の定数。
///
/// - UIの表示条件など、ビジネスロジックではなく「見せ方」に寄った値を集約する。
class PostConstants {
  const PostConstants._();

  /// いいね数がこの値以上なら「人気（★表示）」として扱う。
  static const int popularStarThreshold = 20;
}


