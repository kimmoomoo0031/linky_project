// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_lounge_posts_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchLoungePostsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungePostSearchPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungePostSearchPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungePostSearchPage page)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchLoungePostsSuccess value) success,
    required TResult Function(SearchLoungePostsNetworkError value) networkError,
    required TResult Function(SearchLoungePostsServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchLoungePostsSuccess value)? success,
    TResult? Function(SearchLoungePostsNetworkError value)? networkError,
    TResult? Function(SearchLoungePostsServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchLoungePostsSuccess value)? success,
    TResult Function(SearchLoungePostsNetworkError value)? networkError,
    TResult Function(SearchLoungePostsServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchLoungePostsResultCopyWith<$Res> {
  factory $SearchLoungePostsResultCopyWith(
    SearchLoungePostsResult value,
    $Res Function(SearchLoungePostsResult) then,
  ) = _$SearchLoungePostsResultCopyWithImpl<$Res, SearchLoungePostsResult>;
}

/// @nodoc
class _$SearchLoungePostsResultCopyWithImpl<
  $Res,
  $Val extends SearchLoungePostsResult
>
    implements $SearchLoungePostsResultCopyWith<$Res> {
  _$SearchLoungePostsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchLoungePostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SearchLoungePostsSuccessImplCopyWith<$Res> {
  factory _$$SearchLoungePostsSuccessImplCopyWith(
    _$SearchLoungePostsSuccessImpl value,
    $Res Function(_$SearchLoungePostsSuccessImpl) then,
  ) = __$$SearchLoungePostsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoungePostSearchPage page});
}

/// @nodoc
class __$$SearchLoungePostsSuccessImplCopyWithImpl<$Res>
    extends
        _$SearchLoungePostsResultCopyWithImpl<
          $Res,
          _$SearchLoungePostsSuccessImpl
        >
    implements _$$SearchLoungePostsSuccessImplCopyWith<$Res> {
  __$$SearchLoungePostsSuccessImplCopyWithImpl(
    _$SearchLoungePostsSuccessImpl _value,
    $Res Function(_$SearchLoungePostsSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchLoungePostsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? page = null}) {
    return _then(
      _$SearchLoungePostsSuccessImpl(
        null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as LoungePostSearchPage,
      ),
    );
  }
}

/// @nodoc

class _$SearchLoungePostsSuccessImpl implements SearchLoungePostsSuccess {
  const _$SearchLoungePostsSuccessImpl(this.page);

  @override
  final LoungePostSearchPage page;

  @override
  String toString() {
    return 'SearchLoungePostsResult.success(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchLoungePostsSuccessImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  /// Create a copy of SearchLoungePostsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchLoungePostsSuccessImplCopyWith<_$SearchLoungePostsSuccessImpl>
  get copyWith =>
      __$$SearchLoungePostsSuccessImplCopyWithImpl<
        _$SearchLoungePostsSuccessImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungePostSearchPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungePostSearchPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungePostSearchPage page)? success,
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
    required TResult Function(SearchLoungePostsSuccess value) success,
    required TResult Function(SearchLoungePostsNetworkError value) networkError,
    required TResult Function(SearchLoungePostsServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchLoungePostsSuccess value)? success,
    TResult? Function(SearchLoungePostsNetworkError value)? networkError,
    TResult? Function(SearchLoungePostsServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchLoungePostsSuccess value)? success,
    TResult Function(SearchLoungePostsNetworkError value)? networkError,
    TResult Function(SearchLoungePostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SearchLoungePostsSuccess implements SearchLoungePostsResult {
  const factory SearchLoungePostsSuccess(final LoungePostSearchPage page) =
      _$SearchLoungePostsSuccessImpl;

  LoungePostSearchPage get page;

  /// Create a copy of SearchLoungePostsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchLoungePostsSuccessImplCopyWith<_$SearchLoungePostsSuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchLoungePostsNetworkErrorImplCopyWith<$Res> {
  factory _$$SearchLoungePostsNetworkErrorImplCopyWith(
    _$SearchLoungePostsNetworkErrorImpl value,
    $Res Function(_$SearchLoungePostsNetworkErrorImpl) then,
  ) = __$$SearchLoungePostsNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchLoungePostsNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$SearchLoungePostsResultCopyWithImpl<
          $Res,
          _$SearchLoungePostsNetworkErrorImpl
        >
    implements _$$SearchLoungePostsNetworkErrorImplCopyWith<$Res> {
  __$$SearchLoungePostsNetworkErrorImplCopyWithImpl(
    _$SearchLoungePostsNetworkErrorImpl _value,
    $Res Function(_$SearchLoungePostsNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchLoungePostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SearchLoungePostsNetworkErrorImpl
    implements SearchLoungePostsNetworkError {
  const _$SearchLoungePostsNetworkErrorImpl();

  @override
  String toString() {
    return 'SearchLoungePostsResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchLoungePostsNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungePostSearchPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungePostSearchPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungePostSearchPage page)? success,
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
    required TResult Function(SearchLoungePostsSuccess value) success,
    required TResult Function(SearchLoungePostsNetworkError value) networkError,
    required TResult Function(SearchLoungePostsServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchLoungePostsSuccess value)? success,
    TResult? Function(SearchLoungePostsNetworkError value)? networkError,
    TResult? Function(SearchLoungePostsServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchLoungePostsSuccess value)? success,
    TResult Function(SearchLoungePostsNetworkError value)? networkError,
    TResult Function(SearchLoungePostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class SearchLoungePostsNetworkError
    implements SearchLoungePostsResult {
  const factory SearchLoungePostsNetworkError() =
      _$SearchLoungePostsNetworkErrorImpl;
}

/// @nodoc
abstract class _$$SearchLoungePostsServerErrorImplCopyWith<$Res> {
  factory _$$SearchLoungePostsServerErrorImplCopyWith(
    _$SearchLoungePostsServerErrorImpl value,
    $Res Function(_$SearchLoungePostsServerErrorImpl) then,
  ) = __$$SearchLoungePostsServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchLoungePostsServerErrorImplCopyWithImpl<$Res>
    extends
        _$SearchLoungePostsResultCopyWithImpl<
          $Res,
          _$SearchLoungePostsServerErrorImpl
        >
    implements _$$SearchLoungePostsServerErrorImplCopyWith<$Res> {
  __$$SearchLoungePostsServerErrorImplCopyWithImpl(
    _$SearchLoungePostsServerErrorImpl _value,
    $Res Function(_$SearchLoungePostsServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchLoungePostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SearchLoungePostsServerErrorImpl
    implements SearchLoungePostsServerError {
  const _$SearchLoungePostsServerErrorImpl();

  @override
  String toString() {
    return 'SearchLoungePostsResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchLoungePostsServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungePostSearchPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungePostSearchPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungePostSearchPage page)? success,
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
    required TResult Function(SearchLoungePostsSuccess value) success,
    required TResult Function(SearchLoungePostsNetworkError value) networkError,
    required TResult Function(SearchLoungePostsServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchLoungePostsSuccess value)? success,
    TResult? Function(SearchLoungePostsNetworkError value)? networkError,
    TResult? Function(SearchLoungePostsServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchLoungePostsSuccess value)? success,
    TResult Function(SearchLoungePostsNetworkError value)? networkError,
    TResult Function(SearchLoungePostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class SearchLoungePostsServerError implements SearchLoungePostsResult {
  const factory SearchLoungePostsServerError() =
      _$SearchLoungePostsServerErrorImpl;
}
