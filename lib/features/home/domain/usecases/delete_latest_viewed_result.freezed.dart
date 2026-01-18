// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_latest_viewed_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DeleteLatestViewedResult {
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
    required TResult Function(DeleteLatestViewedSuccess value) success,
    required TResult Function(DeleteLatestViewedNetworkError value)
    networkError,
    required TResult Function(DeleteLatestViewedServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteLatestViewedSuccess value)? success,
    TResult? Function(DeleteLatestViewedNetworkError value)? networkError,
    TResult? Function(DeleteLatestViewedServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteLatestViewedSuccess value)? success,
    TResult Function(DeleteLatestViewedNetworkError value)? networkError,
    TResult Function(DeleteLatestViewedServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteLatestViewedResultCopyWith<$Res> {
  factory $DeleteLatestViewedResultCopyWith(
    DeleteLatestViewedResult value,
    $Res Function(DeleteLatestViewedResult) then,
  ) = _$DeleteLatestViewedResultCopyWithImpl<$Res, DeleteLatestViewedResult>;
}

/// @nodoc
class _$DeleteLatestViewedResultCopyWithImpl<
  $Res,
  $Val extends DeleteLatestViewedResult
>
    implements $DeleteLatestViewedResultCopyWith<$Res> {
  _$DeleteLatestViewedResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteLatestViewedResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DeleteLatestViewedSuccessImplCopyWith<$Res> {
  factory _$$DeleteLatestViewedSuccessImplCopyWith(
    _$DeleteLatestViewedSuccessImpl value,
    $Res Function(_$DeleteLatestViewedSuccessImpl) then,
  ) = __$$DeleteLatestViewedSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteLatestViewedSuccessImplCopyWithImpl<$Res>
    extends
        _$DeleteLatestViewedResultCopyWithImpl<
          $Res,
          _$DeleteLatestViewedSuccessImpl
        >
    implements _$$DeleteLatestViewedSuccessImplCopyWith<$Res> {
  __$$DeleteLatestViewedSuccessImplCopyWithImpl(
    _$DeleteLatestViewedSuccessImpl _value,
    $Res Function(_$DeleteLatestViewedSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeleteLatestViewedResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteLatestViewedSuccessImpl implements DeleteLatestViewedSuccess {
  const _$DeleteLatestViewedSuccessImpl();

  @override
  String toString() {
    return 'DeleteLatestViewedResult.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteLatestViewedSuccessImpl);
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
    required TResult Function(DeleteLatestViewedSuccess value) success,
    required TResult Function(DeleteLatestViewedNetworkError value)
    networkError,
    required TResult Function(DeleteLatestViewedServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteLatestViewedSuccess value)? success,
    TResult? Function(DeleteLatestViewedNetworkError value)? networkError,
    TResult? Function(DeleteLatestViewedServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteLatestViewedSuccess value)? success,
    TResult Function(DeleteLatestViewedNetworkError value)? networkError,
    TResult Function(DeleteLatestViewedServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class DeleteLatestViewedSuccess implements DeleteLatestViewedResult {
  const factory DeleteLatestViewedSuccess() = _$DeleteLatestViewedSuccessImpl;
}

/// @nodoc
abstract class _$$DeleteLatestViewedNetworkErrorImplCopyWith<$Res> {
  factory _$$DeleteLatestViewedNetworkErrorImplCopyWith(
    _$DeleteLatestViewedNetworkErrorImpl value,
    $Res Function(_$DeleteLatestViewedNetworkErrorImpl) then,
  ) = __$$DeleteLatestViewedNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteLatestViewedNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$DeleteLatestViewedResultCopyWithImpl<
          $Res,
          _$DeleteLatestViewedNetworkErrorImpl
        >
    implements _$$DeleteLatestViewedNetworkErrorImplCopyWith<$Res> {
  __$$DeleteLatestViewedNetworkErrorImplCopyWithImpl(
    _$DeleteLatestViewedNetworkErrorImpl _value,
    $Res Function(_$DeleteLatestViewedNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeleteLatestViewedResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteLatestViewedNetworkErrorImpl
    implements DeleteLatestViewedNetworkError {
  const _$DeleteLatestViewedNetworkErrorImpl();

  @override
  String toString() {
    return 'DeleteLatestViewedResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteLatestViewedNetworkErrorImpl);
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
    required TResult Function(DeleteLatestViewedSuccess value) success,
    required TResult Function(DeleteLatestViewedNetworkError value)
    networkError,
    required TResult Function(DeleteLatestViewedServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteLatestViewedSuccess value)? success,
    TResult? Function(DeleteLatestViewedNetworkError value)? networkError,
    TResult? Function(DeleteLatestViewedServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteLatestViewedSuccess value)? success,
    TResult Function(DeleteLatestViewedNetworkError value)? networkError,
    TResult Function(DeleteLatestViewedServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class DeleteLatestViewedNetworkError
    implements DeleteLatestViewedResult {
  const factory DeleteLatestViewedNetworkError() =
      _$DeleteLatestViewedNetworkErrorImpl;
}

/// @nodoc
abstract class _$$DeleteLatestViewedServerErrorImplCopyWith<$Res> {
  factory _$$DeleteLatestViewedServerErrorImplCopyWith(
    _$DeleteLatestViewedServerErrorImpl value,
    $Res Function(_$DeleteLatestViewedServerErrorImpl) then,
  ) = __$$DeleteLatestViewedServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteLatestViewedServerErrorImplCopyWithImpl<$Res>
    extends
        _$DeleteLatestViewedResultCopyWithImpl<
          $Res,
          _$DeleteLatestViewedServerErrorImpl
        >
    implements _$$DeleteLatestViewedServerErrorImplCopyWith<$Res> {
  __$$DeleteLatestViewedServerErrorImplCopyWithImpl(
    _$DeleteLatestViewedServerErrorImpl _value,
    $Res Function(_$DeleteLatestViewedServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeleteLatestViewedResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteLatestViewedServerErrorImpl
    implements DeleteLatestViewedServerError {
  const _$DeleteLatestViewedServerErrorImpl();

  @override
  String toString() {
    return 'DeleteLatestViewedResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteLatestViewedServerErrorImpl);
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
    required TResult Function(DeleteLatestViewedSuccess value) success,
    required TResult Function(DeleteLatestViewedNetworkError value)
    networkError,
    required TResult Function(DeleteLatestViewedServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteLatestViewedSuccess value)? success,
    TResult? Function(DeleteLatestViewedNetworkError value)? networkError,
    TResult? Function(DeleteLatestViewedServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteLatestViewedSuccess value)? success,
    TResult Function(DeleteLatestViewedNetworkError value)? networkError,
    TResult Function(DeleteLatestViewedServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class DeleteLatestViewedServerError
    implements DeleteLatestViewedResult {
  const factory DeleteLatestViewedServerError() =
      _$DeleteLatestViewedServerErrorImpl;
}
