// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthUser user) success,
    required TResult Function() invalidCredentials,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthUser user)? success,
    TResult? Function()? invalidCredentials,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthUser user)? success,
    TResult Function()? invalidCredentials,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginInvalidCredentials value) invalidCredentials,
    required TResult Function(LoginNetworkError value) networkError,
    required TResult Function(LoginServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginInvalidCredentials value)? invalidCredentials,
    TResult? Function(LoginNetworkError value)? networkError,
    TResult? Function(LoginServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginInvalidCredentials value)? invalidCredentials,
    TResult Function(LoginNetworkError value)? networkError,
    TResult Function(LoginServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResultCopyWith<$Res> {
  factory $LoginResultCopyWith(
    LoginResult value,
    $Res Function(LoginResult) then,
  ) = _$LoginResultCopyWithImpl<$Res, LoginResult>;
}

/// @nodoc
class _$LoginResultCopyWithImpl<$Res, $Val extends LoginResult>
    implements $LoginResultCopyWith<$Res> {
  _$LoginResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginSuccessImplCopyWith<$Res> {
  factory _$$LoginSuccessImplCopyWith(
    _$LoginSuccessImpl value,
    $Res Function(_$LoginSuccessImpl) then,
  ) = __$$LoginSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthUser user});
}

/// @nodoc
class __$$LoginSuccessImplCopyWithImpl<$Res>
    extends _$LoginResultCopyWithImpl<$Res, _$LoginSuccessImpl>
    implements _$$LoginSuccessImplCopyWith<$Res> {
  __$$LoginSuccessImplCopyWithImpl(
    _$LoginSuccessImpl _value,
    $Res Function(_$LoginSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _$LoginSuccessImpl(
        null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as AuthUser,
      ),
    );
  }
}

/// @nodoc

class _$LoginSuccessImpl implements LoginSuccess {
  const _$LoginSuccessImpl(this.user);

  @override
  final AuthUser user;

  @override
  String toString() {
    return 'LoginResult.success(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginSuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of LoginResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginSuccessImplCopyWith<_$LoginSuccessImpl> get copyWith =>
      __$$LoginSuccessImplCopyWithImpl<_$LoginSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthUser user) success,
    required TResult Function() invalidCredentials,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthUser user)? success,
    TResult? Function()? invalidCredentials,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthUser user)? success,
    TResult Function()? invalidCredentials,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginInvalidCredentials value) invalidCredentials,
    required TResult Function(LoginNetworkError value) networkError,
    required TResult Function(LoginServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginInvalidCredentials value)? invalidCredentials,
    TResult? Function(LoginNetworkError value)? networkError,
    TResult? Function(LoginServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginInvalidCredentials value)? invalidCredentials,
    TResult Function(LoginNetworkError value)? networkError,
    TResult Function(LoginServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoginSuccess implements LoginResult {
  const factory LoginSuccess(final AuthUser user) = _$LoginSuccessImpl;

  AuthUser get user;

  /// Create a copy of LoginResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginSuccessImplCopyWith<_$LoginSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginInvalidCredentialsImplCopyWith<$Res> {
  factory _$$LoginInvalidCredentialsImplCopyWith(
    _$LoginInvalidCredentialsImpl value,
    $Res Function(_$LoginInvalidCredentialsImpl) then,
  ) = __$$LoginInvalidCredentialsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginInvalidCredentialsImplCopyWithImpl<$Res>
    extends _$LoginResultCopyWithImpl<$Res, _$LoginInvalidCredentialsImpl>
    implements _$$LoginInvalidCredentialsImplCopyWith<$Res> {
  __$$LoginInvalidCredentialsImplCopyWithImpl(
    _$LoginInvalidCredentialsImpl _value,
    $Res Function(_$LoginInvalidCredentialsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginInvalidCredentialsImpl implements LoginInvalidCredentials {
  const _$LoginInvalidCredentialsImpl();

  @override
  String toString() {
    return 'LoginResult.invalidCredentials()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginInvalidCredentialsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthUser user) success,
    required TResult Function() invalidCredentials,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return invalidCredentials();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthUser user)? success,
    TResult? Function()? invalidCredentials,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return invalidCredentials?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthUser user)? success,
    TResult Function()? invalidCredentials,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginInvalidCredentials value) invalidCredentials,
    required TResult Function(LoginNetworkError value) networkError,
    required TResult Function(LoginServerError value) serverError,
  }) {
    return invalidCredentials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginInvalidCredentials value)? invalidCredentials,
    TResult? Function(LoginNetworkError value)? networkError,
    TResult? Function(LoginServerError value)? serverError,
  }) {
    return invalidCredentials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginInvalidCredentials value)? invalidCredentials,
    TResult Function(LoginNetworkError value)? networkError,
    TResult Function(LoginServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(this);
    }
    return orElse();
  }
}

abstract class LoginInvalidCredentials implements LoginResult {
  const factory LoginInvalidCredentials() = _$LoginInvalidCredentialsImpl;
}

/// @nodoc
abstract class _$$LoginNetworkErrorImplCopyWith<$Res> {
  factory _$$LoginNetworkErrorImplCopyWith(
    _$LoginNetworkErrorImpl value,
    $Res Function(_$LoginNetworkErrorImpl) then,
  ) = __$$LoginNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginNetworkErrorImplCopyWithImpl<$Res>
    extends _$LoginResultCopyWithImpl<$Res, _$LoginNetworkErrorImpl>
    implements _$$LoginNetworkErrorImplCopyWith<$Res> {
  __$$LoginNetworkErrorImplCopyWithImpl(
    _$LoginNetworkErrorImpl _value,
    $Res Function(_$LoginNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginNetworkErrorImpl implements LoginNetworkError {
  const _$LoginNetworkErrorImpl();

  @override
  String toString() {
    return 'LoginResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthUser user) success,
    required TResult Function() invalidCredentials,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthUser user)? success,
    TResult? Function()? invalidCredentials,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthUser user)? success,
    TResult Function()? invalidCredentials,
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
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginInvalidCredentials value) invalidCredentials,
    required TResult Function(LoginNetworkError value) networkError,
    required TResult Function(LoginServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginInvalidCredentials value)? invalidCredentials,
    TResult? Function(LoginNetworkError value)? networkError,
    TResult? Function(LoginServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginInvalidCredentials value)? invalidCredentials,
    TResult Function(LoginNetworkError value)? networkError,
    TResult Function(LoginServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class LoginNetworkError implements LoginResult {
  const factory LoginNetworkError() = _$LoginNetworkErrorImpl;
}

/// @nodoc
abstract class _$$LoginServerErrorImplCopyWith<$Res> {
  factory _$$LoginServerErrorImplCopyWith(
    _$LoginServerErrorImpl value,
    $Res Function(_$LoginServerErrorImpl) then,
  ) = __$$LoginServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginServerErrorImplCopyWithImpl<$Res>
    extends _$LoginResultCopyWithImpl<$Res, _$LoginServerErrorImpl>
    implements _$$LoginServerErrorImplCopyWith<$Res> {
  __$$LoginServerErrorImplCopyWithImpl(
    _$LoginServerErrorImpl _value,
    $Res Function(_$LoginServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginServerErrorImpl implements LoginServerError {
  const _$LoginServerErrorImpl();

  @override
  String toString() {
    return 'LoginResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthUser user) success,
    required TResult Function() invalidCredentials,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthUser user)? success,
    TResult? Function()? invalidCredentials,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthUser user)? success,
    TResult Function()? invalidCredentials,
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
    required TResult Function(LoginSuccess value) success,
    required TResult Function(LoginInvalidCredentials value) invalidCredentials,
    required TResult Function(LoginNetworkError value) networkError,
    required TResult Function(LoginServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginSuccess value)? success,
    TResult? Function(LoginInvalidCredentials value)? invalidCredentials,
    TResult? Function(LoginNetworkError value)? networkError,
    TResult? Function(LoginServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginSuccess value)? success,
    TResult Function(LoginInvalidCredentials value)? invalidCredentials,
    TResult Function(LoginNetworkError value)? networkError,
    TResult Function(LoginServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class LoginServerError implements LoginResult {
  const factory LoginServerError() = _$LoginServerErrorImpl;
}
