import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:characters/characters.dart';

import 'package:linky_project_0318/core/constants/lounge_constants.dart';

part 'lounge_create_state.freezed.dart';

@freezed
class LoungeCreateState with _$LoungeCreateState {
  const factory LoungeCreateState({
    @Default('') String name,
    @Default('') String description,

    /// カバー画像（オリジナル）パス。サーバー送信時に利用する想定。
    String? originalImagePath,

    /// ラウンジアイコン用のプレビュー（1:1サムネ）。UI表示用に保持する。
    Uint8List? thumbnailBytes,

    @Default(false) bool isSubmitting,

    String? nameError,
    String? descriptionError,
    String? coverImageError,
  }) = _LoungeCreateState;
}

/// UI側で「判断」を散らさないための派生値（getter）。
extension LoungeCreateStateX on LoungeCreateState {
  int get nameCount => name.characters.length;
  int get descriptionCount => description.characters.length;

  bool get isNameOverLimit => nameCount > LoungeConstants.nameMaxLength;
  bool get isDescriptionOverLimit =>
      descriptionCount > LoungeConstants.descriptionMaxLength;
}


