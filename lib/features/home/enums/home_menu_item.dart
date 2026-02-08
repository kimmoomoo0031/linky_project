/// Home のメニュー項目。
enum HomeMenuItem {
  /// 自分の投稿。
  myPosts,

  /// プロフィール編集。
  profileEdit,

  /// ラウンジ作成。
  createLounge,
}

extension HomeMenuItemX on HomeMenuItem {
  /// 表示タイトル。
  String title() {
    switch (this) {
      case HomeMenuItem.myPosts:
        return '自分の投稿';
      case HomeMenuItem.profileEdit:
        return 'プロフィール編集';
      case HomeMenuItem.createLounge:
        return 'ラウンジ作成';
    }
  }
}


