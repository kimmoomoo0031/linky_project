// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WithdrawState {
  String get currentPassword => throw _privateConstructorUsedError;
  WithdrawReason? get reason => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String? get currentPasswordError => throw _privateConstructorUsedError;
  String? get reasonError => throw _privateConstructorUsedError;

  /// Create a copy of WithdrawState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WithdrawStateCopyWith<WithdrawState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawStateCopyWith<$Res> {
  factory $WithdrawStateCopyWith(
    WithdrawState value,
    $Res Function(WithdrawState) then,
  ) = _$WithdrawStateCopyWithImpl<$Res, WithdrawState>;
  @useResult
  $Res call({
    String currentPassword,
    WithdrawReason? reason,
    bool isSubmitting,
    String? currentPasswordError,
    String? reasonError,
  });
}

/// @nodoc
class _$WithdrawStateCopyWithImpl<$Res, $Val extends WithdrawState>
    implements $WithdrawStateCopyWith<$Res> {
  _$WithdrawStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WithdrawState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? reason = freezed,
    Object? isSubmitting = null,
    Object? currentPasswordError = freezed,
    Object? reasonError = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentPassword: null == currentPassword
                ? _value.currentPassword
                : currentPassword // ignore: cast_nullable_to_non_nullable
                      as String,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as WithdrawReason?,
            isSubmitting: null == isSubmitting
                ? _value.isSubmitting
                : isSubmitting // ignore: cast_nullable_to_non_nullable
                      as bool,
            currentPasswordError: freezed == currentPasswordError
                ? _value.currentPasswordError
                : currentPasswordError // ignore: cast_nullable_to_non_nullable
                      as String?,
            reasonError: freezed == reasonError
                ? _value.reasonError
                : reasonError // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WithdrawStateImplCopyWith<$Res>
    implements $WithdrawStateCopyWith<$Res> {
  factory _$$WithdrawStateImplCopyWith(
    _$WithdrawStateImpl value,
    $Res Function(_$WithdrawStateImpl) then,
  ) = __$$WithdrawStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String currentPassword,
    WithdrawReason? reason,
    bool isSubmitting,
    String? currentPasswordError,
    String? reasonError,
  });
}

/// @nodoc
class __$$WithdrawStateImplCopyWithImpl<$Res>
    extends _$WithdrawStateCopyWithImpl<$Res, _$WithdrawStateImpl>
    implements _$$WithdrawStateImplCopyWith<$Res> {
  __$$WithdrawStateImplCopyWithImpl(
    _$WithdrawStateImpl _value,
    $Res Function(_$WithdrawStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WithdrawState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? reason = freezed,
    Object? isSubmitting = null,
    Object? currentPasswordError = freezed,
    Object? reasonError = freezed,
  }) {
    return _then(
      _$WithdrawStateImpl(
        currentPassword: null == currentPassword
            ? _value.currentPassword
            : currentPassword // ignore: cast_nullable_to_non_nullable
                  as String,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as WithdrawReason?,
        isSubmitting: null == isSubmitting
            ? _value.isSubmitting
            : isSubmitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        currentPasswordError: freezed == currentPasswordError
            ? _value.currentPasswordError
            : currentPasswordError // ignore: cast_nullable_to_non_nullable
                  as String?,
        reasonError: freezed == reasonError
            ? _value.reasonError
            : reasonError // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$WithdrawStateImpl implements _WithdrawState {
  const _$WithdrawStateImpl({
    this.currentPassword = '',
    this.reason,
    this.isSubmitting = false,
    this.currentPasswordError,
    this.reasonError,
  });

  @override
  @JsonKey()
  final String currentPassword;
  @override
  final WithdrawReason? reason;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  final String? currentPasswordError;
  @override
  final String? reasonError;

  @override
  String toString() {
    return 'WithdrawState(currentPassword: $currentPassword, reason: $reason, isSubmitting: $isSubmitting, currentPasswordError: $currentPasswordError, reasonError: $reasonError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawStateImpl &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.currentPasswordError, currentPasswordError) ||
                other.currentPasswordError == currentPasswordError) &&
            (identical(other.reasonError, reasonError) ||
                other.reasonError == reasonError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentPassword,
    reason,
    isSubmitting,
    currentPasswordError,
    reasonError,
  );

  /// Create a copy of WithdrawState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawStateImplCopyWith<_$WithdrawStateImpl> get copyWith =>
      __$$WithdrawStateImplCopyWithImpl<_$WithdrawStateImpl>(this, _$identity);
}

abstract class _WithdrawState implements WithdrawState {
  const factory _WithdrawState({
    final String currentPassword,
    final WithdrawReason? reason,
    final bool isSubmitting,
    final String? currentPasswordError,
    final String? reasonError,
  }) = _$WithdrawStateImpl;

  @override
  String get currentPassword;
  @override
  WithdrawReason? get reason;
  @override
  bool get isSubmitting;
  @override
  String? get currentPasswordError;
  @override
  String? get reasonError;

  /// Create a copy of WithdrawState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WithdrawStateImplCopyWith<_$WithdrawStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
