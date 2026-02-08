/// 退会理由（UI 選択肢）。
enum WithdrawReason {
  /// サービスが期待と違った。
  notUseful,

  /// 他のサービスを使うため。
  foundAlternative,

  /// 通知が多すぎる。
  tooManyNotifications,

  /// プライバシーが心配。
  privacyConcern,

  /// 利用頻度が低い。
  rarelyUse,

  /// その他。
  other,
}

extension WithdrawReasonX on WithdrawReason {
  /// 表示ラベル。
  String label() {
    switch (this) {
      case WithdrawReason.notUseful:
        return 'サービスが期待と違った';
      case WithdrawReason.foundAlternative:
        return '他のサービスを使うため';
      case WithdrawReason.tooManyNotifications:
        return '通知が多すぎる';
      case WithdrawReason.privacyConcern:
        return 'プライバシーが心配';
      case WithdrawReason.rarelyUse:
        return '利用頻度が低い';
      case WithdrawReason.other:
        return 'その他';
    }
  }
}


