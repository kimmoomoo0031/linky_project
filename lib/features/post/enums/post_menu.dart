///投稿画面のメニュー
enum PostMenuAction {
  edit('修正'),
  delete('削除');

  const PostMenuAction(this.label);
  final String label;
}