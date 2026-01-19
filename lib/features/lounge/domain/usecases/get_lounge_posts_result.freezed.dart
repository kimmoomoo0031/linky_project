// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_lounge_posts_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetLoungePostsResult {
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
    required TResult Function(GetLoungePostsSuccess value) success,
    required TResult Function(GetLoungePostsNetworkError value) networkError,
    required TResult Function(GetLoungePostsServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoungePostsSuccess value)? success,
    TResult? Function(GetLoungePostsNetworkError value)? networkError,
    TResult? Function(GetLoungePostsServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoungePostsSuccess value)? success,
    TResult Function(GetLoungePostsNetworkError value)? networkError,
    TResult Function(GetLoungePostsServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLoungePostsResultCopyWith<$Res> {
  factory $GetLoungePostsResultCopyWith(
    GetLoungePostsResult value,
    $Res Function(GetLoungePostsResult) then,
  ) = _$GetLoungePostsResultCopyWithImpl<$Res, GetLoungePostsResult>;
}

/// @nodoc
class _$GetLoungePostsResultCopyWithImpl<
  $Res,
  $Val extends GetLoungePostsResult
>
    implements $GetLoungePostsResultCopyWith<$Res> {
  _$GetLoungePostsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetLoungePostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetLoungePostsSuccessImplCopyWith<$Res> {
  factory _$$GetLoungePostsSuccessImplCopyWith(
    _$GetLoungePostsSuccessImpl value,
    $Res Function(_$GetLoungePostsSuccessImpl) then,
  ) = __$$GetLoungePostsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoungePostPage page});
}

/// @nodoc
class __$$GetLoungePostsSuccessImplCopyWithImpl<$Res>
    extends
        _$GetLoungePostsResultCopyWithImpl<$Res, _$GetLoungePostsSuccessImpl>
    implements _$$GetLoungePostsSuccessImplCopyWith<$Res> {
  __$$GetLoungePostsSuccessImplCopyWithImpl(
    _$GetLoungePostsSuccessImpl _value,
    $Res Function(_$GetLoungePostsSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetLoungePostsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? page = null}) {
    return _then(
      _$GetLoungePostsSuccessImpl(
        null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as LoungePostPage,
      ),
    );
  }
}

/// @nodoc

class _$GetLoungePostsSuccessImpl implements GetLoungePostsSuccess {
  const _$GetLoungePostsSuccessImpl(this.page);

  @override
  final LoungePostPage page;

  @override
  String toString() {
    return 'GetLoungePostsResult.success(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoungePostsSuccessImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  /// Create a copy of GetLoungePostsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLoungePostsSuccessImplCopyWith<_$GetLoungePostsSuccessImpl>
  get copyWith =>
      __$$GetLoungePostsSuccessImplCopyWithImpl<_$GetLoungePostsSuccessImpl>(
        this,
        _$identity,
      );

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
    required TResult Function(GetLoungePostsSuccess value) success,
    required TResult Function(GetLoungePostsNetworkError value) networkError,
    required TResult Function(GetLoungePostsServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoungePostsSuccess value)? success,
    TResult? Function(GetLoungePostsNetworkError value)? networkError,
    TResult? Function(GetLoungePostsServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoungePostsSuccess value)? success,
    TResult Function(GetLoungePostsNetworkError value)? networkError,
    TResult Function(GetLoungePostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetLoungePostsSuccess implements GetLoungePostsResult {
  const factory GetLoungePostsSuccess(final LoungePostPage page) =
      _$GetLoungePostsSuccessImpl;

  LoungePostPage get page;

  /// Create a copy of GetLoungePostsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetLoungePostsSuccessImplCopyWith<_$GetLoungePostsSuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetLoungePostsNetworkErrorImplCopyWith<$Res> {
  factory _$$GetLoungePostsNetworkErrorImplCopyWith(
    _$GetLoungePostsNetworkErrorImpl value,
    $Res Function(_$GetLoungePostsNetworkErrorImpl) then,
  ) = __$$GetLoungePostsNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLoungePostsNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$GetLoungePostsResultCopyWithImpl<
          $Res,
          _$GetLoungePostsNetworkErrorImpl
        >
    implements _$$GetLoungePostsNetworkErrorImplCopyWith<$Res> {
  __$$GetLoungePostsNetworkErrorImplCopyWithImpl(
    _$GetLoungePostsNetworkErrorImpl _value,
    $Res Function(_$GetLoungePostsNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetLoungePostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetLoungePostsNetworkErrorImpl implements GetLoungePostsNetworkError {
  const _$GetLoungePostsNetworkErrorImpl();

  @override
  String toString() {
    return 'GetLoungePostsResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoungePostsNetworkErrorImpl);
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
    required TResult Function(GetLoungePostsSuccess value) success,
    required TResult Function(GetLoungePostsNetworkError value) networkError,
    required TResult Function(GetLoungePostsServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoungePostsSuccess value)? success,
    TResult? Function(GetLoungePostsNetworkError value)? networkError,
    TResult? Function(GetLoungePostsServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoungePostsSuccess value)? success,
    TResult Function(GetLoungePostsNetworkError value)? networkError,
    TResult Function(GetLoungePostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class GetLoungePostsNetworkError implements GetLoungePostsResult {
  const factory GetLoungePostsNetworkError() = _$GetLoungePostsNetworkErrorImpl;
}

/// @nodoc
abstract class _$$GetLoungePostsServerErrorImplCopyWith<$Res> {
  factory _$$GetLoungePostsServerErrorImplCopyWith(
    _$GetLoungePostsServerErrorImpl value,
    $Res Function(_$GetLoungePostsServerErrorImpl) then,
  ) = __$$GetLoungePostsServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLoungePostsServerErrorImplCopyWithImpl<$Res>
    extends
        _$GetLoungePostsResultCopyWithImpl<
          $Res,
          _$GetLoungePostsServerErrorImpl
        >
    implements _$$GetLoungePostsServerErrorImplCopyWith<$Res> {
  __$$GetLoungePostsServerErrorImplCopyWithImpl(
    _$GetLoungePostsServerErrorImpl _value,
    $Res Function(_$GetLoungePostsServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetLoungePostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetLoungePostsServerErrorImpl implements GetLoungePostsServerError {
  const _$GetLoungePostsServerErrorImpl();

  @override
  String toString() {
    return 'GetLoungePostsResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoungePostsServerErrorImpl);
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
    required TResult Function(GetLoungePostsSuccess value) success,
    required TResult Function(GetLoungePostsNetworkError value) networkError,
    required TResult Function(GetLoungePostsServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoungePostsSuccess value)? success,
    TResult? Function(GetLoungePostsNetworkError value)? networkError,
    TResult? Function(GetLoungePostsServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoungePostsSuccess value)? success,
    TResult Function(GetLoungePostsNetworkError value)? networkError,
    TResult Function(GetLoungePostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class GetLoungePostsServerError implements GetLoungePostsResult {
  const factory GetLoungePostsServerError() = _$GetLoungePostsServerErrorImpl;
}
