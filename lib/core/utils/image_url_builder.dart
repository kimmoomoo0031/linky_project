/// 画像配信（CDN/画像サーバ）向けのURL組み立てユーティリティ。
///
/// 想定: S3には原本を保存し、CDN側で `w/h/fit` パラメータに応じて
/// リサイズ/クロップした画像を生成してキャッシュする。
class ImageUrlBuilder {
  ImageUrlBuilder._();

  /// `sizePx` に応じてキャッシュ効率の良い “バケット” に丸める。
  ///
  /// 実務では「任意px」だとURLが無限に増えてキャッシュ効率が落ちるため、
  /// だいたい 64/128/256/512... のような固定プリセットに寄せることが多い。
  static int bucketSquareSizePx(int sizePx) {
    const buckets = <int>[64, 96, 128, 192, 256, 384, 512, 768, 1024];
    for (final b in buckets) {
      if (sizePx <= b) return b;
    }
    return buckets.last;
  }

  /// 原本URLに「正方形サムネイル」用のクエリを付与する。
  ///
  /// 例: `...?w=256&h=256&fit=crop`
  ///
  /// NOTE: 実際のパラメータ名はバックエンド/CDN実装に合わせて調整する。
  static String withSquareCropParams(
    String originalUrl, {
    required int sizePx,
  }) {
    final uri = Uri.parse(originalUrl);
    final merged = Map<String, String>.from(uri.queryParameters);

    // 代表的なクエリ仕様（要: サーバ側と合意）
    merged['w'] = '$sizePx';
    merged['h'] = '$sizePx';
    merged['fit'] = 'crop';

    return uri.replace(queryParameters: merged).toString();
  }
}


