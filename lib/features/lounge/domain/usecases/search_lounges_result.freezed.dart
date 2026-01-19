// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_lounges_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchLoungesResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungeSearchPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungeSearchPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungeSearchPage page)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchLoungesSuccess value) success,
    required TResult Function(SearchLoungesNetworkError value) networkError,
    required TResult Function(SearchLoungesServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchLoungesSuccess value)? success,
    TResult? Function(SearchLoungesNetworkError value)? networkError,
    TResult? Function(SearchLoungesServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchLoungesSuccess value)? success,
    TResult Function(SearchLoungesNetworkError value)? networkError,
    TResult Function(SearchLoungesServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchLoungesResultCopyWith<$Res> {
  factory $SearchLoungesResultCopyWith(
    SearchLoungesResult value,
    $Res Function(SearchLoungesResult) then,
  ) = _$SearchLoungesResultCopyWithImpl<$Res, SearchLoungesResult>;
}

/// @nodoc
class _$SearchLoungesResultCopyWithImpl<$Res, $Val extends SearchLoungesResult>
    implements $SearchLoungesResultCopyWith<$Res> {
  _$SearchLoungesResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchLoungesResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SearchLoungesSuccessImplCopyWith<$Res> {
  factory _$$SearchLoungesSuccessImplCopyWith(
    _$SearchLoungesSuccessImpl value,
    $Res Function(_$SearchLoungesSuccessImpl) then,
  ) = __$$SearchLoungesSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoungeSearchPage page});
}

/// @nodoc
class __$$SearchLoungesSuccessImplCopyWithImpl<$Res>
    extends _$SearchLoungesResultCopyWithImpl<$Res, _$SearchLoungesSuccessImpl>
    implements _$$SearchLoungesSuccessImplCopyWith<$Res> {
  __$$SearchLoungesSuccessImplCopyWithImpl(
    _$SearchLoungesSuccessImpl _value,
    $Res Function(_$SearchLoungesSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchLoungesResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? page = null}) {
    return _then(
      _$SearchLoungesSuccessImpl(
        null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as LoungeSearchPage,
      ),
    );
  }
}

/// @nodoc

class _$SearchLoungesSuccessImpl implements SearchLoungesSuccess {
  const _$SearchLoungesSuccessImpl(this.page);

  @override
  final LoungeSearchPage page;

  @override
  String toString() {
    return 'SearchLoungesResult.success(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchLoungesSuccessImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  /// Create a copy of SearchLoungesResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchLoungesSuccessImplCopyWith<_$SearchLoungesSuccessImpl>
  get copyWith =>
      __$$SearchLoungesSuccessImplCopyWithImpl<_$SearchLoungesSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungeSearchPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungeSearchPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungeSearchPage page)? success,
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
    required TResult Function(SearchLoungesSuccess value) success,
    required TResult Function(SearchLoungesNetworkError value) networkError,
    required TResult Function(SearchLoungesServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchLoungesSuccess value)? success,
    TResult? Function(SearchLoungesNetworkError value)? networkError,
    TResult? Function(SearchLoungesServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchLoungesSuccess value)? success,
    TResult Function(SearchLoungesNetworkError value)? networkError,
    TResult Function(SearchLoungesServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SearchLoungesSuccess implements SearchLoungesResult {
  const factory SearchLoungesSuccess(final LoungeSearchPage page) =
      _$SearchLoungesSuccessImpl;

  LoungeSearchPage get page;

  /// Create a copy of SearchLoungesResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchLoungesSuccessImplCopyWith<_$SearchLoungesSuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchLoungesNetworkErrorImplCopyWith<$Res> {
  factory _$$SearchLoungesNetworkErrorImplCopyWith(
    _$SearchLoungesNetworkErrorImpl value,
    $Res Function(_$SearchLoungesNetworkErrorImpl) then,
  ) = __$$SearchLoungesNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchLoungesNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$SearchLoungesResultCopyWithImpl<$Res, _$SearchLoungesNetworkErrorImpl>
    implements _$$SearchLoungesNetworkErrorImplCopyWith<$Res> {
  __$$SearchLoungesNetworkErrorImplCopyWithImpl(
    _$SearchLoungesNetworkErrorImpl _value,
    $Res Function(_$SearchLoungesNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchLoungesResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SearchLoungesNetworkErrorImpl implements SearchLoungesNetworkError {
  const _$SearchLoungesNetworkErrorImpl();

  @override
  String toString() {
    return 'SearchLoungesResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchLoungesNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungeSearchPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungeSearchPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungeSearchPage page)? success,
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
    required TResult Function(SearchLoungesSuccess value) success,
    required TResult Function(SearchLoungesNetworkError value) networkError,
    required TResult Function(SearchLoungesServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchLoungesSuccess value)? success,
    TResult? Function(SearchLoungesNetworkError value)? networkError,
    TResult? Function(SearchLoungesServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchLoungesSuccess value)? success,
    TResult Function(SearchLoungesNetworkError value)? networkError,
    TResult Function(SearchLoungesServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class SearchLoungesNetworkError implements SearchLoungesResult {
  const factory SearchLoungesNetworkError() = _$SearchLoungesNetworkErrorImpl;
}

/// @nodoc
abstract class _$$SearchLoungesServerErrorImplCopyWith<$Res> {
  factory _$$SearchLoungesServerErrorImplCopyWith(
    _$SearchLoungesServerErrorImpl value,
    $Res Function(_$SearchLoungesServerErrorImpl) then,
  ) = __$$SearchLoungesServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchLoungesServerErrorImplCopyWithImpl<$Res>
    extends
        _$SearchLoungesResultCopyWithImpl<$Res, _$SearchLoungesServerErrorImpl>
    implements _$$SearchLoungesServerErrorImplCopyWith<$Res> {
  __$$SearchLoungesServerErrorImplCopyWithImpl(
    _$SearchLoungesServerErrorImpl _value,
    $Res Function(_$SearchLoungesServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchLoungesResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SearchLoungesServerErrorImpl implements SearchLoungesServerError {
  const _$SearchLoungesServerErrorImpl();

  @override
  String toString() {
    return 'SearchLoungesResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchLoungesServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoungeSearchPage page) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoungeSearchPage page)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoungeSearchPage page)? success,
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
    required TResult Function(SearchLoungesSuccess value) success,
    required TResult Function(SearchLoungesNetworkError value) networkError,
    required TResult Function(SearchLoungesServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchLoungesSuccess value)? success,
    TResult? Function(SearchLoungesNetworkError value)? networkError,
    TResult? Function(SearchLoungesServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchLoungesSuccess value)? success,
    TResult Function(SearchLoungesNetworkError value)? networkError,
    TResult Function(SearchLoungesServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class SearchLoungesServerError implements SearchLoungesResult {
  const factory SearchLoungesServerError() = _$SearchLoungesServerErrorImpl;
}
