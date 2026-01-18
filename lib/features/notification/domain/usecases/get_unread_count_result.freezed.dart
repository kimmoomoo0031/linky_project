// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_unread_count_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetUnreadCountResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int count) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int count)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int count)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUnreadCountSuccess value) success,
    required TResult Function(GetUnreadCountNetworkError value) networkError,
    required TResult Function(GetUnreadCountServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUnreadCountSuccess value)? success,
    TResult? Function(GetUnreadCountNetworkError value)? networkError,
    TResult? Function(GetUnreadCountServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUnreadCountSuccess value)? success,
    TResult Function(GetUnreadCountNetworkError value)? networkError,
    TResult Function(GetUnreadCountServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUnreadCountResultCopyWith<$Res> {
  factory $GetUnreadCountResultCopyWith(
    GetUnreadCountResult value,
    $Res Function(GetUnreadCountResult) then,
  ) = _$GetUnreadCountResultCopyWithImpl<$Res, GetUnreadCountResult>;
}

/// @nodoc
class _$GetUnreadCountResultCopyWithImpl<
  $Res,
  $Val extends GetUnreadCountResult
>
    implements $GetUnreadCountResultCopyWith<$Res> {
  _$GetUnreadCountResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetUnreadCountResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetUnreadCountSuccessImplCopyWith<$Res> {
  factory _$$GetUnreadCountSuccessImplCopyWith(
    _$GetUnreadCountSuccessImpl value,
    $Res Function(_$GetUnreadCountSuccessImpl) then,
  ) = __$$GetUnreadCountSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$GetUnreadCountSuccessImplCopyWithImpl<$Res>
    extends
        _$GetUnreadCountResultCopyWithImpl<$Res, _$GetUnreadCountSuccessImpl>
    implements _$$GetUnreadCountSuccessImplCopyWith<$Res> {
  __$$GetUnreadCountSuccessImplCopyWithImpl(
    _$GetUnreadCountSuccessImpl _value,
    $Res Function(_$GetUnreadCountSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetUnreadCountResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? count = null}) {
    return _then(
      _$GetUnreadCountSuccessImpl(
        null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$GetUnreadCountSuccessImpl implements GetUnreadCountSuccess {
  const _$GetUnreadCountSuccessImpl(this.count);

  @override
  final int count;

  @override
  String toString() {
    return 'GetUnreadCountResult.success(count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUnreadCountSuccessImpl &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  /// Create a copy of GetUnreadCountResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUnreadCountSuccessImplCopyWith<_$GetUnreadCountSuccessImpl>
  get copyWith =>
      __$$GetUnreadCountSuccessImplCopyWithImpl<_$GetUnreadCountSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int count) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int count)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int count)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUnreadCountSuccess value) success,
    required TResult Function(GetUnreadCountNetworkError value) networkError,
    required TResult Function(GetUnreadCountServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUnreadCountSuccess value)? success,
    TResult? Function(GetUnreadCountNetworkError value)? networkError,
    TResult? Function(GetUnreadCountServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUnreadCountSuccess value)? success,
    TResult Function(GetUnreadCountNetworkError value)? networkError,
    TResult Function(GetUnreadCountServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetUnreadCountSuccess implements GetUnreadCountResult {
  const factory GetUnreadCountSuccess(final int count) =
      _$GetUnreadCountSuccessImpl;

  int get count;

  /// Create a copy of GetUnreadCountResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUnreadCountSuccessImplCopyWith<_$GetUnreadCountSuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUnreadCountNetworkErrorImplCopyWith<$Res> {
  factory _$$GetUnreadCountNetworkErrorImplCopyWith(
    _$GetUnreadCountNetworkErrorImpl value,
    $Res Function(_$GetUnreadCountNetworkErrorImpl) then,
  ) = __$$GetUnreadCountNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUnreadCountNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$GetUnreadCountResultCopyWithImpl<
          $Res,
          _$GetUnreadCountNetworkErrorImpl
        >
    implements _$$GetUnreadCountNetworkErrorImplCopyWith<$Res> {
  __$$GetUnreadCountNetworkErrorImplCopyWithImpl(
    _$GetUnreadCountNetworkErrorImpl _value,
    $Res Function(_$GetUnreadCountNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetUnreadCountResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetUnreadCountNetworkErrorImpl implements GetUnreadCountNetworkError {
  const _$GetUnreadCountNetworkErrorImpl();

  @override
  String toString() {
    return 'GetUnreadCountResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUnreadCountNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int count) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int count)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int count)? success,
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
    required TResult Function(GetUnreadCountSuccess value) success,
    required TResult Function(GetUnreadCountNetworkError value) networkError,
    required TResult Function(GetUnreadCountServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUnreadCountSuccess value)? success,
    TResult? Function(GetUnreadCountNetworkError value)? networkError,
    TResult? Function(GetUnreadCountServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUnreadCountSuccess value)? success,
    TResult Function(GetUnreadCountNetworkError value)? networkError,
    TResult Function(GetUnreadCountServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class GetUnreadCountNetworkError implements GetUnreadCountResult {
  const factory GetUnreadCountNetworkError() = _$GetUnreadCountNetworkErrorImpl;
}

/// @nodoc
abstract class _$$GetUnreadCountServerErrorImplCopyWith<$Res> {
  factory _$$GetUnreadCountServerErrorImplCopyWith(
    _$GetUnreadCountServerErrorImpl value,
    $Res Function(_$GetUnreadCountServerErrorImpl) then,
  ) = __$$GetUnreadCountServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUnreadCountServerErrorImplCopyWithImpl<$Res>
    extends
        _$GetUnreadCountResultCopyWithImpl<
          $Res,
          _$GetUnreadCountServerErrorImpl
        >
    implements _$$GetUnreadCountServerErrorImplCopyWith<$Res> {
  __$$GetUnreadCountServerErrorImplCopyWithImpl(
    _$GetUnreadCountServerErrorImpl _value,
    $Res Function(_$GetUnreadCountServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetUnreadCountResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetUnreadCountServerErrorImpl implements GetUnreadCountServerError {
  const _$GetUnreadCountServerErrorImpl();

  @override
  String toString() {
    return 'GetUnreadCountResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUnreadCountServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int count) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int count)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int count)? success,
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
    required TResult Function(GetUnreadCountSuccess value) success,
    required TResult Function(GetUnreadCountNetworkError value) networkError,
    required TResult Function(GetUnreadCountServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUnreadCountSuccess value)? success,
    TResult? Function(GetUnreadCountNetworkError value)? networkError,
    TResult? Function(GetUnreadCountServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUnreadCountSuccess value)? success,
    TResult Function(GetUnreadCountNetworkError value)? networkError,
    TResult Function(GetUnreadCountServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class GetUnreadCountServerError implements GetUnreadCountResult {
  const factory GetUnreadCountServerError() = _$GetUnreadCountServerErrorImpl;
}
