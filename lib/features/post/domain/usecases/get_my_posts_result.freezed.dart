// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_my_posts_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetMyPostsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyPost> items) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyPost> items)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyPost> items)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMyPostsSuccess value) success,
    required TResult Function(GetMyPostsNetworkError value) networkError,
    required TResult Function(GetMyPostsServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMyPostsSuccess value)? success,
    TResult? Function(GetMyPostsNetworkError value)? networkError,
    TResult? Function(GetMyPostsServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMyPostsSuccess value)? success,
    TResult Function(GetMyPostsNetworkError value)? networkError,
    TResult Function(GetMyPostsServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetMyPostsResultCopyWith<$Res> {
  factory $GetMyPostsResultCopyWith(
    GetMyPostsResult value,
    $Res Function(GetMyPostsResult) then,
  ) = _$GetMyPostsResultCopyWithImpl<$Res, GetMyPostsResult>;
}

/// @nodoc
class _$GetMyPostsResultCopyWithImpl<$Res, $Val extends GetMyPostsResult>
    implements $GetMyPostsResultCopyWith<$Res> {
  _$GetMyPostsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetMyPostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetMyPostsSuccessImplCopyWith<$Res> {
  factory _$$GetMyPostsSuccessImplCopyWith(
    _$GetMyPostsSuccessImpl value,
    $Res Function(_$GetMyPostsSuccessImpl) then,
  ) = __$$GetMyPostsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MyPost> items});
}

/// @nodoc
class __$$GetMyPostsSuccessImplCopyWithImpl<$Res>
    extends _$GetMyPostsResultCopyWithImpl<$Res, _$GetMyPostsSuccessImpl>
    implements _$$GetMyPostsSuccessImplCopyWith<$Res> {
  __$$GetMyPostsSuccessImplCopyWithImpl(
    _$GetMyPostsSuccessImpl _value,
    $Res Function(_$GetMyPostsSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetMyPostsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$GetMyPostsSuccessImpl(
        null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<MyPost>,
      ),
    );
  }
}

/// @nodoc

class _$GetMyPostsSuccessImpl implements GetMyPostsSuccess {
  const _$GetMyPostsSuccessImpl(final List<MyPost> items) : _items = items;

  final List<MyPost> _items;
  @override
  List<MyPost> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GetMyPostsResult.success(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMyPostsSuccessImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of GetMyPostsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMyPostsSuccessImplCopyWith<_$GetMyPostsSuccessImpl> get copyWith =>
      __$$GetMyPostsSuccessImplCopyWithImpl<_$GetMyPostsSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyPost> items) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyPost> items)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyPost> items)? success,
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
    required TResult Function(GetMyPostsSuccess value) success,
    required TResult Function(GetMyPostsNetworkError value) networkError,
    required TResult Function(GetMyPostsServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMyPostsSuccess value)? success,
    TResult? Function(GetMyPostsNetworkError value)? networkError,
    TResult? Function(GetMyPostsServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMyPostsSuccess value)? success,
    TResult Function(GetMyPostsNetworkError value)? networkError,
    TResult Function(GetMyPostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetMyPostsSuccess implements GetMyPostsResult {
  const factory GetMyPostsSuccess(final List<MyPost> items) =
      _$GetMyPostsSuccessImpl;

  List<MyPost> get items;

  /// Create a copy of GetMyPostsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetMyPostsSuccessImplCopyWith<_$GetMyPostsSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetMyPostsNetworkErrorImplCopyWith<$Res> {
  factory _$$GetMyPostsNetworkErrorImplCopyWith(
    _$GetMyPostsNetworkErrorImpl value,
    $Res Function(_$GetMyPostsNetworkErrorImpl) then,
  ) = __$$GetMyPostsNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMyPostsNetworkErrorImplCopyWithImpl<$Res>
    extends _$GetMyPostsResultCopyWithImpl<$Res, _$GetMyPostsNetworkErrorImpl>
    implements _$$GetMyPostsNetworkErrorImplCopyWith<$Res> {
  __$$GetMyPostsNetworkErrorImplCopyWithImpl(
    _$GetMyPostsNetworkErrorImpl _value,
    $Res Function(_$GetMyPostsNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetMyPostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetMyPostsNetworkErrorImpl implements GetMyPostsNetworkError {
  const _$GetMyPostsNetworkErrorImpl();

  @override
  String toString() {
    return 'GetMyPostsResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMyPostsNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyPost> items) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyPost> items)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyPost> items)? success,
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
    required TResult Function(GetMyPostsSuccess value) success,
    required TResult Function(GetMyPostsNetworkError value) networkError,
    required TResult Function(GetMyPostsServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMyPostsSuccess value)? success,
    TResult? Function(GetMyPostsNetworkError value)? networkError,
    TResult? Function(GetMyPostsServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMyPostsSuccess value)? success,
    TResult Function(GetMyPostsNetworkError value)? networkError,
    TResult Function(GetMyPostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class GetMyPostsNetworkError implements GetMyPostsResult {
  const factory GetMyPostsNetworkError() = _$GetMyPostsNetworkErrorImpl;
}

/// @nodoc
abstract class _$$GetMyPostsServerErrorImplCopyWith<$Res> {
  factory _$$GetMyPostsServerErrorImplCopyWith(
    _$GetMyPostsServerErrorImpl value,
    $Res Function(_$GetMyPostsServerErrorImpl) then,
  ) = __$$GetMyPostsServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMyPostsServerErrorImplCopyWithImpl<$Res>
    extends _$GetMyPostsResultCopyWithImpl<$Res, _$GetMyPostsServerErrorImpl>
    implements _$$GetMyPostsServerErrorImplCopyWith<$Res> {
  __$$GetMyPostsServerErrorImplCopyWithImpl(
    _$GetMyPostsServerErrorImpl _value,
    $Res Function(_$GetMyPostsServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetMyPostsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetMyPostsServerErrorImpl implements GetMyPostsServerError {
  const _$GetMyPostsServerErrorImpl();

  @override
  String toString() {
    return 'GetMyPostsResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMyPostsServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyPost> items) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyPost> items)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyPost> items)? success,
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
    required TResult Function(GetMyPostsSuccess value) success,
    required TResult Function(GetMyPostsNetworkError value) networkError,
    required TResult Function(GetMyPostsServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMyPostsSuccess value)? success,
    TResult? Function(GetMyPostsNetworkError value)? networkError,
    TResult? Function(GetMyPostsServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMyPostsSuccess value)? success,
    TResult Function(GetMyPostsNetworkError value)? networkError,
    TResult Function(GetMyPostsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class GetMyPostsServerError implements GetMyPostsResult {
  const factory GetMyPostsServerError() = _$GetMyPostsServerErrorImpl;
}
