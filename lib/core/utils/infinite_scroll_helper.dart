import 'package:flutter/cupertino.dart';

/// 無限スクロール（ページング）でよく使う「底付近判定」などの共通ヘルパー。
///
/// UI の中に `pos.pixels >= pos.maxScrollExtent - 200` のような
/// マジックナンバーが散らばるのを避けるために用意する。
class InfiniteScrollHelper {
  const InfiniteScrollHelper._();

  /// スクロール可能な状態かどうか。
  static bool hasScrollableExtent(ScrollPosition pos) {
    return pos.maxScrollExtent > 0;
  }

  /// 末尾付近（例: 200px 手前）かどうか。
  static bool isNearBottom(
    ScrollPosition pos, {
    double thresholdPx = 200,
  }) {
    if (!hasScrollableExtent(pos)) return false;
    return pos.pixels >= pos.maxScrollExtent - thresholdPx;
  }

  /// 「最後のページ」スナックバーを再表示できるようにリセットするタイミングかどうか。
  ///
  /// - [snackShown] が true のときのみ判定する
  /// - `showThresholdPx`（表示条件）から `resetExtraPx` だけ離れたらリセット
  static bool shouldResetNoMoreSnack({
    required ScrollPosition pos,
    required bool snackShown,
    double showThresholdPx = 200,
    double resetExtraPx = 100,
  }) {
    if (!snackShown) return false;
    if (!hasScrollableExtent(pos)) return false;
    final resetLine = pos.maxScrollExtent - (showThresholdPx + resetExtraPx);
    return pos.pixels < resetLine;
  }
}


