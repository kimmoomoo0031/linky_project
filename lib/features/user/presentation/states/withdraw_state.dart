import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linky_project_0318/core/enums/withdraw_reason.dart';

part 'withdraw_state.freezed.dart';

@freezed
class WithdrawState with _$WithdrawState {
  const factory WithdrawState({
    @Default('') String currentPassword,
    WithdrawReason? reason,
    @Default(false) bool isSubmitting,
    String? currentPasswordError,
    String? reasonError,
  }) = _WithdrawState;
}

extension WithdrawStateX on WithdrawState {
  bool get canSubmit =>
      !isSubmitting && currentPassword.trim().isNotEmpty && reason != null;
}


