/// 追加取得の結果。
enum FetchMoreResult {
  /// 取得してリストが増えた。
  fetched,

  /// これ以上取得できない。
  noMore,

  /// 取得しなかった（実行中、または状態が不正）。
  skipped,
}


