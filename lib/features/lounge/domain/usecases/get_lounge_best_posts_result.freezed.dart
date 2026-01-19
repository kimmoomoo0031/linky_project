// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_lounge_best_posts_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetLoungeBestPostsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungePostPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungePostPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungePostPage page)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetLoungeBestPostsSuccess value) success,
    required TResult Function(GetLoungeBestPostsNetworkError value)
    networkError,
    required TResult Function(GetLoungeBestPostsServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoungeBestPostsSuccess value)? success,
    TResult? Function(GetLoungeBestPostsNetworkError value)? networkError,
    TResult? Function(GetLoungeBestPostsServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoungeBestPostsSuccess value)? success,
    TResult Function(GetLoungeBestPostsNetworkError value)? networkError,
    TResult Function(GetLoungeBestPostsServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLoungeBestPostsResultCopyWith<$Res> {
  factory $GetLoungeBestPostsResultCopyWith(
    GetLoungeBestPostsResult value,
    $Res Function(GetLoungeBestPostsResult) then,
  ) = _$GetLoungeBestPostsResultCopyWithImpl<$Res, GetLoungeBestPostsResult>;
}

/// @nodoc
class _$GetLoungeBestPostsResultCopyWithImpl<
  $Res,
  $Val extends GetLoungeBestPostsResult
>
    implements $GetLoungeBestPostsResultCopyWith<$Res> {
  _$GetLoungeBestPostsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetLoungeBestPostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetLoungeBestPostsSuccessImplCopyWith<$Res> {
  factory _$$GetLoungeBestPostsSuccessImplCopyWith(
    _$GetLoungeBestPostsSuccessImpl value,
    $Res Function(_$GetLoungeBestPostsSuccessImpl) then,
  ) = __$$GetLoungeBestPostsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoungePostPage page});
}

/// @nodoc
class __$$GetLoungeBestPostsSuccessImplCopyWithImpl<$Res>
    extends
        _$GetLoungeBestPostsResultCopyWithImpl<
          $Res,
          _$GetLoungeBestPostsSuccessImpl
        >
    implements _$$GetLoungeBestPostsSuccessImplCopyWith<$Res> {
  __$$GetLoungeBestPostsSuccessImplCopyWithImpl(
    _$GetLoungeBestPostsSuccessImpl _value,
    $Res Function(_$GetLoungeBestPostsSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetLoungeBestPostsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? page = null}) {
    return _then(
      _$GetLoungeBestPostsSuccessImpl(
        null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as LoungePostPage,
      ),
    );
  }
}

/// @nodoc

class _$GetLoungeBestPostsSuccessImpl implements GetLoungeBestPostsSuccess {
  const _$GetLoungeBestPostsSuccessImpl(this.page);

  @override
  final LoungePostPage page;

  @override
  String toString() {
    return 'GetLoungeBestPostsResult.success(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoungeBestPostsSuccessImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  /// Create a copy of GetLoungeBestPostsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLoungeBestPostsSuccessImplCopyWith<_$GetLoungeBestPostsSuccessImpl>
  get copyWith =>
      __$$GetLoungeBestPostsSuccessImplCopyWithImpl<
        _$GetLoungeBestPostsSuccessImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungePostPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungePostPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungePostPage page)? success,
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
    required TResult Function(GetLoungeBestPostsSuccess value) success,
    required TResult Function(GetLoungeBestPostsNetworkError value)
    networkError,
    required TResult Function(GetLoungeBestPostsServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoungeBestPostsSuccess value)? success,
    TResult? Function(GetLoungeBestPostsNetworkError value)? networkError,
    TResult? Function(GetLoungeBestPostsServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoungeBestPostsSuccess value)? success,
    TResult Function(GetLoungeBestPostsNetworkError value)? networkError,
    TResult Function(GetLoungeBestPostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetLoungeBestPostsSuccess implements GetLoungeBestPostsResult {
  const factory GetLoungeBestPostsSuccess(final LoungePostPage page) =
      _$GetLoungeBestPostsSuccessImpl;

  LoungePostPage get page;

  /// Create a copy of GetLoungeBestPostsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetLoungeBestPostsSuccessImplCopyWith<_$GetLoungeBestPostsSuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetLoungeBestPostsNetworkErrorImplCopyWith<$Res> {
  factory _$$GetLoungeBestPostsNetworkErrorImplCopyWith(
    _$GetLoungeBestPostsNetworkErrorImpl value,
    $Res Function(_$GetLoungeBestPostsNetworkErrorImpl) then,
  ) = __$$GetLoungeBestPostsNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLoungeBestPostsNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$GetLoungeBestPostsResultCopyWithImpl<
          $Res,
          _$GetLoungeBestPostsNetworkErrorImpl
        >
    implements _$$GetLoungeBestPostsNetworkErrorImplCopyWith<$Res> {
  __$$GetLoungeBestPostsNetworkErrorImplCopyWithImpl(
    _$GetLoungeBestPostsNetworkErrorImpl _value,
    $Res Function(_$GetLoungeBestPostsNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetLoungeBestPostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetLoungeBestPostsNetworkErrorImpl
    implements GetLoungeBestPostsNetworkError {
  const _$GetLoungeBestPostsNetworkErrorImpl();

  @override
  String toString() {
    return 'GetLoungeBestPostsResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoungeBestPostsNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungePostPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungePostPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungePostPage page)? success,
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
    required TResult Function(GetLoungeBestPostsSuccess value) success,
    required TResult Function(GetLoungeBestPostsNetworkError value)
    networkError,
    required TResult Function(GetLoungeBestPostsServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoungeBestPostsSuccess value)? success,
    TResult? Function(GetLoungeBestPostsNetworkError value)? networkError,
    TResult? Function(GetLoungeBestPostsServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoungeBestPostsSuccess value)? success,
    TResult Function(GetLoungeBestPostsNetworkError value)? networkError,
    TResult Function(GetLoungeBestPostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class GetLoungeBestPostsNetworkError
    implements GetLoungeBestPostsResult {
  const factory GetLoungeBestPostsNetworkError() =
      _$GetLoungeBestPostsNetworkErrorImpl;
}

/// @nodoc
abstract class _$$GetLoungeBestPostsServerErrorImplCopyWith<$Res> {
  factory _$$GetLoungeBestPostsServerErrorImplCopyWith(
    _$GetLoungeBestPostsServerErrorImpl value,
    $Res Function(_$GetLoungeBestPostsServerErrorImpl) then,
  ) = __$$GetLoungeBestPostsServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLoungeBestPostsServerErrorImplCopyWithImpl<$Res>
    extends
        _$GetLoungeBestPostsResultCopyWithImpl<
          $Res,
          _$GetLoungeBestPostsServerErrorImpl
        >
    implements _$$GetLoungeBestPostsServerErrorImplCopyWith<$Res> {
  __$$GetLoungeBestPostsServerErrorImplCopyWithImpl(
    _$GetLoungeBestPostsServerErrorImpl _value,
    $Res Function(_$GetLoungeBestPostsServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetLoungeBestPostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetLoungeBestPostsServerErrorImpl
    implements GetLoungeBestPostsServerError {
  const _$GetLoungeBestPostsServerErrorImpl();

  @override
  String toString() {
    return 'GetLoungeBestPostsResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoungeBestPostsServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungePostPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungePostPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungePostPage page)? success,
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
    required TResult Function(GetLoungeBestPostsSuccess value) success,
    required TResult Function(GetLoungeBestPostsNetworkError value)
    networkError,
    required TResult Function(GetLoungeBestPostsServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoungeBestPostsSuccess value)? success,
    TResult? Function(GetLoungeBestPostsNetworkError value)? networkError,
    TResult? Function(GetLoungeBestPostsServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoungeBestPostsSuccess value)? success,
    TResult Function(GetLoungeBestPostsNetworkError value)? networkError,
    TResult Function(GetLoungeBestPostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class GetLoungeBestPostsServerError
    implements GetLoungeBestPostsResult {
  const factory GetLoungeBestPostsServerError() =
      _$GetLoungeBestPostsServerErrorImpl;
}
