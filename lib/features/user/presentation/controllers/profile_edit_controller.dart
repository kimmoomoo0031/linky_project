import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/error/ui_app_messages.dart';
import 'package:linky_project_0318/core/export/dialog_type_exports.dart';
import 'package:linky_project_0318/core/utils/validators.dart';
import 'package:linky_project_0318/core/export/widgets_exports.dart';
import 'package:linky_project_0318/features/user/domain/entities/user_profile.dart';
import 'package:linky_project_0318/core/export/user_exports.dart';
import 'package:linky_project_0318/features/user/presentation/user_dialog_event_providers.dart';

import 'package:linky_project_0318/features/user/presentation/states/profile_edit_state.dart';

class ProfileEditController extends StateNotifier<ProfileEditState> {
  ProfileEditController(this._ref) : super(const ProfileEditState()) {
    Future.microtask(load);
  }

  final Ref _ref;

  void _emitDialog(LinkyDialogEvent event) {
    _ref.read(profileEditDialogEventProvider.notifier).state = event;
  }

  Future<void> load() async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _ref.read(getMyProfileUseCaseProvider).call();
      final profile = result.when(
        success: (value) => value,
        networkError: () => throw Exception('Failed to load profile'),
        serverError: () => throw Exception('Failed to load profile'),
      );
      state = state.copyWith(
        isLoading: false,
        email: profile.email,
        nickname: profile.nickname,
        bio: profile.bio,
        currentPassword: '',
        password: '',
        passwordConfirm: '',
        emailError: null,
        nicknameError: null,
        currentPasswordError: null,
        passwordError: null,
        passwordConfirmError: null,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false);
      _emitDialog(
          LinkyDialogEvent(
          type: LinkyDialogType.error,
          message: CommonMessages.errors.unexpected.message,
        ),
      );
    }
  }

  void onEmailChanged(String value) {
    state = state.copyWith(email: value, emailError: null);
  }

  void onNicknameChanged(String value) {
    state = state.copyWith(nickname: value, nicknameError: null);
  }

  void onCurrentPasswordChanged(String value) {
    state = state.copyWith(currentPassword: value, currentPasswordError: null);
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(password: value, passwordError: null);
  }

  void onPasswordConfirmChanged(String value) {
    state = state.copyWith(
      passwordConfirm: value,
      passwordConfirmError: null,
    );
  }

  bool _validate() {
    final emailError = Validators.validateEmail(state.email);
    final nicknameError = Validators.validateNickname(state.nickname);
    final currentPasswordError =
        Validators.validatePassword(state.currentPassword);
    final passwordError = Validators.validatePassword(state.password);
    final passwordConfirmError = Validators.validatePasswordConfirmation(
      password: state.password,
      confirmation: state.passwordConfirm,
    );

    if (emailError != null ||
        nicknameError != null ||
        currentPasswordError != null ||
        passwordError != null ||
        passwordConfirmError != null) {
      state = state.copyWith(
        emailError: emailError,
        nicknameError: nicknameError,
        currentPasswordError: currentPasswordError,
        passwordError: passwordError,
        passwordConfirmError: passwordConfirmError,
      );
      return false;
    }

    // 現在のパスワードと新しいパスワードが同じ場合は更新不可。
    if (state.currentPassword.trim() == state.password.trim()) {
      state = state.copyWith(
        passwordError:
            CommonMessages.failures.newPasswordMustBeDifferentFromCurrent.message,
      );
      _emitDialog(
          LinkyDialogEvent(
          type: LinkyDialogType.warning,
          message: CommonMessages.failures.newPasswordMustBeDifferentFromCurrent.message,
        ),
      );
      return false;
    }

    return true;
  }

  Future<void> save() async {
    if (state.isLoading || state.isSaving) return;
    if (!_validate()) return;

    state = state.copyWith(isSaving: true);
    try {
      final result =
          await _ref.read(updateMyProfileUseCaseProvider).call(
                UserProfile(
                  nickname: state.nickname.trim(),
                  email: state.email.trim(),
                  // TODO(api): プロフィール編集でパスワード更新APIが追加されたら連携する。
                  // 現状はモックのため、自己紹介は既存値を保持する。
                  bio: state.bio,
                ),
              );
      result.when(
        success: () {},
        networkError: () => throw Exception('Failed to update profile'),
        serverError: () => throw Exception('Failed to update profile'),
      );
      _emitDialog(
          LinkyDialogEvent(
          type: LinkyDialogType.info,
          message: CommonMessages.success.profileUpdated.message,
        ),
      );
    } catch (_) {
      // TODO(api): サーバー連携後、API失敗時のエラーコードを判定してメッセージを出し分ける。
      // - 例：ニックネーム重複（errorCode: 2000）の場合は
      //   - state.nicknameError を設定（フィールド下に表示）
      //   - LinkyDialogType.warning のダイアログも表示
      _emitDialog(
          LinkyDialogEvent(
          type: LinkyDialogType.error,
          message: CommonMessages.errors.unexpected.message,
        ),
      );
    } finally {
      state = state.copyWith(isSaving: false);
    }
  }
}


