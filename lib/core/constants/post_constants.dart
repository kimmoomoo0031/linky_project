/// 投稿（Post）まわりのデザイン/仕様上の定数。
///
/// - UIの表示条件など、ビジネスロジックではなく「見せ方」に寄った値を集約する。
class PostConstants {
  const PostConstants._();

  /// いいね数がこの値以上なら「人気（★表示）」として扱う。
  static const int popularStarThreshold = 20;
}


