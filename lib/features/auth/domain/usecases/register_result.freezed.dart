// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RegisterResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() emailAlreadyUsed,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function()? emailAlreadyUsed,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? emailAlreadyUsed,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterSuccess value) success,
    required TResult Function(RegisterEmailAlreadyUsed value) emailAlreadyUsed,
    required TResult Function(RegisterNetworkError value) networkError,
    required TResult Function(RegisterServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterSuccess value)? success,
    TResult? Function(RegisterEmailAlreadyUsed value)? emailAlreadyUsed,
    TResult? Function(RegisterNetworkError value)? networkError,
    TResult? Function(RegisterServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterSuccess value)? success,
    TResult Function(RegisterEmailAlreadyUsed value)? emailAlreadyUsed,
    TResult Function(RegisterNetworkError value)? networkError,
    TResult Function(RegisterServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterResultCopyWith<$Res> {
  factory $RegisterResultCopyWith(
    RegisterResult value,
    $Res Function(RegisterResult) then,
  ) = _$RegisterResultCopyWithImpl<$Res, RegisterResult>;
}

/// @nodoc
class _$RegisterResultCopyWithImpl<$Res, $Val extends RegisterResult>
    implements $RegisterResultCopyWith<$Res> {
  _$RegisterResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RegisterSuccessImplCopyWith<$Res> {
  factory _$$RegisterSuccessImplCopyWith(
    _$RegisterSuccessImpl value,
    $Res Function(_$RegisterSuccessImpl) then,
  ) = __$$RegisterSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterSuccessImplCopyWithImpl<$Res>
    extends _$RegisterResultCopyWithImpl<$Res, _$RegisterSuccessImpl>
    implements _$$RegisterSuccessImplCopyWith<$Res> {
  __$$RegisterSuccessImplCopyWithImpl(
    _$RegisterSuccessImpl _value,
    $Res Function(_$RegisterSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegisterSuccessImpl implements RegisterSuccess {
  const _$RegisterSuccessImpl();

  @override
  String toString() {
    return 'RegisterResult.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() emailAlreadyUsed,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function()? emailAlreadyUsed,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? emailAlreadyUsed,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterSuccess value) success,
    required TResult Function(RegisterEmailAlreadyUsed value) emailAlreadyUsed,
    required TResult Function(RegisterNetworkError value) networkError,
    required TResult Function(RegisterServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterSuccess value)? success,
    TResult? Function(RegisterEmailAlreadyUsed value)? emailAlreadyUsed,
    TResult? Function(RegisterNetworkError value)? networkError,
    TResult? Function(RegisterServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterSuccess value)? success,
    TResult Function(RegisterEmailAlreadyUsed value)? emailAlreadyUsed,
    TResult Function(RegisterNetworkError value)? networkError,
    TResult Function(RegisterServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RegisterSuccess implements RegisterResult {
  const factory RegisterSuccess() = _$RegisterSuccessImpl;
}

/// @nodoc
abstract class _$$RegisterEmailAlreadyUsedImplCopyWith<$Res> {
  factory _$$RegisterEmailAlreadyUsedImplCopyWith(
    _$RegisterEmailAlreadyUsedImpl value,
    $Res Function(_$RegisterEmailAlreadyUsedImpl) then,
  ) = __$$RegisterEmailAlreadyUsedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterEmailAlreadyUsedImplCopyWithImpl<$Res>
    extends _$RegisterResultCopyWithImpl<$Res, _$RegisterEmailAlreadyUsedImpl>
    implements _$$RegisterEmailAlreadyUsedImplCopyWith<$Res> {
  __$$RegisterEmailAlreadyUsedImplCopyWithImpl(
    _$RegisterEmailAlreadyUsedImpl _value,
    $Res Function(_$RegisterEmailAlreadyUsedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegisterEmailAlreadyUsedImpl implements RegisterEmailAlreadyUsed {
  const _$RegisterEmailAlreadyUsedImpl();

  @override
  String toString() {
    return 'RegisterResult.emailAlreadyUsed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterEmailAlreadyUsedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() emailAlreadyUsed,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return emailAlreadyUsed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function()? emailAlreadyUsed,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return emailAlreadyUsed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? emailAlreadyUsed,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (emailAlreadyUsed != null) {
      return emailAlreadyUsed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterSuccess value) success,
    required TResult Function(RegisterEmailAlreadyUsed value) emailAlreadyUsed,
    required TResult Function(RegisterNetworkError value) networkError,
    required TResult Function(RegisterServerError value) serverError,
  }) {
    return emailAlreadyUsed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterSuccess value)? success,
    TResult? Function(RegisterEmailAlreadyUsed value)? emailAlreadyUsed,
    TResult? Function(RegisterNetworkError value)? networkError,
    TResult? Function(RegisterServerError value)? serverError,
  }) {
    return emailAlreadyUsed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterSuccess value)? success,
    TResult Function(RegisterEmailAlreadyUsed value)? emailAlreadyUsed,
    TResult Function(RegisterNetworkError value)? networkError,
    TResult Function(RegisterServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (emailAlreadyUsed != null) {
      return emailAlreadyUsed(this);
    }
    return orElse();
  }
}

abstract class RegisterEmailAlreadyUsed implements RegisterResult {
  const factory RegisterEmailAlreadyUsed() = _$RegisterEmailAlreadyUsedImpl;
}

/// @nodoc
abstract class _$$RegisterNetworkErrorImplCopyWith<$Res> {
  factory _$$RegisterNetworkErrorImplCopyWith(
    _$RegisterNetworkErrorImpl value,
    $Res Function(_$RegisterNetworkErrorImpl) then,
  ) = __$$RegisterNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterNetworkErrorImplCopyWithImpl<$Res>
    extends _$RegisterResultCopyWithImpl<$Res, _$RegisterNetworkErrorImpl>
    implements _$$RegisterNetworkErrorImplCopyWith<$Res> {
  __$$RegisterNetworkErrorImplCopyWithImpl(
    _$RegisterNetworkErrorImpl _value,
    $Res Function(_$RegisterNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegisterNetworkErrorImpl implements RegisterNetworkError {
  const _$RegisterNetworkErrorImpl();

  @override
  String toString() {
    return 'RegisterResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() emailAlreadyUsed,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function()? emailAlreadyUsed,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? emailAlreadyUsed,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterSuccess value) success,
    required TResult Function(RegisterEmailAlreadyUsed value) emailAlreadyUsed,
    required TResult Function(RegisterNetworkError value) networkError,
    required TResult Function(RegisterServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterSuccess value)? success,
    TResult? Function(RegisterEmailAlreadyUsed value)? emailAlreadyUsed,
    TResult? Function(RegisterNetworkError value)? networkError,
    TResult? Function(RegisterServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterSuccess value)? success,
    TResult Function(RegisterEmailAlreadyUsed value)? emailAlreadyUsed,
    TResult Function(RegisterNetworkError value)? networkError,
    TResult Function(RegisterServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class RegisterNetworkError implements RegisterResult {
  const factory RegisterNetworkError() = _$RegisterNetworkErrorImpl;
}

/// @nodoc
abstract class _$$RegisterServerErrorImplCopyWith<$Res> {
  factory _$$RegisterServerErrorImplCopyWith(
    _$RegisterServerErrorImpl value,
    $Res Function(_$RegisterServerErrorImpl) then,
  ) = __$$RegisterServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterServerErrorImplCopyWithImpl<$Res>
    extends _$RegisterResultCopyWithImpl<$Res, _$RegisterServerErrorImpl>
    implements _$$RegisterServerErrorImplCopyWith<$Res> {
  __$$RegisterServerErrorImplCopyWithImpl(
    _$RegisterServerErrorImpl _value,
    $Res Function(_$RegisterServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegisterServerErrorImpl implements RegisterServerError {
  const _$RegisterServerErrorImpl();

  @override
  String toString() {
    return 'RegisterResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() emailAlreadyUsed,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function()? emailAlreadyUsed,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? emailAlreadyUsed,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterSuccess value) success,
    required TResult Function(RegisterEmailAlreadyUsed value) emailAlreadyUsed,
    required TResult Function(RegisterNetworkError value) networkError,
    required TResult Function(RegisterServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterSuccess value)? success,
    TResult? Function(RegisterEmailAlreadyUsed value)? emailAlreadyUsed,
    TResult? Function(RegisterNetworkError value)? networkError,
    TResult? Function(RegisterServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterSuccess value)? success,
    TResult Function(RegisterEmailAlreadyUsed value)? emailAlreadyUsed,
    TResult Function(RegisterNetworkError value)? networkError,
    TResult Function(RegisterServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class RegisterServerError implements RegisterResult {
  const factory RegisterServerError() = _$RegisterServerErrorImpl;
}
