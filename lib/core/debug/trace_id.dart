import 'dart:math';

/// アプリ/サーバーのログを紐付けるためのリクエスト単位の識別子。
///
/// - 現段階（=API 未連携）では簡易実装で十分
/// - 後で UUID/ULID に差し替えても呼び出し側を変えずに済むようにするのが目的
class TraceId {
  TraceId._(this.value);

  final String value;

  static TraceId newId() {
    final r = Random.secure();
    final hex = List.generate(24, (_) => r.nextInt(16).toRadixString(16)).join();
    return TraceId._(hex);
  }

  /// 人が読みやすい短縮表示用。
  String short() => value.length <= 8 ? value : value.substring(0, 8);

  @override
  String toString() => value;
}


