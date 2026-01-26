import 'dart:typed_data';

import 'package:characters/characters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:linky_project_0318/core/constants/lounge_constants.dart';

part 'lounge_post_create_state.freezed.dart';

@freezed
class LoungePostCreateState with _$LoungePostCreateState {
  const factory LoungePostCreateState({
    @Default('') String title,
    @Default('') String contentRaw,
    @Default('') String guestNickname,
    @Default('') String guestPassword,
    @Default(false) bool isGuest,
    @Default(<Uint8List>[]) List<Uint8List> attachedImageBytes,
    @Default(<String>[]) List<String> attachedImagePaths,
    @Default(false) bool isSubmitting,
    String? titleError,
    String? contentError,
    String? guestNicknameError,
    String? guestPasswordError,
  }) = _LoungePostCreateState;
}

/// UI側で「判断」を散らさないための派生値（getter）。
extension LoungePostCreateStateX on LoungePostCreateState {
  int get titleCount => title.characters.length;
  int get contentCount => contentRaw.characters.length;
  int get attachedImageCount => attachedImageBytes.length;

  bool get isTitleOverLimit => titleCount > LoungeConstants.postTitleMaxLength;
  bool get isContentOverLimit =>
      contentCount > LoungeConstants.postContentMaxLength;
}

