// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_my_profile_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetMyProfileResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfile profile) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfile profile)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfile profile)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMyProfileSuccess value) success,
    required TResult Function(GetMyProfileNetworkError value) networkError,
    required TResult Function(GetMyProfileServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMyProfileSuccess value)? success,
    TResult? Function(GetMyProfileNetworkError value)? networkError,
    TResult? Function(GetMyProfileServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMyProfileSuccess value)? success,
    TResult Function(GetMyProfileNetworkError value)? networkError,
    TResult Function(GetMyProfileServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetMyProfileResultCopyWith<$Res> {
  factory $GetMyProfileResultCopyWith(
    GetMyProfileResult value,
    $Res Function(GetMyProfileResult) then,
  ) = _$GetMyProfileResultCopyWithImpl<$Res, GetMyProfileResult>;
}

/// @nodoc
class _$GetMyProfileResultCopyWithImpl<$Res, $Val extends GetMyProfileResult>
    implements $GetMyProfileResultCopyWith<$Res> {
  _$GetMyProfileResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetMyProfileResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetMyProfileSuccessImplCopyWith<$Res> {
  factory _$$GetMyProfileSuccessImplCopyWith(
    _$GetMyProfileSuccessImpl value,
    $Res Function(_$GetMyProfileSuccessImpl) then,
  ) = __$$GetMyProfileSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProfile profile});
}

/// @nodoc
class __$$GetMyProfileSuccessImplCopyWithImpl<$Res>
    extends _$GetMyProfileResultCopyWithImpl<$Res, _$GetMyProfileSuccessImpl>
    implements _$$GetMyProfileSuccessImplCopyWith<$Res> {
  __$$GetMyProfileSuccessImplCopyWithImpl(
    _$GetMyProfileSuccessImpl _value,
    $Res Function(_$GetMyProfileSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetMyProfileResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? profile = null}) {
    return _then(
      _$GetMyProfileSuccessImpl(
        null == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as UserProfile,
      ),
    );
  }
}

/// @nodoc

class _$GetMyProfileSuccessImpl implements GetMyProfileSuccess {
  const _$GetMyProfileSuccessImpl(this.profile);

  @override
  final UserProfile profile;

  @override
  String toString() {
    return 'GetMyProfileResult.success(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMyProfileSuccessImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  /// Create a copy of GetMyProfileResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMyProfileSuccessImplCopyWith<_$GetMyProfileSuccessImpl> get copyWith =>
      __$$GetMyProfileSuccessImplCopyWithImpl<_$GetMyProfileSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfile profile) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfile profile)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfile profile)? success,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMyProfileSuccess value) success,
    required TResult Function(GetMyProfileNetworkError value) networkError,
    required TResult Function(GetMyProfileServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMyProfileSuccess value)? success,
    TResult? Function(GetMyProfileNetworkError value)? networkError,
    TResult? Function(GetMyProfileServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMyProfileSuccess value)? success,
    TResult Function(GetMyProfileNetworkError value)? networkError,
    TResult Function(GetMyProfileServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetMyProfileSuccess implements GetMyProfileResult {
  const factory GetMyProfileSuccess(final UserProfile profile) =
      _$GetMyProfileSuccessImpl;

  UserProfile get profile;

  /// Create a copy of GetMyProfileResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetMyProfileSuccessImplCopyWith<_$GetMyProfileSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetMyProfileNetworkErrorImplCopyWith<$Res> {
  factory _$$GetMyProfileNetworkErrorImplCopyWith(
    _$GetMyProfileNetworkErrorImpl value,
    $Res Function(_$GetMyProfileNetworkErrorImpl) then,
  ) = __$$GetMyProfileNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMyProfileNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$GetMyProfileResultCopyWithImpl<$Res, _$GetMyProfileNetworkErrorImpl>
    implements _$$GetMyProfileNetworkErrorImplCopyWith<$Res> {
  __$$GetMyProfileNetworkErrorImplCopyWithImpl(
    _$GetMyProfileNetworkErrorImpl _value,
    $Res Function(_$GetMyProfileNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetMyProfileResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetMyProfileNetworkErrorImpl implements GetMyProfileNetworkError {
  const _$GetMyProfileNetworkErrorImpl();

  @override
  String toString() {
    return 'GetMyProfileResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMyProfileNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfile profile) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfile profile)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfile profile)? success,
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
    required TResult Function(GetMyProfileSuccess value) success,
    required TResult Function(GetMyProfileNetworkError value) networkError,
    required TResult Function(GetMyProfileServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMyProfileSuccess value)? success,
    TResult? Function(GetMyProfileNetworkError value)? networkError,
    TResult? Function(GetMyProfileServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMyProfileSuccess value)? success,
    TResult Function(GetMyProfileNetworkError value)? networkError,
    TResult Function(GetMyProfileServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class GetMyProfileNetworkError implements GetMyProfileResult {
  const factory GetMyProfileNetworkError() = _$GetMyProfileNetworkErrorImpl;
}

/// @nodoc
abstract class _$$GetMyProfileServerErrorImplCopyWith<$Res> {
  factory _$$GetMyProfileServerErrorImplCopyWith(
    _$GetMyProfileServerErrorImpl value,
    $Res Function(_$GetMyProfileServerErrorImpl) then,
  ) = __$$GetMyProfileServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMyProfileServerErrorImplCopyWithImpl<$Res>
    extends
        _$GetMyProfileResultCopyWithImpl<$Res, _$GetMyProfileServerErrorImpl>
    implements _$$GetMyProfileServerErrorImplCopyWith<$Res> {
  __$$GetMyProfileServerErrorImplCopyWithImpl(
    _$GetMyProfileServerErrorImpl _value,
    $Res Function(_$GetMyProfileServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetMyProfileResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetMyProfileServerErrorImpl implements GetMyProfileServerError {
  const _$GetMyProfileServerErrorImpl();

  @override
  String toString() {
    return 'GetMyProfileResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMyProfileServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfile profile) success,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfile profile)? success,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfile profile)? success,
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
    required TResult Function(GetMyProfileSuccess value) success,
    required TResult Function(GetMyProfileNetworkError value) networkError,
    required TResult Function(GetMyProfileServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMyProfileSuccess value)? success,
    TResult? Function(GetMyProfileNetworkError value)? networkError,
    TResult? Function(GetMyProfileServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMyProfileSuccess value)? success,
    TResult Function(GetMyProfileNetworkError value)? networkError,
    TResult Function(GetMyProfileServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class GetMyProfileServerError implements GetMyProfileResult {
  const factory GetMyProfileServerError() = _$GetMyProfileServerErrorImpl;
}
