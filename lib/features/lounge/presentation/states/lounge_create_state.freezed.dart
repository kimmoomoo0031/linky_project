// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lounge_create_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoungeCreateState {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// カバー画像（オリジナル）パス。サーバー送信時に利用する想定。
  String? get originalImagePath => throw _privateConstructorUsedError;

  /// ラウンジアイコン用のプレビュー（1:1サムネ）。UI表示用に保持する。
  Uint8List? get thumbnailBytes => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String? get nameError => throw _privateConstructorUsedError;
  String? get descriptionError => throw _privateConstructorUsedError;
  String? get coverImageError => throw _privateConstructorUsedError;

  /// Create a copy of LoungeCreateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoungeCreateStateCopyWith<LoungeCreateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoungeCreateStateCopyWith<$Res> {
  factory $LoungeCreateStateCopyWith(
    LoungeCreateState value,
    $Res Function(LoungeCreateState) then,
  ) = _$LoungeCreateStateCopyWithImpl<$Res, LoungeCreateState>;
  @useResult
  $Res call({
    String name,
    String description,
    String? originalImagePath,
    Uint8List? thumbnailBytes,
    bool isSubmitting,
    String? nameError,
    String? descriptionError,
    String? coverImageError,
  });
}

/// @nodoc
class _$LoungeCreateStateCopyWithImpl<$Res, $Val extends LoungeCreateState>
    implements $LoungeCreateStateCopyWith<$Res> {
  _$LoungeCreateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoungeCreateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? originalImagePath = freezed,
    Object? thumbnailBytes = freezed,
    Object? isSubmitting = null,
    Object? nameError = freezed,
    Object? descriptionError = freezed,
    Object? coverImageError = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            originalImagePath: freezed == originalImagePath
                ? _value.originalImagePath
                : originalImagePath // ignore: cast_nullable_to_non_nullable
                      as String?,
            thumbnailBytes: freezed == thumbnailBytes
                ? _value.thumbnailBytes
                : thumbnailBytes // ignore: cast_nullable_to_non_nullable
                      as Uint8List?,
            isSubmitting: null == isSubmitting
                ? _value.isSubmitting
                : isSubmitting // ignore: cast_nullable_to_non_nullable
                      as bool,
            nameError: freezed == nameError
                ? _value.nameError
                : nameError // ignore: cast_nullable_to_non_nullable
                      as String?,
            descriptionError: freezed == descriptionError
                ? _value.descriptionError
                : descriptionError // ignore: cast_nullable_to_non_nullable
                      as String?,
            coverImageError: freezed == coverImageError
                ? _value.coverImageError
                : coverImageError // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoungeCreateStateImplCopyWith<$Res>
    implements $LoungeCreateStateCopyWith<$Res> {
  factory _$$LoungeCreateStateImplCopyWith(
    _$LoungeCreateStateImpl value,
    $Res Function(_$LoungeCreateStateImpl) then,
  ) = __$$LoungeCreateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String description,
    String? originalImagePath,
    Uint8List? thumbnailBytes,
    bool isSubmitting,
    String? nameError,
    String? descriptionError,
    String? coverImageError,
  });
}

/// @nodoc
class __$$LoungeCreateStateImplCopyWithImpl<$Res>
    extends _$LoungeCreateStateCopyWithImpl<$Res, _$LoungeCreateStateImpl>
    implements _$$LoungeCreateStateImplCopyWith<$Res> {
  __$$LoungeCreateStateImplCopyWithImpl(
    _$LoungeCreateStateImpl _value,
    $Res Function(_$LoungeCreateStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoungeCreateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? originalImagePath = freezed,
    Object? thumbnailBytes = freezed,
    Object? isSubmitting = null,
    Object? nameError = freezed,
    Object? descriptionError = freezed,
    Object? coverImageError = freezed,
  }) {
    return _then(
      _$LoungeCreateStateImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        originalImagePath: freezed == originalImagePath
            ? _value.originalImagePath
            : originalImagePath // ignore: cast_nullable_to_non_nullable
                  as String?,
        thumbnailBytes: freezed == thumbnailBytes
            ? _value.thumbnailBytes
            : thumbnailBytes // ignore: cast_nullable_to_non_nullable
                  as Uint8List?,
        isSubmitting: null == isSubmitting
            ? _value.isSubmitting
            : isSubmitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        nameError: freezed == nameError
            ? _value.nameError
            : nameError // ignore: cast_nullable_to_non_nullable
                  as String?,
        descriptionError: freezed == descriptionError
            ? _value.descriptionError
            : descriptionError // ignore: cast_nullable_to_non_nullable
                  as String?,
        coverImageError: freezed == coverImageError
            ? _value.coverImageError
            : coverImageError // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$LoungeCreateStateImpl implements _LoungeCreateState {
  const _$LoungeCreateStateImpl({
    this.name = '',
    this.description = '',
    this.originalImagePath,
    this.thumbnailBytes,
    this.isSubmitting = false,
    this.nameError,
    this.descriptionError,
    this.coverImageError,
  });

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;

  /// カバー画像（オリジナル）パス。サーバー送信時に利用する想定。
  @override
  final String? originalImagePath;

  /// ラウンジアイコン用のプレビュー（1:1サムネ）。UI表示用に保持する。
  @override
  final Uint8List? thumbnailBytes;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  final String? nameError;
  @override
  final String? descriptionError;
  @override
  final String? coverImageError;

  @override
  String toString() {
    return 'LoungeCreateState(name: $name, description: $description, originalImagePath: $originalImagePath, thumbnailBytes: $thumbnailBytes, isSubmitting: $isSubmitting, nameError: $nameError, descriptionError: $descriptionError, coverImageError: $coverImageError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoungeCreateStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.originalImagePath, originalImagePath) ||
                other.originalImagePath == originalImagePath) &&
            const DeepCollectionEquality().equals(
              other.thumbnailBytes,
              thumbnailBytes,
            ) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.nameError, nameError) ||
                other.nameError == nameError) &&
            (identical(other.descriptionError, descriptionError) ||
                other.descriptionError == descriptionError) &&
            (identical(other.coverImageError, coverImageError) ||
                other.coverImageError == coverImageError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    description,
    originalImagePath,
    const DeepCollectionEquality().hash(thumbnailBytes),
    isSubmitting,
    nameError,
    descriptionError,
    coverImageError,
  );

  /// Create a copy of LoungeCreateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoungeCreateStateImplCopyWith<_$LoungeCreateStateImpl> get copyWith =>
      __$$LoungeCreateStateImplCopyWithImpl<_$LoungeCreateStateImpl>(
        this,
        _$identity,
      );
}

abstract class _LoungeCreateState implements LoungeCreateState {
  const factory _LoungeCreateState({
    final String name,
    final String description,
    final String? originalImagePath,
    final Uint8List? thumbnailBytes,
    final bool isSubmitting,
    final String? nameError,
    final String? descriptionError,
    final String? coverImageError,
  }) = _$LoungeCreateStateImpl;

  @override
  String get name;
  @override
  String get description;

  /// カバー画像（オリジナル）パス。サーバー送信時に利用する想定。
  @override
  String? get originalImagePath;

  /// ラウンジアイコン用のプレビュー（1:1サムネ）。UI表示用に保持する。
  @override
  Uint8List? get thumbnailBytes;
  @override
  bool get isSubmitting;
  @override
  String? get nameError;
  @override
  String? get descriptionError;
  @override
  String? get coverImageError;

  /// Create a copy of LoungeCreateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoungeCreateStateImplCopyWith<_$LoungeCreateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
