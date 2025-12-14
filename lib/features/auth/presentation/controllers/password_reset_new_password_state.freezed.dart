// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_reset_new_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PasswordResetNewPasswordState {
  String get newPassword => throw _privateConstructorUsedError;
  String get newPasswordConfirm => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get newPasswordError => throw _privateConstructorUsedError;
  String? get newPasswordConfirmError => throw _privateConstructorUsedError;

  /// Create a copy of PasswordResetNewPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasswordResetNewPasswordStateCopyWith<PasswordResetNewPasswordState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetNewPasswordStateCopyWith<$Res> {
  factory $PasswordResetNewPasswordStateCopyWith(
    PasswordResetNewPasswordState value,
    $Res Function(PasswordResetNewPasswordState) then,
  ) =
      _$PasswordResetNewPasswordStateCopyWithImpl<
        $Res,
        PasswordResetNewPasswordState
      >;
  @useResult
  $Res call({
    String newPassword,
    String newPasswordConfirm,
    bool isLoading,
    String? newPasswordError,
    String? newPasswordConfirmError,
  });
}

/// @nodoc
class _$PasswordResetNewPasswordStateCopyWithImpl<
  $Res,
  $Val extends PasswordResetNewPasswordState
>
    implements $PasswordResetNewPasswordStateCopyWith<$Res> {
  _$PasswordResetNewPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasswordResetNewPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
    Object? newPasswordConfirm = null,
    Object? isLoading = null,
    Object? newPasswordError = freezed,
    Object? newPasswordConfirmError = freezed,
  }) {
    return _then(
      _value.copyWith(
            newPassword: null == newPassword
                ? _value.newPassword
                : newPassword // ignore: cast_nullable_to_non_nullable
                      as String,
            newPasswordConfirm: null == newPasswordConfirm
                ? _value.newPasswordConfirm
                : newPasswordConfirm // ignore: cast_nullable_to_non_nullable
                      as String,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            newPasswordError: freezed == newPasswordError
                ? _value.newPasswordError
                : newPasswordError // ignore: cast_nullable_to_non_nullable
                      as String?,
            newPasswordConfirmError: freezed == newPasswordConfirmError
                ? _value.newPasswordConfirmError
                : newPasswordConfirmError // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PasswordResetNewPasswordStateImplCopyWith<$Res>
    implements $PasswordResetNewPasswordStateCopyWith<$Res> {
  factory _$$PasswordResetNewPasswordStateImplCopyWith(
    _$PasswordResetNewPasswordStateImpl value,
    $Res Function(_$PasswordResetNewPasswordStateImpl) then,
  ) = __$$PasswordResetNewPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String newPassword,
    String newPasswordConfirm,
    bool isLoading,
    String? newPasswordError,
    String? newPasswordConfirmError,
  });
}

/// @nodoc
class __$$PasswordResetNewPasswordStateImplCopyWithImpl<$Res>
    extends
        _$PasswordResetNewPasswordStateCopyWithImpl<
          $Res,
          _$PasswordResetNewPasswordStateImpl
        >
    implements _$$PasswordResetNewPasswordStateImplCopyWith<$Res> {
  __$$PasswordResetNewPasswordStateImplCopyWithImpl(
    _$PasswordResetNewPasswordStateImpl _value,
    $Res Function(_$PasswordResetNewPasswordStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordResetNewPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
    Object? newPasswordConfirm = null,
    Object? isLoading = null,
    Object? newPasswordError = freezed,
    Object? newPasswordConfirmError = freezed,
  }) {
    return _then(
      _$PasswordResetNewPasswordStateImpl(
        newPassword: null == newPassword
            ? _value.newPassword
            : newPassword // ignore: cast_nullable_to_non_nullable
                  as String,
        newPasswordConfirm: null == newPasswordConfirm
            ? _value.newPasswordConfirm
            : newPasswordConfirm // ignore: cast_nullable_to_non_nullable
                  as String,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        newPasswordError: freezed == newPasswordError
            ? _value.newPasswordError
            : newPasswordError // ignore: cast_nullable_to_non_nullable
                  as String?,
        newPasswordConfirmError: freezed == newPasswordConfirmError
            ? _value.newPasswordConfirmError
            : newPasswordConfirmError // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$PasswordResetNewPasswordStateImpl
    implements _PasswordResetNewPasswordState {
  const _$PasswordResetNewPasswordStateImpl({
    this.newPassword = '',
    this.newPasswordConfirm = '',
    this.isLoading = false,
    this.newPasswordError,
    this.newPasswordConfirmError,
  });

  @override
  @JsonKey()
  final String newPassword;
  @override
  @JsonKey()
  final String newPasswordConfirm;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? newPasswordError;
  @override
  final String? newPasswordConfirmError;

  @override
  String toString() {
    return 'PasswordResetNewPasswordState(newPassword: $newPassword, newPasswordConfirm: $newPasswordConfirm, isLoading: $isLoading, newPasswordError: $newPasswordError, newPasswordConfirmError: $newPasswordConfirmError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetNewPasswordStateImpl &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.newPasswordConfirm, newPasswordConfirm) ||
                other.newPasswordConfirm == newPasswordConfirm) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.newPasswordError, newPasswordError) ||
                other.newPasswordError == newPasswordError) &&
            (identical(
                  other.newPasswordConfirmError,
                  newPasswordConfirmError,
                ) ||
                other.newPasswordConfirmError == newPasswordConfirmError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    newPassword,
    newPasswordConfirm,
    isLoading,
    newPasswordError,
    newPasswordConfirmError,
  );

  /// Create a copy of PasswordResetNewPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordResetNewPasswordStateImplCopyWith<
    _$PasswordResetNewPasswordStateImpl
  >
  get copyWith =>
      __$$PasswordResetNewPasswordStateImplCopyWithImpl<
        _$PasswordResetNewPasswordStateImpl
      >(this, _$identity);
}

abstract class _PasswordResetNewPasswordState
    implements PasswordResetNewPasswordState {
  const factory _PasswordResetNewPasswordState({
    final String newPassword,
    final String newPasswordConfirm,
    final bool isLoading,
    final String? newPasswordError,
    final String? newPasswordConfirmError,
  }) = _$PasswordResetNewPasswordStateImpl;

  @override
  String get newPassword;
  @override
  String get newPasswordConfirm;
  @override
  bool get isLoading;
  @override
  String? get newPasswordError;
  @override
  String? get newPasswordConfirmError;

  /// Create a copy of PasswordResetNewPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordResetNewPasswordStateImplCopyWith<
    _$PasswordResetNewPasswordStateImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
