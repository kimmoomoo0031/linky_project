/// ラウンジ画面内のタブ。
///
/// URL の `?tab=...` に対応させるため、query 変換もここで定義する。
enum LoungeTab {
  home,
  info,
  best,
}

extension LoungeTabX on LoungeTab {
  String toQuery() {
    switch (this) {
      case LoungeTab.home:
        return 'home';
      case LoungeTab.info:
        return 'info';
      case LoungeTab.best:
        return 'best';
    }
  }

  static LoungeTab fromQuery(String? raw) {
    switch (raw) {
      case 'info':
        return LoungeTab.info;
      case 'best':
        return LoungeTab.best;
      case 'home':
      default:
        return LoungeTab.home;
    }
  }
}


