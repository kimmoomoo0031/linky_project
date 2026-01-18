// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_notifications_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetNotificationsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<NotificationItem> items) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<NotificationItem> items)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<NotificationItem> items)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotificationsSuccess value) success,
    required TResult Function(GetNotificationsNetworkError value) networkError,
    required TResult Function(GetNotificationsServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotificationsSuccess value)? success,
    TResult? Function(GetNotificationsNetworkError value)? networkError,
    TResult? Function(GetNotificationsServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotificationsSuccess value)? success,
    TResult Function(GetNotificationsNetworkError value)? networkError,
    TResult Function(GetNotificationsServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNotificationsResultCopyWith<$Res> {
  factory $GetNotificationsResultCopyWith(
    GetNotificationsResult value,
    $Res Function(GetNotificationsResult) then,
  ) = _$GetNotificationsResultCopyWithImpl<$Res, GetNotificationsResult>;
}

/// @nodoc
class _$GetNotificationsResultCopyWithImpl<
  $Res,
  $Val extends GetNotificationsResult
>
    implements $GetNotificationsResultCopyWith<$Res> {
  _$GetNotificationsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetNotificationsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetNotificationsSuccessImplCopyWith<$Res> {
  factory _$$GetNotificationsSuccessImplCopyWith(
    _$GetNotificationsSuccessImpl value,
    $Res Function(_$GetNotificationsSuccessImpl) then,
  ) = __$$GetNotificationsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationItem> items});
}

/// @nodoc
class __$$GetNotificationsSuccessImplCopyWithImpl<$Res>
    extends
        _$GetNotificationsResultCopyWithImpl<
          $Res,
          _$GetNotificationsSuccessImpl
        >
    implements _$$GetNotificationsSuccessImplCopyWith<$Res> {
  __$$GetNotificationsSuccessImplCopyWithImpl(
    _$GetNotificationsSuccessImpl _value,
    $Res Function(_$GetNotificationsSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetNotificationsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$GetNotificationsSuccessImpl(
        null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<NotificationItem>,
      ),
    );
  }
}

/// @nodoc

class _$GetNotificationsSuccessImpl implements GetNotificationsSuccess {
  const _$GetNotificationsSuccessImpl(final List<NotificationItem> items)
    : _items = items;

  final List<NotificationItem> _items;
  @override
  List<NotificationItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GetNotificationsResult.success(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationsSuccessImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of GetNotificationsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNotificationsSuccessImplCopyWith<_$GetNotificationsSuccessImpl>
  get copyWith =>
      __$$GetNotificationsSuccessImplCopyWithImpl<
        _$GetNotificationsSuccessImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<NotificationItem> items) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<NotificationItem> items)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<NotificationItem> items)? success,
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
    required TResult Function(GetNotificationsSuccess value) success,
    required TResult Function(GetNotificationsNetworkError value) networkError,
    required TResult Function(GetNotificationsServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotificationsSuccess value)? success,
    TResult? Function(GetNotificationsNetworkError value)? networkError,
    TResult? Function(GetNotificationsServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotificationsSuccess value)? success,
    TResult Function(GetNotificationsNetworkError value)? networkError,
    TResult Function(GetNotificationsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetNotificationsSuccess implements GetNotificationsResult {
  const factory GetNotificationsSuccess(final List<NotificationItem> items) =
      _$GetNotificationsSuccessImpl;

  List<NotificationItem> get items;

  /// Create a copy of GetNotificationsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetNotificationsSuccessImplCopyWith<_$GetNotificationsSuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetNotificationsNetworkErrorImplCopyWith<$Res> {
  factory _$$GetNotificationsNetworkErrorImplCopyWith(
    _$GetNotificationsNetworkErrorImpl value,
    $Res Function(_$GetNotificationsNetworkErrorImpl) then,
  ) = __$$GetNotificationsNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationsNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$GetNotificationsResultCopyWithImpl<
          $Res,
          _$GetNotificationsNetworkErrorImpl
        >
    implements _$$GetNotificationsNetworkErrorImplCopyWith<$Res> {
  __$$GetNotificationsNetworkErrorImplCopyWithImpl(
    _$GetNotificationsNetworkErrorImpl _value,
    $Res Function(_$GetNotificationsNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetNotificationsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNotificationsNetworkErrorImpl
    implements GetNotificationsNetworkError {
  const _$GetNotificationsNetworkErrorImpl();

  @override
  String toString() {
    return 'GetNotificationsResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationsNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<NotificationItem> items) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<NotificationItem> items)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<NotificationItem> items)? success,
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
    required TResult Function(GetNotificationsSuccess value) success,
    required TResult Function(GetNotificationsNetworkError value) networkError,
    required TResult Function(GetNotificationsServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotificationsSuccess value)? success,
    TResult? Function(GetNotificationsNetworkError value)? networkError,
    TResult? Function(GetNotificationsServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotificationsSuccess value)? success,
    TResult Function(GetNotificationsNetworkError value)? networkError,
    TResult Function(GetNotificationsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class GetNotificationsNetworkError implements GetNotificationsResult {
  const factory GetNotificationsNetworkError() =
      _$GetNotificationsNetworkErrorImpl;
}

/// @nodoc
abstract class _$$GetNotificationsServerErrorImplCopyWith<$Res> {
  factory _$$GetNotificationsServerErrorImplCopyWith(
    _$GetNotificationsServerErrorImpl value,
    $Res Function(_$GetNotificationsServerErrorImpl) then,
  ) = __$$GetNotificationsServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationsServerErrorImplCopyWithImpl<$Res>
    extends
        _$GetNotificationsResultCopyWithImpl<
          $Res,
          _$GetNotificationsServerErrorImpl
        >
    implements _$$GetNotificationsServerErrorImplCopyWith<$Res> {
  __$$GetNotificationsServerErrorImplCopyWithImpl(
    _$GetNotificationsServerErrorImpl _value,
    $Res Function(_$GetNotificationsServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetNotificationsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNotificationsServerErrorImpl implements GetNotificationsServerError {
  const _$GetNotificationsServerErrorImpl();

  @override
  String toString() {
    return 'GetNotificationsResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationsServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<NotificationItem> items) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<NotificationItem> items)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<NotificationItem> items)? success,
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
    required TResult Function(GetNotificationsSuccess value) success,
    required TResult Function(GetNotificationsNetworkError value) networkError,
    required TResult Function(GetNotificationsServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotificationsSuccess value)? success,
    TResult? Function(GetNotificationsNetworkError value)? networkError,
    TResult? Function(GetNotificationsServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotificationsSuccess value)? success,
    TResult Function(GetNotificationsNetworkError value)? networkError,
    TResult Function(GetNotificationsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class GetNotificationsServerError implements GetNotificationsResult {
  const factory GetNotificationsServerError() =
      _$GetNotificationsServerErrorImpl;
}
