// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_notification_settings_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetNotificationSettingsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationSettings settings) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationSettings settings)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationSettings settings)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotificationSettingsSuccess value) success,
    required TResult Function(GetNotificationSettingsNetworkError value)
    networkError,
    required TResult Function(GetNotificationSettingsServerError value)
    serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotificationSettingsSuccess value)? success,
    TResult? Function(GetNotificationSettingsNetworkError value)? networkError,
    TResult? Function(GetNotificationSettingsServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotificationSettingsSuccess value)? success,
    TResult Function(GetNotificationSettingsNetworkError value)? networkError,
    TResult Function(GetNotificationSettingsServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNotificationSettingsResultCopyWith<$Res> {
  factory $GetNotificationSettingsResultCopyWith(
    GetNotificationSettingsResult value,
    $Res Function(GetNotificationSettingsResult) then,
  ) =
      _$GetNotificationSettingsResultCopyWithImpl<
        $Res,
        GetNotificationSettingsResult
      >;
}

/// @nodoc
class _$GetNotificationSettingsResultCopyWithImpl<
  $Res,
  $Val extends GetNotificationSettingsResult
>
    implements $GetNotificationSettingsResultCopyWith<$Res> {
  _$GetNotificationSettingsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetNotificationSettingsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetNotificationSettingsSuccessImplCopyWith<$Res> {
  factory _$$GetNotificationSettingsSuccessImplCopyWith(
    _$GetNotificationSettingsSuccessImpl value,
    $Res Function(_$GetNotificationSettingsSuccessImpl) then,
  ) = __$$GetNotificationSettingsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NotificationSettings settings});
}

/// @nodoc
class __$$GetNotificationSettingsSuccessImplCopyWithImpl<$Res>
    extends
        _$GetNotificationSettingsResultCopyWithImpl<
          $Res,
          _$GetNotificationSettingsSuccessImpl
        >
    implements _$$GetNotificationSettingsSuccessImplCopyWith<$Res> {
  __$$GetNotificationSettingsSuccessImplCopyWithImpl(
    _$GetNotificationSettingsSuccessImpl _value,
    $Res Function(_$GetNotificationSettingsSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetNotificationSettingsResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? settings = null}) {
    return _then(
      _$GetNotificationSettingsSuccessImpl(
        null == settings
            ? _value.settings
            : settings // ignore: cast_nullable_to_non_nullable
                  as NotificationSettings,
      ),
    );
  }
}

/// @nodoc

class _$GetNotificationSettingsSuccessImpl
    implements GetNotificationSettingsSuccess {
  const _$GetNotificationSettingsSuccessImpl(this.settings);

  @override
  final NotificationSettings settings;

  @override
  String toString() {
    return 'GetNotificationSettingsResult.success(settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationSettingsSuccessImpl &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, settings);

  /// Create a copy of GetNotificationSettingsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNotificationSettingsSuccessImplCopyWith<
    _$GetNotificationSettingsSuccessImpl
  >
  get copyWith =>
      __$$GetNotificationSettingsSuccessImplCopyWithImpl<
        _$GetNotificationSettingsSuccessImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationSettings settings) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success(settings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationSettings settings)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call(settings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationSettings settings)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(settings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotificationSettingsSuccess value) success,
    required TResult Function(GetNotificationSettingsNetworkError value)
    networkError,
    required TResult Function(GetNotificationSettingsServerError value)
    serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotificationSettingsSuccess value)? success,
    TResult? Function(GetNotificationSettingsNetworkError value)? networkError,
    TResult? Function(GetNotificationSettingsServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotificationSettingsSuccess value)? success,
    TResult Function(GetNotificationSettingsNetworkError value)? networkError,
    TResult Function(GetNotificationSettingsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetNotificationSettingsSuccess
    implements GetNotificationSettingsResult {
  const factory GetNotificationSettingsSuccess(
    final NotificationSettings settings,
  ) = _$GetNotificationSettingsSuccessImpl;

  NotificationSettings get settings;

  /// Create a copy of GetNotificationSettingsResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetNotificationSettingsSuccessImplCopyWith<
    _$GetNotificationSettingsSuccessImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetNotificationSettingsNetworkErrorImplCopyWith<$Res> {
  factory _$$GetNotificationSettingsNetworkErrorImplCopyWith(
    _$GetNotificationSettingsNetworkErrorImpl value,
    $Res Function(_$GetNotificationSettingsNetworkErrorImpl) then,
  ) = __$$GetNotificationSettingsNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationSettingsNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$GetNotificationSettingsResultCopyWithImpl<
          $Res,
          _$GetNotificationSettingsNetworkErrorImpl
        >
    implements _$$GetNotificationSettingsNetworkErrorImplCopyWith<$Res> {
  __$$GetNotificationSettingsNetworkErrorImplCopyWithImpl(
    _$GetNotificationSettingsNetworkErrorImpl _value,
    $Res Function(_$GetNotificationSettingsNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetNotificationSettingsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNotificationSettingsNetworkErrorImpl
    implements GetNotificationSettingsNetworkError {
  const _$GetNotificationSettingsNetworkErrorImpl();

  @override
  String toString() {
    return 'GetNotificationSettingsResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationSettingsNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationSettings settings) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationSettings settings)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationSettings settings)? success,
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
    required TResult Function(GetNotificationSettingsSuccess value) success,
    required TResult Function(GetNotificationSettingsNetworkError value)
    networkError,
    required TResult Function(GetNotificationSettingsServerError value)
    serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotificationSettingsSuccess value)? success,
    TResult? Function(GetNotificationSettingsNetworkError value)? networkError,
    TResult? Function(GetNotificationSettingsServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotificationSettingsSuccess value)? success,
    TResult Function(GetNotificationSettingsNetworkError value)? networkError,
    TResult Function(GetNotificationSettingsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class GetNotificationSettingsNetworkError
    implements GetNotificationSettingsResult {
  const factory GetNotificationSettingsNetworkError() =
      _$GetNotificationSettingsNetworkErrorImpl;
}

/// @nodoc
abstract class _$$GetNotificationSettingsServerErrorImplCopyWith<$Res> {
  factory _$$GetNotificationSettingsServerErrorImplCopyWith(
    _$GetNotificationSettingsServerErrorImpl value,
    $Res Function(_$GetNotificationSettingsServerErrorImpl) then,
  ) = __$$GetNotificationSettingsServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationSettingsServerErrorImplCopyWithImpl<$Res>
    extends
        _$GetNotificationSettingsResultCopyWithImpl<
          $Res,
          _$GetNotificationSettingsServerErrorImpl
        >
    implements _$$GetNotificationSettingsServerErrorImplCopyWith<$Res> {
  __$$GetNotificationSettingsServerErrorImplCopyWithImpl(
    _$GetNotificationSettingsServerErrorImpl _value,
    $Res Function(_$GetNotificationSettingsServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetNotificationSettingsResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNotificationSettingsServerErrorImpl
    implements GetNotificationSettingsServerError {
  const _$GetNotificationSettingsServerErrorImpl();

  @override
  String toString() {
    return 'GetNotificationSettingsResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationSettingsServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationSettings settings) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationSettings settings)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationSettings settings)? success,
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
    required TResult Function(GetNotificationSettingsSuccess value) success,
    required TResult Function(GetNotificationSettingsNetworkError value)
    networkError,
    required TResult Function(GetNotificationSettingsServerError value)
    serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotificationSettingsSuccess value)? success,
    TResult? Function(GetNotificationSettingsNetworkError value)? networkError,
    TResult? Function(GetNotificationSettingsServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotificationSettingsSuccess value)? success,
    TResult Function(GetNotificationSettingsNetworkError value)? networkError,
    TResult Function(GetNotificationSettingsServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class GetNotificationSettingsServerError
    implements GetNotificationSettingsResult {
  const factory GetNotificationSettingsServerError() =
      _$GetNotificationSettingsServerErrorImpl;
}
