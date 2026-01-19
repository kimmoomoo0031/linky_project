// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_notification_settings_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UpdateNotificationSettingsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateNotificationSettingsSuccess value) success,
    required TResult Function(UpdateNotificationSettingsNetworkError value)
    networkError,
    required TResult Function(UpdateNotificationSettingsServerError value)
    serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateNotificationSettingsSuccess value)? success,
    TResult? Function(UpdateNotificationSettingsNetworkError value)?
    networkError,
    TResult? Function(UpdateNotificationSettingsServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateNotificationSettingsSuccess value)? success,
    TResult Function(UpdateNotificationSettingsNetworkError value)?
    networkError,
    TResult Function(UpdateNotificationSettingsServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateNotificationSettingsResultCopyWith<$Res> {
  factory $UpdateNotificationSettingsResultCopyWith(
    UpdateNotificationSettingsResult value,
    $Res Function(UpdateNotificationSettingsResult) then,
  ) =
      _$UpdateNotificationSettingsResultCopyWithImpl<
        $Res,
        UpdateNotificationSettingsResult
      >;
}

/// @nodoc
class _$UpdateNotificationSettingsResultCopyWithImpl<
  $Res,
  $Val extends UpdateNotificationSettingsResult
>
    implements $UpdateNotificationSettingsResultCopyWith<$Res> {
  _$UpdateNotificationSettingsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateNotificationSettingsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UpdateNotificationSettingsSuccessImplCopyWith<$Res> {
  factory _$$UpdateNotificationSettingsSuccessImplCopyWith(
    _$UpdateNotificationSettingsSuccessImpl value,
    $Res Function(_$UpdateNotificationSettingsSuccessImpl) then,
  ) = __$$UpdateNotificationSettingsSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateNotificationSettingsSuccessImplCopyWithImpl<$Res>
    extends
        _$UpdateNotificationSettingsResultCopyWithImpl<
          $Res,
          _$UpdateNotificationSettingsSuccessImpl
        >
    implements _$$UpdateNotificationSettingsSuccessImplCopyWith<$Res> {
  __$$UpdateNotificationSettingsSuccessImplCopyWithImpl(
    _$UpdateNotificationSettingsSuccessImpl _value,
    $Res Function(_$UpdateNotificationSettingsSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateNotificationSettingsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateNotificationSettingsSuccessImpl
    implements UpdateNotificationSettingsSuccess {
  const _$UpdateNotificationSettingsSuccessImpl();

  @override
  String toString() {
    return 'UpdateNotificationSettingsResult.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNotificationSettingsSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
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
    required TResult Function(UpdateNotificationSettingsSuccess value) success,
    required TResult Function(UpdateNotificationSettingsNetworkError value)
    networkError,
    required TResult Function(UpdateNotificationSettingsServerError value)
    serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateNotificationSettingsSuccess value)? success,
    TResult? Function(UpdateNotificationSettingsNetworkError value)?
    networkError,
    TResult? Function(UpdateNotificationSettingsServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateNotificationSettingsSuccess value)? success,
    TResult Function(UpdateNotificationSettingsNetworkError value)?
    networkError,
    TResult Function(UpdateNotificationSettingsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class UpdateNotificationSettingsSuccess
    implements UpdateNotificationSettingsResult {
  const factory UpdateNotificationSettingsSuccess() =
      _$UpdateNotificationSettingsSuccessImpl;
}

/// @nodoc
abstract class _$$UpdateNotificationSettingsNetworkErrorImplCopyWith<$Res> {
  factory _$$UpdateNotificationSettingsNetworkErrorImplCopyWith(
    _$UpdateNotificationSettingsNetworkErrorImpl value,
    $Res Function(_$UpdateNotificationSettingsNetworkErrorImpl) then,
  ) = __$$UpdateNotificationSettingsNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateNotificationSettingsNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$UpdateNotificationSettingsResultCopyWithImpl<
          $Res,
          _$UpdateNotificationSettingsNetworkErrorImpl
        >
    implements _$$UpdateNotificationSettingsNetworkErrorImplCopyWith<$Res> {
  __$$UpdateNotificationSettingsNetworkErrorImplCopyWithImpl(
    _$UpdateNotificationSettingsNetworkErrorImpl _value,
    $Res Function(_$UpdateNotificationSettingsNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateNotificationSettingsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateNotificationSettingsNetworkErrorImpl
    implements UpdateNotificationSettingsNetworkError {
  const _$UpdateNotificationSettingsNetworkErrorImpl();

  @override
  String toString() {
    return 'UpdateNotificationSettingsResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNotificationSettingsNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
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
    required TResult Function(UpdateNotificationSettingsSuccess value) success,
    required TResult Function(UpdateNotificationSettingsNetworkError value)
    networkError,
    required TResult Function(UpdateNotificationSettingsServerError value)
    serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateNotificationSettingsSuccess value)? success,
    TResult? Function(UpdateNotificationSettingsNetworkError value)?
    networkError,
    TResult? Function(UpdateNotificationSettingsServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateNotificationSettingsSuccess value)? success,
    TResult Function(UpdateNotificationSettingsNetworkError value)?
    networkError,
    TResult Function(UpdateNotificationSettingsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class UpdateNotificationSettingsNetworkError
    implements UpdateNotificationSettingsResult {
  const factory UpdateNotificationSettingsNetworkError() =
      _$UpdateNotificationSettingsNetworkErrorImpl;
}

/// @nodoc
abstract class _$$UpdateNotificationSettingsServerErrorImplCopyWith<$Res> {
  factory _$$UpdateNotificationSettingsServerErrorImplCopyWith(
    _$UpdateNotificationSettingsServerErrorImpl value,
    $Res Function(_$UpdateNotificationSettingsServerErrorImpl) then,
  ) = __$$UpdateNotificationSettingsServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateNotificationSettingsServerErrorImplCopyWithImpl<$Res>
    extends
        _$UpdateNotificationSettingsResultCopyWithImpl<
          $Res,
          _$UpdateNotificationSettingsServerErrorImpl
        >
    implements _$$UpdateNotificationSettingsServerErrorImplCopyWith<$Res> {
  __$$UpdateNotificationSettingsServerErrorImplCopyWithImpl(
    _$UpdateNotificationSettingsServerErrorImpl _value,
    $Res Function(_$UpdateNotificationSettingsServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateNotificationSettingsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateNotificationSettingsServerErrorImpl
    implements UpdateNotificationSettingsServerError {
  const _$UpdateNotificationSettingsServerErrorImpl();

  @override
  String toString() {
    return 'UpdateNotificationSettingsResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNotificationSettingsServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
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
    required TResult Function(UpdateNotificationSettingsSuccess value) success,
    required TResult Function(UpdateNotificationSettingsNetworkError value)
    networkError,
    required TResult Function(UpdateNotificationSettingsServerError value)
    serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateNotificationSettingsSuccess value)? success,
    TResult? Function(UpdateNotificationSettingsNetworkError value)?
    networkError,
    TResult? Function(UpdateNotificationSettingsServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateNotificationSettingsSuccess value)? success,
    TResult Function(UpdateNotificationSettingsNetworkError value)?
    networkError,
    TResult Function(UpdateNotificationSettingsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class UpdateNotificationSettingsServerError
    implements UpdateNotificationSettingsResult {
  const factory UpdateNotificationSettingsServerError() =
      _$UpdateNotificationSettingsServerErrorImpl;
}
