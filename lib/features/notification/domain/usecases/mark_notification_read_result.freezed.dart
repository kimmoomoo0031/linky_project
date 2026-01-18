// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mark_notification_read_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MarkNotificationReadResult {
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
    required TResult Function(MarkNotificationReadSuccess value) success,
    required TResult Function(MarkNotificationReadNetworkError value)
    networkError,
    required TResult Function(MarkNotificationReadServerError value)
    serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MarkNotificationReadSuccess value)? success,
    TResult? Function(MarkNotificationReadNetworkError value)? networkError,
    TResult? Function(MarkNotificationReadServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MarkNotificationReadSuccess value)? success,
    TResult Function(MarkNotificationReadNetworkError value)? networkError,
    TResult Function(MarkNotificationReadServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkNotificationReadResultCopyWith<$Res> {
  factory $MarkNotificationReadResultCopyWith(
    MarkNotificationReadResult value,
    $Res Function(MarkNotificationReadResult) then,
  ) =
      _$MarkNotificationReadResultCopyWithImpl<
        $Res,
        MarkNotificationReadResult
      >;
}

/// @nodoc
class _$MarkNotificationReadResultCopyWithImpl<
  $Res,
  $Val extends MarkNotificationReadResult
>
    implements $MarkNotificationReadResultCopyWith<$Res> {
  _$MarkNotificationReadResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarkNotificationReadResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MarkNotificationReadSuccessImplCopyWith<$Res> {
  factory _$$MarkNotificationReadSuccessImplCopyWith(
    _$MarkNotificationReadSuccessImpl value,
    $Res Function(_$MarkNotificationReadSuccessImpl) then,
  ) = __$$MarkNotificationReadSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkNotificationReadSuccessImplCopyWithImpl<$Res>
    extends
        _$MarkNotificationReadResultCopyWithImpl<
          $Res,
          _$MarkNotificationReadSuccessImpl
        >
    implements _$$MarkNotificationReadSuccessImplCopyWith<$Res> {
  __$$MarkNotificationReadSuccessImplCopyWithImpl(
    _$MarkNotificationReadSuccessImpl _value,
    $Res Function(_$MarkNotificationReadSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MarkNotificationReadResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MarkNotificationReadSuccessImpl implements MarkNotificationReadSuccess {
  const _$MarkNotificationReadSuccessImpl();

  @override
  String toString() {
    return 'MarkNotificationReadResult.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkNotificationReadSuccessImpl);
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
    required TResult Function(MarkNotificationReadSuccess value) success,
    required TResult Function(MarkNotificationReadNetworkError value)
    networkError,
    required TResult Function(MarkNotificationReadServerError value)
    serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MarkNotificationReadSuccess value)? success,
    TResult? Function(MarkNotificationReadNetworkError value)? networkError,
    TResult? Function(MarkNotificationReadServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MarkNotificationReadSuccess value)? success,
    TResult Function(MarkNotificationReadNetworkError value)? networkError,
    TResult Function(MarkNotificationReadServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class MarkNotificationReadSuccess
    implements MarkNotificationReadResult {
  const factory MarkNotificationReadSuccess() =
      _$MarkNotificationReadSuccessImpl;
}

/// @nodoc
abstract class _$$MarkNotificationReadNetworkErrorImplCopyWith<$Res> {
  factory _$$MarkNotificationReadNetworkErrorImplCopyWith(
    _$MarkNotificationReadNetworkErrorImpl value,
    $Res Function(_$MarkNotificationReadNetworkErrorImpl) then,
  ) = __$$MarkNotificationReadNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkNotificationReadNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$MarkNotificationReadResultCopyWithImpl<
          $Res,
          _$MarkNotificationReadNetworkErrorImpl
        >
    implements _$$MarkNotificationReadNetworkErrorImplCopyWith<$Res> {
  __$$MarkNotificationReadNetworkErrorImplCopyWithImpl(
    _$MarkNotificationReadNetworkErrorImpl _value,
    $Res Function(_$MarkNotificationReadNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MarkNotificationReadResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MarkNotificationReadNetworkErrorImpl
    implements MarkNotificationReadNetworkError {
  const _$MarkNotificationReadNetworkErrorImpl();

  @override
  String toString() {
    return 'MarkNotificationReadResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkNotificationReadNetworkErrorImpl);
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
    required TResult Function(MarkNotificationReadSuccess value) success,
    required TResult Function(MarkNotificationReadNetworkError value)
    networkError,
    required TResult Function(MarkNotificationReadServerError value)
    serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MarkNotificationReadSuccess value)? success,
    TResult? Function(MarkNotificationReadNetworkError value)? networkError,
    TResult? Function(MarkNotificationReadServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MarkNotificationReadSuccess value)? success,
    TResult Function(MarkNotificationReadNetworkError value)? networkError,
    TResult Function(MarkNotificationReadServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class MarkNotificationReadNetworkError
    implements MarkNotificationReadResult {
  const factory MarkNotificationReadNetworkError() =
      _$MarkNotificationReadNetworkErrorImpl;
}

/// @nodoc
abstract class _$$MarkNotificationReadServerErrorImplCopyWith<$Res> {
  factory _$$MarkNotificationReadServerErrorImplCopyWith(
    _$MarkNotificationReadServerErrorImpl value,
    $Res Function(_$MarkNotificationReadServerErrorImpl) then,
  ) = __$$MarkNotificationReadServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkNotificationReadServerErrorImplCopyWithImpl<$Res>
    extends
        _$MarkNotificationReadResultCopyWithImpl<
          $Res,
          _$MarkNotificationReadServerErrorImpl
        >
    implements _$$MarkNotificationReadServerErrorImplCopyWith<$Res> {
  __$$MarkNotificationReadServerErrorImplCopyWithImpl(
    _$MarkNotificationReadServerErrorImpl _value,
    $Res Function(_$MarkNotificationReadServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MarkNotificationReadResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MarkNotificationReadServerErrorImpl
    implements MarkNotificationReadServerError {
  const _$MarkNotificationReadServerErrorImpl();

  @override
  String toString() {
    return 'MarkNotificationReadResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkNotificationReadServerErrorImpl);
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
    required TResult Function(MarkNotificationReadSuccess value) success,
    required TResult Function(MarkNotificationReadNetworkError value)
    networkError,
    required TResult Function(MarkNotificationReadServerError value)
    serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MarkNotificationReadSuccess value)? success,
    TResult? Function(MarkNotificationReadNetworkError value)? networkError,
    TResult? Function(MarkNotificationReadServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MarkNotificationReadSuccess value)? success,
    TResult Function(MarkNotificationReadNetworkError value)? networkError,
    TResult Function(MarkNotificationReadServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class MarkNotificationReadServerError
    implements MarkNotificationReadResult {
  const factory MarkNotificationReadServerError() =
      _$MarkNotificationReadServerErrorImpl;
}
