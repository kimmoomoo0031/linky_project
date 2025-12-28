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


