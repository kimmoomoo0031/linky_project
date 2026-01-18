// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_home_me_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetHomeMeResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeUser user) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeUser user)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeUser user)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeMeSuccess value) success,
    required TResult Function(GetHomeMeNetworkError value) networkError,
    required TResult Function(GetHomeMeServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeMeSuccess value)? success,
    TResult? Function(GetHomeMeNetworkError value)? networkError,
    TResult? Function(GetHomeMeServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeMeSuccess value)? success,
    TResult Function(GetHomeMeNetworkError value)? networkError,
    TResult Function(GetHomeMeServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetHomeMeResultCopyWith<$Res> {
  factory $GetHomeMeResultCopyWith(
    GetHomeMeResult value,
    $Res Function(GetHomeMeResult) then,
  ) = _$GetHomeMeResultCopyWithImpl<$Res, GetHomeMeResult>;
}

/// @nodoc
class _$GetHomeMeResultCopyWithImpl<$Res, $Val extends GetHomeMeResult>
    implements $GetHomeMeResultCopyWith<$Res> {
  _$GetHomeMeResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetHomeMeResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetHomeMeSuccessImplCopyWith<$Res> {
  factory _$$GetHomeMeSuccessImplCopyWith(
    _$GetHomeMeSuccessImpl value,
    $Res Function(_$GetHomeMeSuccessImpl) then,
  ) = __$$GetHomeMeSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({HomeUser user});
}

/// @nodoc
class __$$GetHomeMeSuccessImplCopyWithImpl<$Res>
    extends _$GetHomeMeResultCopyWithImpl<$Res, _$GetHomeMeSuccessImpl>
    implements _$$GetHomeMeSuccessImplCopyWith<$Res> {
  __$$GetHomeMeSuccessImplCopyWithImpl(
    _$GetHomeMeSuccessImpl _value,
    $Res Function(_$GetHomeMeSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetHomeMeResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _$GetHomeMeSuccessImpl(
        null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as HomeUser,
      ),
    );
  }
}

/// @nodoc

class _$GetHomeMeSuccessImpl implements GetHomeMeSuccess {
  const _$GetHomeMeSuccessImpl(this.user);

  @override
  final HomeUser user;

  @override
  String toString() {
    return 'GetHomeMeResult.success(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHomeMeSuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of GetHomeMeResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetHomeMeSuccessImplCopyWith<_$GetHomeMeSuccessImpl> get copyWith =>
      __$$GetHomeMeSuccessImplCopyWithImpl<_$GetHomeMeSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeUser user) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeUser user)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeUser user)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeMeSuccess value) success,
    required TResult Function(GetHomeMeNetworkError value) networkError,
    required TResult Function(GetHomeMeServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeMeSuccess value)? success,
    TResult? Function(GetHomeMeNetworkError value)? networkError,
    TResult? Function(GetHomeMeServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeMeSuccess value)? success,
    TResult Function(GetHomeMeNetworkError value)? networkError,
    TResult Function(GetHomeMeServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetHomeMeSuccess implements GetHomeMeResult {
  const factory GetHomeMeSuccess(final HomeUser user) = _$GetHomeMeSuccessImpl;

  HomeUser get user;

  /// Create a copy of GetHomeMeResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetHomeMeSuccessImplCopyWith<_$GetHomeMeSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetHomeMeNetworkErrorImplCopyWith<$Res> {
  factory _$$GetHomeMeNetworkErrorImplCopyWith(
    _$GetHomeMeNetworkErrorImpl value,
    $Res Function(_$GetHomeMeNetworkErrorImpl) then,
  ) = __$$GetHomeMeNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHomeMeNetworkErrorImplCopyWithImpl<$Res>
    extends _$GetHomeMeResultCopyWithImpl<$Res, _$GetHomeMeNetworkErrorImpl>
    implements _$$GetHomeMeNetworkErrorImplCopyWith<$Res> {
  __$$GetHomeMeNetworkErrorImplCopyWithImpl(
    _$GetHomeMeNetworkErrorImpl _value,
    $Res Function(_$GetHomeMeNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetHomeMeResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetHomeMeNetworkErrorImpl implements GetHomeMeNetworkError {
  const _$GetHomeMeNetworkErrorImpl();

  @override
  String toString() {
    return 'GetHomeMeResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHomeMeNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeUser user) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeUser user)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeUser user)? success,
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
    required TResult Function(GetHomeMeSuccess value) success,
    required TResult Function(GetHomeMeNetworkError value) networkError,
    required TResult Function(GetHomeMeServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeMeSuccess value)? success,
    TResult? Function(GetHomeMeNetworkError value)? networkError,
    TResult? Function(GetHomeMeServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeMeSuccess value)? success,
    TResult Function(GetHomeMeNetworkError value)? networkError,
    TResult Function(GetHomeMeServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class GetHomeMeNetworkError implements GetHomeMeResult {
  const factory GetHomeMeNetworkError() = _$GetHomeMeNetworkErrorImpl;
}

/// @nodoc
abstract class _$$GetHomeMeServerErrorImplCopyWith<$Res> {
  factory _$$GetHomeMeServerErrorImplCopyWith(
    _$GetHomeMeServerErrorImpl value,
    $Res Function(_$GetHomeMeServerErrorImpl) then,
  ) = __$$GetHomeMeServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHomeMeServerErrorImplCopyWithImpl<$Res>
    extends _$GetHomeMeResultCopyWithImpl<$Res, _$GetHomeMeServerErrorImpl>
    implements _$$GetHomeMeServerErrorImplCopyWith<$Res> {
  __$$GetHomeMeServerErrorImplCopyWithImpl(
    _$GetHomeMeServerErrorImpl _value,
    $Res Function(_$GetHomeMeServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetHomeMeResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetHomeMeServerErrorImpl implements GetHomeMeServerError {
  const _$GetHomeMeServerErrorImpl();

  @override
  String toString() {
    return 'GetHomeMeResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHomeMeServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeUser user) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeUser user)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeUser user)? success,
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
    required TResult Function(GetHomeMeSuccess value) success,
    required TResult Function(GetHomeMeNetworkError value) networkError,
    required TResult Function(GetHomeMeServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeMeSuccess value)? success,
    TResult? Function(GetHomeMeNetworkError value)? networkError,
    TResult? Function(GetHomeMeServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeMeSuccess value)? success,
    TResult Function(GetHomeMeNetworkError value)? networkError,
    TResult Function(GetHomeMeServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class GetHomeMeServerError implements GetHomeMeResult {
  const factory GetHomeMeServerError() = _$GetHomeMeServerErrorImpl;
}
