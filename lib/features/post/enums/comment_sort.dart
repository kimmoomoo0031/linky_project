/// コメントの並び順。
enum CommentSort {
  /// 作成日時の昇順。
  createdAtAsc,

  /// 作成日時の降順。
  createdAtDesc,
}

extension CommentSortX on CommentSort {
  /// API のクエリ値。
  String get queryValue => switch (this) {
        CommentSort.createdAtAsc => 'created_at_asc',
        CommentSort.createdAtDesc => 'created_at_desc',
      };
}


