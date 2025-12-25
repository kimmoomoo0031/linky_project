import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_edit_state.freezed.dart';

@freezed
class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState({
    @Default(true) bool isLoading,
    @Default(false) bool isSaving,
    @Default('') String email,
    @Default('') String nickname,
    // 画面には出さないが、更新APIの都合で保持しておく（モックのため）
    @Default('') String bio,
    @Default('') String currentPassword,
    @Default('') String password,
    @Default('') String passwordConfirm,
    String? emailError,
    String? nicknameError,
    String? currentPasswordError,
    String? passwordError,
    String? passwordConfirmError,
  }) = _ProfileEditState;
}


