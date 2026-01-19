// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_best_posts_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetBestPostsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BestPost> items) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BestPost> items)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BestPost> items)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBestPostsSuccess value) success,
    required TResult Function(GetBestPostsNetworkError value) networkError,
    required TResult Function(GetBestPostsServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBestPostsSuccess value)? success,
    TResult? Function(GetBestPostsNetworkError value)? networkError,
    TResult? Function(GetBestPostsServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBestPostsSuccess value)? success,
    TResult Function(GetBestPostsNetworkError value)? networkError,
    TResult Function(GetBestPostsServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBestPostsResultCopyWith<$Res> {
  factory $GetBestPostsResultCopyWith(
    GetBestPostsResult value,
    $Res Function(GetBestPostsResult) then,
  ) = _$GetBestPostsResultCopyWithImpl<$Res, GetBestPostsResult>;
}

/// @nodoc
class _$GetBestPostsResultCopyWithImpl<$Res, $Val extends GetBestPostsResult>
    implements $GetBestPostsResultCopyWith<$Res> {
  _$GetBestPostsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetBestPostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetBestPostsSuccessImplCopyWith<$Res> {
  factory _$$GetBestPostsSuccessImplCopyWith(
    _$GetBestPostsSuccessImpl value,
    $Res Function(_$GetBestPostsSuccessImpl) then,
  ) = __$$GetBestPostsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BestPost> items});
}

/// @nodoc
class __$$GetBestPostsSuccessImplCopyWithImpl<$Res>
    extends _$GetBestPostsResultCopyWithImpl<$Res, _$GetBestPostsSuccessImpl>
    implements _$$GetBestPostsSuccessImplCopyWith<$Res> {
  __$$GetBestPostsSuccessImplCopyWithImpl(
    _$GetBestPostsSuccessImpl _value,
    $Res Function(_$GetBestPostsSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetBestPostsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$GetBestPostsSuccessImpl(
        null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<BestPost>,
      ),
    );
  }
}

/// @nodoc

class _$GetBestPostsSuccessImpl implements GetBestPostsSuccess {
  const _$GetBestPostsSuccessImpl(final List<BestPost> items) : _items = items;

  final List<BestPost> _items;
  @override
  List<BestPost> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GetBestPostsResult.success(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBestPostsSuccessImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of GetBestPostsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBestPostsSuccessImplCopyWith<_$GetBestPostsSuccessImpl> get copyWith =>
      __$$GetBestPostsSuccessImplCopyWithImpl<_$GetBestPostsSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BestPost> items) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BestPost> items)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BestPost> items)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBestPostsSuccess value) success,
    required TResult Function(GetBestPostsNetworkError value) networkError,
    required TResult Function(GetBestPostsServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBestPostsSuccess value)? success,
    TResult? Function(GetBestPostsNetworkError value)? networkError,
    TResult? Function(GetBestPostsServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBestPostsSuccess value)? success,
    TResult Function(GetBestPostsNetworkError value)? networkError,
    TResult Function(GetBestPostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetBestPostsSuccess implements GetBestPostsResult {
  const factory GetBestPostsSuccess(final List<BestPost> items) =
      _$GetBestPostsSuccessImpl;

  List<BestPost> get items;

  /// Create a copy of GetBestPostsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetBestPostsSuccessImplCopyWith<_$GetBestPostsSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetBestPostsNetworkErrorImplCopyWith<$Res> {
  factory _$$GetBestPostsNetworkErrorImplCopyWith(
    _$GetBestPostsNetworkErrorImpl value,
    $Res Function(_$GetBestPostsNetworkErrorImpl) then,
  ) = __$$GetBestPostsNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBestPostsNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$GetBestPostsResultCopyWithImpl<$Res, _$GetBestPostsNetworkErrorImpl>
    implements _$$GetBestPostsNetworkErrorImplCopyWith<$Res> {
  __$$GetBestPostsNetworkErrorImplCopyWithImpl(
    _$GetBestPostsNetworkErrorImpl _value,
    $Res Function(_$GetBestPostsNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetBestPostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetBestPostsNetworkErrorImpl implements GetBestPostsNetworkError {
  const _$GetBestPostsNetworkErrorImpl();

  @override
  String toString() {
    return 'GetBestPostsResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBestPostsNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BestPost> items) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BestPost> items)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BestPost> items)? success,
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
    required TResult Function(GetBestPostsSuccess value) success,
    required TResult Function(GetBestPostsNetworkError value) networkError,
    required TResult Function(GetBestPostsServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBestPostsSuccess value)? success,
    TResult? Function(GetBestPostsNetworkError value)? networkError,
    TResult? Function(GetBestPostsServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBestPostsSuccess value)? success,
    TResult Function(GetBestPostsNetworkError value)? networkError,
    TResult Function(GetBestPostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class GetBestPostsNetworkError implements GetBestPostsResult {
  const factory GetBestPostsNetworkError() = _$GetBestPostsNetworkErrorImpl;
}

/// @nodoc
abstract class _$$GetBestPostsServerErrorImplCopyWith<$Res> {
  factory _$$GetBestPostsServerErrorImplCopyWith(
    _$GetBestPostsServerErrorImpl value,
    $Res Function(_$GetBestPostsServerErrorImpl) then,
  ) = __$$GetBestPostsServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBestPostsServerErrorImplCopyWithImpl<$Res>
    extends
        _$GetBestPostsResultCopyWithImpl<$Res, _$GetBestPostsServerErrorImpl>
    implements _$$GetBestPostsServerErrorImplCopyWith<$Res> {
  __$$GetBestPostsServerErrorImplCopyWithImpl(
    _$GetBestPostsServerErrorImpl _value,
    $Res Function(_$GetBestPostsServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetBestPostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetBestPostsServerErrorImpl implements GetBestPostsServerError {
  const _$GetBestPostsServerErrorImpl();

  @override
  String toString() {
    return 'GetBestPostsResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBestPostsServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BestPost> items) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BestPost> items)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BestPost> items)? success,
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
    required TResult Function(GetBestPostsSuccess value) success,
    required TResult Function(GetBestPostsNetworkError value) networkError,
    required TResult Function(GetBestPostsServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBestPostsSuccess value)? success,
    TResult? Function(GetBestPostsNetworkError value)? networkError,
    TResult? Function(GetBestPostsServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBestPostsSuccess value)? success,
    TResult Function(GetBestPostsNetworkError value)? networkError,
    TResult Function(GetBestPostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class GetBestPostsServerError implements GetBestPostsResult {
  const factory GetBestPostsServerError() = _$GetBestPostsServerErrorImpl;
}
