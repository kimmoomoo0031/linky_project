// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_latest_viewed_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetLatestViewedResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungePreviewPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungePreviewPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungePreviewPage page)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetLatestViewedSuccess value) success,
    required TResult Function(GetLatestViewedNetworkError value) networkError,
    required TResult Function(GetLatestViewedServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLatestViewedSuccess value)? success,
    TResult? Function(GetLatestViewedNetworkError value)? networkError,
    TResult? Function(GetLatestViewedServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLatestViewedSuccess value)? success,
    TResult Function(GetLatestViewedNetworkError value)? networkError,
    TResult Function(GetLatestViewedServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLatestViewedResultCopyWith<$Res> {
  factory $GetLatestViewedResultCopyWith(
    GetLatestViewedResult value,
    $Res Function(GetLatestViewedResult) then,
  ) = _$GetLatestViewedResultCopyWithImpl<$Res, GetLatestViewedResult>;
}

/// @nodoc
class _$GetLatestViewedResultCopyWithImpl<
  $Res,
  $Val extends GetLatestViewedResult
>
    implements $GetLatestViewedResultCopyWith<$Res> {
  _$GetLatestViewedResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetLatestViewedResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetLatestViewedSuccessImplCopyWith<$Res> {
  factory _$$GetLatestViewedSuccessImplCopyWith(
    _$GetLatestViewedSuccessImpl value,
    $Res Function(_$GetLatestViewedSuccessImpl) then,
  ) = __$$GetLatestViewedSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoungePreviewPage page});
}

/// @nodoc
class __$$GetLatestViewedSuccessImplCopyWithImpl<$Res>
    extends
        _$GetLatestViewedResultCopyWithImpl<$Res, _$GetLatestViewedSuccessImpl>
    implements _$$GetLatestViewedSuccessImplCopyWith<$Res> {
  __$$GetLatestViewedSuccessImplCopyWithImpl(
    _$GetLatestViewedSuccessImpl _value,
    $Res Function(_$GetLatestViewedSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetLatestViewedResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? page = null}) {
    return _then(
      _$GetLatestViewedSuccessImpl(
        null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as LoungePreviewPage,
      ),
    );
  }
}

/// @nodoc

class _$GetLatestViewedSuccessImpl implements GetLatestViewedSuccess {
  const _$GetLatestViewedSuccessImpl(this.page);

  @override
  final LoungePreviewPage page;

  @override
  String toString() {
    return 'GetLatestViewedResult.success(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLatestViewedSuccessImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  /// Create a copy of GetLatestViewedResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLatestViewedSuccessImplCopyWith<_$GetLatestViewedSuccessImpl>
  get copyWith =>
      __$$GetLatestViewedSuccessImplCopyWithImpl<_$GetLatestViewedSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungePreviewPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungePreviewPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungePreviewPage page)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetLatestViewedSuccess value) success,
    required TResult Function(GetLatestViewedNetworkError value) networkError,
    required TResult Function(GetLatestViewedServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLatestViewedSuccess value)? success,
    TResult? Function(GetLatestViewedNetworkError value)? networkError,
    TResult? Function(GetLatestViewedServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLatestViewedSuccess value)? success,
    TResult Function(GetLatestViewedNetworkError value)? networkError,
    TResult Function(GetLatestViewedServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetLatestViewedSuccess implements GetLatestViewedResult {
  const factory GetLatestViewedSuccess(final LoungePreviewPage page) =
      _$GetLatestViewedSuccessImpl;

  LoungePreviewPage get page;

  /// Create a copy of GetLatestViewedResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetLatestViewedSuccessImplCopyWith<_$GetLatestViewedSuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetLatestViewedNetworkErrorImplCopyWith<$Res> {
  factory _$$GetLatestViewedNetworkErrorImplCopyWith(
    _$GetLatestViewedNetworkErrorImpl value,
    $Res Function(_$GetLatestViewedNetworkErrorImpl) then,
  ) = __$$GetLatestViewedNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLatestViewedNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$GetLatestViewedResultCopyWithImpl<
          $Res,
          _$GetLatestViewedNetworkErrorImpl
        >
    implements _$$GetLatestViewedNetworkErrorImplCopyWith<$Res> {
  __$$GetLatestViewedNetworkErrorImplCopyWithImpl(
    _$GetLatestViewedNetworkErrorImpl _value,
    $Res Function(_$GetLatestViewedNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetLatestViewedResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetLatestViewedNetworkErrorImpl implements GetLatestViewedNetworkError {
  const _$GetLatestViewedNetworkErrorImpl();

  @override
  String toString() {
    return 'GetLatestViewedResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLatestViewedNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungePreviewPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungePreviewPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungePreviewPage page)? success,
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
    required TResult Function(GetLatestViewedSuccess value) success,
    required TResult Function(GetLatestViewedNetworkError value) networkError,
    required TResult Function(GetLatestViewedServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLatestViewedSuccess value)? success,
    TResult? Function(GetLatestViewedNetworkError value)? networkError,
    TResult? Function(GetLatestViewedServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLatestViewedSuccess value)? success,
    TResult Function(GetLatestViewedNetworkError value)? networkError,
    TResult Function(GetLatestViewedServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class GetLatestViewedNetworkError implements GetLatestViewedResult {
  const factory GetLatestViewedNetworkError() =
      _$GetLatestViewedNetworkErrorImpl;
}

/// @nodoc
abstract class _$$GetLatestViewedServerErrorImplCopyWith<$Res> {
  factory _$$GetLatestViewedServerErrorImplCopyWith(
    _$GetLatestViewedServerErrorImpl value,
    $Res Function(_$GetLatestViewedServerErrorImpl) then,
  ) = __$$GetLatestViewedServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLatestViewedServerErrorImplCopyWithImpl<$Res>
    extends
        _$GetLatestViewedResultCopyWithImpl<
          $Res,
          _$GetLatestViewedServerErrorImpl
        >
    implements _$$GetLatestViewedServerErrorImplCopyWith<$Res> {
  __$$GetLatestViewedServerErrorImplCopyWithImpl(
    _$GetLatestViewedServerErrorImpl _value,
    $Res Function(_$GetLatestViewedServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetLatestViewedResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetLatestViewedServerErrorImpl implements GetLatestViewedServerError {
  const _$GetLatestViewedServerErrorImpl();

  @override
  String toString() {
    return 'GetLatestViewedResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLatestViewedServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungePreviewPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungePreviewPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungePreviewPage page)? success,
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
    required TResult Function(GetLatestViewedSuccess value) success,
    required TResult Function(GetLatestViewedNetworkError value) networkError,
    required TResult Function(GetLatestViewedServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLatestViewedSuccess value)? success,
    TResult? Function(GetLatestViewedNetworkError value)? networkError,
    TResult? Function(GetLatestViewedServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLatestViewedSuccess value)? success,
    TResult Function(GetLatestViewedNetworkError value)? networkError,
    TResult Function(GetLatestViewedServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class GetLatestViewedServerError implements GetLatestViewedResult {
  const factory GetLatestViewedServerError() = _$GetLatestViewedServerErrorImpl;
}
