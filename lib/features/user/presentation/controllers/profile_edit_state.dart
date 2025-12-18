import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_edit_state.freezed.dart';

@freezed
class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState({
    @Default(true) bool isLoading,
    @Default(false) bool isSaving,

    @Default('') String nickname,
    @Default('') String email,
    @Default('') String bio,

    String? nicknameError,
    String? bioError,
  }) = _ProfileEditState;
}


