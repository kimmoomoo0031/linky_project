/// 退会理由（UI選択肢）。
///
/// NOTE:
/// - 現時点はモック段階のため、UI表示に必要な文言のみを保持する。
/// - 文言は後から変更しやすいように、このファイルに集約する。
enum WithdrawReason {
  notUseful,
  foundAlternative,
  tooManyNotifications,
  privacyConcern,
  rarelyUse,
  other,
}

extension WithdrawReasonX on WithdrawReason {
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


