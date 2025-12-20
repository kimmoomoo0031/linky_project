import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linky_project_0318/core/constants/common_dialog_messages.dart';
import 'package:linky_project_0318/core/constants/dialog_type.dart';
import 'package:linky_project_0318/core/ui/events/linky_dialog_event.dart';
import 'package:linky_project_0318/features/user/domain/entities/user_profile.dart';
import 'package:linky_project_0318/features/user/user_di.dart';
import 'package:linky_project_0318/features/user/presentation/user_dialog_event_providers.dart';

import '../states/profile_edit_state.dart';

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
      final repo = _ref.read(userRepositoryProvider);
      final profile = await repo.getMyProfile();
      state = state.copyWith(
        isLoading: false,
        nickname: profile.nickname,
        email: profile.email,
        bio: profile.bio,
        nicknameError: null,
        bioError: null,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false);
      _emitDialog(
        const LinkyDialogEvent(
          type: LinkyDialogType.error,
          message: CommonDialogMessages.unexpectedError,
        ),
      );
    }
  }

  void onNicknameChanged(String value) {
    state = state.copyWith(nickname: value, nicknameError: null);
  }

  void onBioChanged(String value) {
    state = state.copyWith(bio: value, bioError: null);
  }

  bool _validate() {
    final nickname = state.nickname.trim();
    final bio = state.bio.trim();

    String? nicknameError;
    String? bioError;

    if (nickname.isEmpty) {
      nicknameError = 'ニックネームを入力してください';
    } else if (nickname.length < 2 || nickname.length > 12) {
      nicknameError = 'ニックネームは2〜12文字で入力してください';
    }

    if (bio.length > 120) {
      bioError = '自己紹介は120文字以内で入力してください';
    }

    if (nicknameError != null || bioError != null) {
      state = state.copyWith(nicknameError: nicknameError, bioError: bioError);
      return false;
    }
    return true;
  }

  Future<void> save() async {
    if (state.isLoading || state.isSaving) return;
    if (!_validate()) return;

    state = state.copyWith(isSaving: true);
    try {
      final repo = _ref.read(userRepositoryProvider);
      await repo.updateMyProfile(
        UserProfile(
          nickname: state.nickname.trim(),
          email: state.email,
          bio: state.bio.trim(),
        ),
      );
      _emitDialog(
        const LinkyDialogEvent(
          type: LinkyDialogType.info,
          message: 'プロフィールを保存しました。',
        ),
      );
    } catch (_) {
      _emitDialog(
        const LinkyDialogEvent(
          type: LinkyDialogType.error,
          message: CommonDialogMessages.unexpectedError,
        ),
      );
    } finally {
      state = state.copyWith(isSaving: false);
    }
  }
}


