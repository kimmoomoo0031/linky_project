// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_reset_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PasswordResetState {
  String get email => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get emailError => throw _privateConstructorUsedError;

  /// フィールド単位ではなく、ダイアログなどで表示したい全体メッセージ。
  String? get generalErrorMessage => throw _privateConstructorUsedError;

  /// 全体メッセージに対応するダイアログのタイプ。
  LinkyDialogType? get generalErrorType => throw _privateConstructorUsedError;

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasswordResetStateCopyWith<PasswordResetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetStateCopyWith<$Res> {
  factory $PasswordResetStateCopyWith(
    PasswordResetState value,
    $Res Function(PasswordResetState) then,
  ) = _$PasswordResetStateCopyWithImpl<$Res, PasswordResetState>;
  @useResult
  $Res call({
    String email,
    bool isLoading,
    bool isSuccess,
    String? emailError,
    String? generalErrorMessage,
    LinkyDialogType? generalErrorType,
  });
}

/// @nodoc
class _$PasswordResetStateCopyWithImpl<$Res, $Val extends PasswordResetState>
    implements $PasswordResetStateCopyWith<$Res> {
  _$PasswordResetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? emailError = freezed,
    Object? generalErrorMessage = freezed,
    Object? generalErrorType = freezed,
  }) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSuccess: null == isSuccess
                ? _value.isSuccess
                : isSuccess // ignore: cast_nullable_to_non_nullable
                      as bool,
            emailError: freezed == emailError
                ? _value.emailError
                : emailError // ignore: cast_nullable_to_non_nullable
                      as String?,
            generalErrorMessage: freezed == generalErrorMessage
                ? _value.generalErrorMessage
                : generalErrorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            generalErrorType: freezed == generalErrorType
                ? _value.generalErrorType
                : generalErrorType // ignore: cast_nullable_to_non_nullable
                      as LinkyDialogType?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PasswordResetStateImplCopyWith<$Res>
    implements $PasswordResetStateCopyWith<$Res> {
  factory _$$PasswordResetStateImplCopyWith(
    _$PasswordResetStateImpl value,
    $Res Function(_$PasswordResetStateImpl) then,
  ) = __$$PasswordResetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    bool isLoading,
    bool isSuccess,
    String? emailError,
    String? generalErrorMessage,
    LinkyDialogType? generalErrorType,
  });
}

/// @nodoc
class __$$PasswordResetStateImplCopyWithImpl<$Res>
    extends _$PasswordResetStateCopyWithImpl<$Res, _$PasswordResetStateImpl>
    implements _$$PasswordResetStateImplCopyWith<$Res> {
  __$$PasswordResetStateImplCopyWithImpl(
    _$PasswordResetStateImpl _value,
    $Res Function(_$PasswordResetStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? emailError = freezed,
    Object? generalErrorMessage = freezed,
    Object? generalErrorType = freezed,
  }) {
    return _then(
      _$PasswordResetStateImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSuccess: null == isSuccess
            ? _value.isSuccess
            : isSuccess // ignore: cast_nullable_to_non_nullable
                  as bool,
        emailError: freezed == emailError
            ? _value.emailError
            : emailError // ignore: cast_nullable_to_non_nullable
                  as String?,
        generalErrorMessage: freezed == generalErrorMessage
            ? _value.generalErrorMessage
            : generalErrorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        generalErrorType: freezed == generalErrorType
            ? _value.generalErrorType
            : generalErrorType // ignore: cast_nullable_to_non_nullable
                  as LinkyDialogType?,
      ),
    );
  }
}

/// @nodoc

class _$PasswordResetStateImpl implements _PasswordResetState {
  const _$PasswordResetStateImpl({
    this.email = '',
    this.isLoading = false,
    this.isSuccess = false,
    this.emailError,
    this.generalErrorMessage,
    this.generalErrorType,
  });

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String? emailError;

  /// フィールド単位ではなく、ダイアログなどで表示したい全体メッセージ。
  @override
  final String? generalErrorMessage;

  /// 全体メッセージに対応するダイアログのタイプ。
  @override
  final LinkyDialogType? generalErrorType;

  @override
  String toString() {
    return 'PasswordResetState(email: $email, isLoading: $isLoading, isSuccess: $isSuccess, emailError: $emailError, generalErrorMessage: $generalErrorMessage, generalErrorType: $generalErrorType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.generalErrorMessage, generalErrorMessage) ||
                other.generalErrorMessage == generalErrorMessage) &&
            (identical(other.generalErrorType, generalErrorType) ||
                other.generalErrorType == generalErrorType));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    email,
    isLoading,
    isSuccess,
    emailError,
    generalErrorMessage,
    generalErrorType,
  );

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordResetStateImplCopyWith<_$PasswordResetStateImpl> get copyWith =>
      __$$PasswordResetStateImplCopyWithImpl<_$PasswordResetStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PasswordResetState implements PasswordResetState {
  const factory _PasswordResetState({
    final String email,
    final bool isLoading,
    final bool isSuccess,
    final String? emailError,
    final String? generalErrorMessage,
    final LinkyDialogType? generalErrorType,
  }) = _$PasswordResetStateImpl;

  @override
  String get email;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String? get emailError;

  /// フィールド単位ではなく、ダイアログなどで表示したい全体メッセージ。
  @override
  String? get generalErrorMessage;

  /// 全体メッセージに対応するダイアログのタイプ。
  @override
  LinkyDialogType? get generalErrorType;

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordResetStateImplCopyWith<_$PasswordResetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
