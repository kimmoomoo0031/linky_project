// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_lounge_info_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetLoungeInfoResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungeInfo info) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungeInfo info)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungeInfo info)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetLoungeInfoSuccess value) success,
    required TResult Function(GetLoungeInfoNetworkError value) networkError,
    required TResult Function(GetLoungeInfoServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoungeInfoSuccess value)? success,
    TResult? Function(GetLoungeInfoNetworkError value)? networkError,
    TResult? Function(GetLoungeInfoServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoungeInfoSuccess value)? success,
    TResult Function(GetLoungeInfoNetworkError value)? networkError,
    TResult Function(GetLoungeInfoServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLoungeInfoResultCopyWith<$Res> {
  factory $GetLoungeInfoResultCopyWith(
    GetLoungeInfoResult value,
    $Res Function(GetLoungeInfoResult) then,
  ) = _$GetLoungeInfoResultCopyWithImpl<$Res, GetLoungeInfoResult>;
}

/// @nodoc
class _$GetLoungeInfoResultCopyWithImpl<$Res, $Val extends GetLoungeInfoResult>
    implements $GetLoungeInfoResultCopyWith<$Res> {
  _$GetLoungeInfoResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetLoungeInfoResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetLoungeInfoSuccessImplCopyWith<$Res> {
  factory _$$GetLoungeInfoSuccessImplCopyWith(
    _$GetLoungeInfoSuccessImpl value,
    $Res Function(_$GetLoungeInfoSuccessImpl) then,
  ) = __$$GetLoungeInfoSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoungeInfo info});
}

/// @nodoc
class __$$GetLoungeInfoSuccessImplCopyWithImpl<$Res>
    extends _$GetLoungeInfoResultCopyWithImpl<$Res, _$GetLoungeInfoSuccessImpl>
    implements _$$GetLoungeInfoSuccessImplCopyWith<$Res> {
  __$$GetLoungeInfoSuccessImplCopyWithImpl(
    _$GetLoungeInfoSuccessImpl _value,
    $Res Function(_$GetLoungeInfoSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetLoungeInfoResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? info = null}) {
    return _then(
      _$GetLoungeInfoSuccessImpl(
        null == info
            ? _value.info
            : info // ignore: cast_nullable_to_non_nullable
                  as LoungeInfo,
      ),
    );
  }
}

/// @nodoc

class _$GetLoungeInfoSuccessImpl implements GetLoungeInfoSuccess {
  const _$GetLoungeInfoSuccessImpl(this.info);

  @override
  final LoungeInfo info;

  @override
  String toString() {
    return 'GetLoungeInfoResult.success(info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoungeInfoSuccessImpl &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info);

  /// Create a copy of GetLoungeInfoResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLoungeInfoSuccessImplCopyWith<_$GetLoungeInfoSuccessImpl>
  get copyWith =>
      __$$GetLoungeInfoSuccessImplCopyWithImpl<_$GetLoungeInfoSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungeInfo info) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success(info);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungeInfo info)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call(info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungeInfo info)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(info);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetLoungeInfoSuccess value) success,
    required TResult Function(GetLoungeInfoNetworkError value) networkError,
    required TResult Function(GetLoungeInfoServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoungeInfoSuccess value)? success,
    TResult? Function(GetLoungeInfoNetworkError value)? networkError,
    TResult? Function(GetLoungeInfoServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoungeInfoSuccess value)? success,
    TResult Function(GetLoungeInfoNetworkError value)? networkError,
    TResult Function(GetLoungeInfoServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetLoungeInfoSuccess implements GetLoungeInfoResult {
  const factory GetLoungeInfoSuccess(final LoungeInfo info) =
      _$GetLoungeInfoSuccessImpl;

  LoungeInfo get info;

  /// Create a copy of GetLoungeInfoResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetLoungeInfoSuccessImplCopyWith<_$GetLoungeInfoSuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetLoungeInfoNetworkErrorImplCopyWith<$Res> {
  factory _$$GetLoungeInfoNetworkErrorImplCopyWith(
    _$GetLoungeInfoNetworkErrorImpl value,
    $Res Function(_$GetLoungeInfoNetworkErrorImpl) then,
  ) = __$$GetLoungeInfoNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLoungeInfoNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$GetLoungeInfoResultCopyWithImpl<$Res, _$GetLoungeInfoNetworkErrorImpl>
    implements _$$GetLoungeInfoNetworkErrorImplCopyWith<$Res> {
  __$$GetLoungeInfoNetworkErrorImplCopyWithImpl(
    _$GetLoungeInfoNetworkErrorImpl _value,
    $Res Function(_$GetLoungeInfoNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetLoungeInfoResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetLoungeInfoNetworkErrorImpl implements GetLoungeInfoNetworkError {
  const _$GetLoungeInfoNetworkErrorImpl();

  @override
  String toString() {
    return 'GetLoungeInfoResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoungeInfoNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungeInfo info) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungeInfo info)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungeInfo info)? success,
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
    required TResult Function(GetLoungeInfoSuccess value) success,
    required TResult Function(GetLoungeInfoNetworkError value) networkError,
    required TResult Function(GetLoungeInfoServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoungeInfoSuccess value)? success,
    TResult? Function(GetLoungeInfoNetworkError value)? networkError,
    TResult? Function(GetLoungeInfoServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoungeInfoSuccess value)? success,
    TResult Function(GetLoungeInfoNetworkError value)? networkError,
    TResult Function(GetLoungeInfoServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class GetLoungeInfoNetworkError implements GetLoungeInfoResult {
  const factory GetLoungeInfoNetworkError() = _$GetLoungeInfoNetworkErrorImpl;
}

/// @nodoc
abstract class _$$GetLoungeInfoServerErrorImplCopyWith<$Res> {
  factory _$$GetLoungeInfoServerErrorImplCopyWith(
    _$GetLoungeInfoServerErrorImpl value,
    $Res Function(_$GetLoungeInfoServerErrorImpl) then,
  ) = __$$GetLoungeInfoServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLoungeInfoServerErrorImplCopyWithImpl<$Res>
    extends
        _$GetLoungeInfoResultCopyWithImpl<$Res, _$GetLoungeInfoServerErrorImpl>
    implements _$$GetLoungeInfoServerErrorImplCopyWith<$Res> {
  __$$GetLoungeInfoServerErrorImplCopyWithImpl(
    _$GetLoungeInfoServerErrorImpl _value,
    $Res Function(_$GetLoungeInfoServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetLoungeInfoResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetLoungeInfoServerErrorImpl implements GetLoungeInfoServerError {
  const _$GetLoungeInfoServerErrorImpl();

  @override
  String toString() {
    return 'GetLoungeInfoResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoungeInfoServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungeInfo info) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungeInfo info)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungeInfo info)? success,
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
    required TResult Function(GetLoungeInfoSuccess value) success,
    required TResult Function(GetLoungeInfoNetworkError value) networkError,
    required TResult Function(GetLoungeInfoServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoungeInfoSuccess value)? success,
    TResult? Function(GetLoungeInfoNetworkError value)? networkError,
    TResult? Function(GetLoungeInfoServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoungeInfoSuccess value)? success,
    TResult Function(GetLoungeInfoNetworkError value)? networkError,
    TResult Function(GetLoungeInfoServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class GetLoungeInfoServerError implements GetLoungeInfoResult {
  const factory GetLoungeInfoServerError() = _$GetLoungeInfoServerErrorImpl;
}
