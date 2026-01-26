// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_lounge_post_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CreateLoungePostResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int postId) success,
    required TResult Function(String message) validationError,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int postId)? success,
    TResult? Function(String message)? validationError,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int postId)? success,
    TResult Function(String message)? validationError,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateLoungePostSuccess value) success,
    required TResult Function(CreateLoungePostValidationError value)
    validationError,
    required TResult Function(CreateLoungePostNetworkError value) networkError,
    required TResult Function(CreateLoungePostServerError value) serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateLoungePostSuccess value)? success,
    TResult? Function(CreateLoungePostValidationError value)? validationError,
    TResult? Function(CreateLoungePostNetworkError value)? networkError,
    TResult? Function(CreateLoungePostServerError value)? serverError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateLoungePostSuccess value)? success,
    TResult Function(CreateLoungePostValidationError value)? validationError,
    TResult Function(CreateLoungePostNetworkError value)? networkError,
    TResult Function(CreateLoungePostServerError value)? serverError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateLoungePostResultCopyWith<$Res> {
  factory $CreateLoungePostResultCopyWith(
    CreateLoungePostResult value,
    $Res Function(CreateLoungePostResult) then,
  ) = _$CreateLoungePostResultCopyWithImpl<$Res, CreateLoungePostResult>;
}

/// @nodoc
class _$CreateLoungePostResultCopyWithImpl<
  $Res,
  $Val extends CreateLoungePostResult
>
    implements $CreateLoungePostResultCopyWith<$Res> {
  _$CreateLoungePostResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateLoungePostResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateLoungePostSuccessImplCopyWith<$Res> {
  factory _$$CreateLoungePostSuccessImplCopyWith(
    _$CreateLoungePostSuccessImpl value,
    $Res Function(_$CreateLoungePostSuccessImpl) then,
  ) = __$$CreateLoungePostSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int postId});
}

/// @nodoc
class __$$CreateLoungePostSuccessImplCopyWithImpl<$Res>
    extends
        _$CreateLoungePostResultCopyWithImpl<
          $Res,
          _$CreateLoungePostSuccessImpl
        >
    implements _$$CreateLoungePostSuccessImplCopyWith<$Res> {
  __$$CreateLoungePostSuccessImplCopyWithImpl(
    _$CreateLoungePostSuccessImpl _value,
    $Res Function(_$CreateLoungePostSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateLoungePostResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? postId = null}) {
    return _then(
      _$CreateLoungePostSuccessImpl(
        null == postId
            ? _value.postId
            : postId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$CreateLoungePostSuccessImpl implements CreateLoungePostSuccess {
  const _$CreateLoungePostSuccessImpl(this.postId);

  @override
  final int postId;

  @override
  String toString() {
    return 'CreateLoungePostResult.success(postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateLoungePostSuccessImpl &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  /// Create a copy of CreateLoungePostResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateLoungePostSuccessImplCopyWith<_$CreateLoungePostSuccessImpl>
  get copyWith =>
      __$$CreateLoungePostSuccessImplCopyWithImpl<
        _$CreateLoungePostSuccessImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int postId) success,
    required TResult Function(String message) validationError,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return success(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int postId)? success,
    TResult? Function(String message)? validationError,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return success?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int postId)? success,
    TResult Function(String message)? validationError,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateLoungePostSuccess value) success,
    required TResult Function(CreateLoungePostValidationError value)
    validationError,
    required TResult Function(CreateLoungePostNetworkError value) networkError,
    required TResult Function(CreateLoungePostServerError value) serverError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateLoungePostSuccess value)? success,
    TResult? Function(CreateLoungePostValidationError value)? validationError,
    TResult? Function(CreateLoungePostNetworkError value)? networkError,
    TResult? Function(CreateLoungePostServerError value)? serverError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateLoungePostSuccess value)? success,
    TResult Function(CreateLoungePostValidationError value)? validationError,
    TResult Function(CreateLoungePostNetworkError value)? networkError,
    TResult Function(CreateLoungePostServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CreateLoungePostSuccess implements CreateLoungePostResult {
  const factory CreateLoungePostSuccess(final int postId) =
      _$CreateLoungePostSuccessImpl;

  int get postId;

  /// Create a copy of CreateLoungePostResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateLoungePostSuccessImplCopyWith<_$CreateLoungePostSuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateLoungePostValidationErrorImplCopyWith<$Res> {
  factory _$$CreateLoungePostValidationErrorImplCopyWith(
    _$CreateLoungePostValidationErrorImpl value,
    $Res Function(_$CreateLoungePostValidationErrorImpl) then,
  ) = __$$CreateLoungePostValidationErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CreateLoungePostValidationErrorImplCopyWithImpl<$Res>
    extends
        _$CreateLoungePostResultCopyWithImpl<
          $Res,
          _$CreateLoungePostValidationErrorImpl
        >
    implements _$$CreateLoungePostValidationErrorImplCopyWith<$Res> {
  __$$CreateLoungePostValidationErrorImplCopyWithImpl(
    _$CreateLoungePostValidationErrorImpl _value,
    $Res Function(_$CreateLoungePostValidationErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateLoungePostResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$CreateLoungePostValidationErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CreateLoungePostValidationErrorImpl
    implements CreateLoungePostValidationError {
  const _$CreateLoungePostValidationErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CreateLoungePostResult.validationError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateLoungePostValidationErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of CreateLoungePostResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateLoungePostValidationErrorImplCopyWith<
    _$CreateLoungePostValidationErrorImpl
  >
  get copyWith =>
      __$$CreateLoungePostValidationErrorImplCopyWithImpl<
        _$CreateLoungePostValidationErrorImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int postId) success,
    required TResult Function(String message) validationError,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return validationError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int postId)? success,
    TResult? Function(String message)? validationError,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return validationError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int postId)? success,
    TResult Function(String message)? validationError,
    TResult Function()? networkError,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateLoungePostSuccess value) success,
    required TResult Function(CreateLoungePostValidationError value)
    validationError,
    required TResult Function(CreateLoungePostNetworkError value) networkError,
    required TResult Function(CreateLoungePostServerError value) serverError,
  }) {
    return validationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateLoungePostSuccess value)? success,
    TResult? Function(CreateLoungePostValidationError value)? validationError,
    TResult? Function(CreateLoungePostNetworkError value)? networkError,
    TResult? Function(CreateLoungePostServerError value)? serverError,
  }) {
    return validationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateLoungePostSuccess value)? success,
    TResult Function(CreateLoungePostValidationError value)? validationError,
    TResult Function(CreateLoungePostNetworkError value)? networkError,
    TResult Function(CreateLoungePostServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError(this);
    }
    return orElse();
  }
}

abstract class CreateLoungePostValidationError
    implements CreateLoungePostResult {
  const factory CreateLoungePostValidationError(final String message) =
      _$CreateLoungePostValidationErrorImpl;

  String get message;

  /// Create a copy of CreateLoungePostResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateLoungePostValidationErrorImplCopyWith<
    _$CreateLoungePostValidationErrorImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateLoungePostNetworkErrorImplCopyWith<$Res> {
  factory _$$CreateLoungePostNetworkErrorImplCopyWith(
    _$CreateLoungePostNetworkErrorImpl value,
    $Res Function(_$CreateLoungePostNetworkErrorImpl) then,
  ) = __$$CreateLoungePostNetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateLoungePostNetworkErrorImplCopyWithImpl<$Res>
    extends
        _$CreateLoungePostResultCopyWithImpl<
          $Res,
          _$CreateLoungePostNetworkErrorImpl
        >
    implements _$$CreateLoungePostNetworkErrorImplCopyWith<$Res> {
  __$$CreateLoungePostNetworkErrorImplCopyWithImpl(
    _$CreateLoungePostNetworkErrorImpl _value,
    $Res Function(_$CreateLoungePostNetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateLoungePostResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreateLoungePostNetworkErrorImpl
    implements CreateLoungePostNetworkError {
  const _$CreateLoungePostNetworkErrorImpl();

  @override
  String toString() {
    return 'CreateLoungePostResult.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateLoungePostNetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int postId) success,
    required TResult Function(String message) validationError,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int postId)? success,
    TResult? Function(String message)? validationError,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int postId)? success,
    TResult Function(String message)? validationError,
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
    required TResult Function(CreateLoungePostSuccess value) success,
    required TResult Function(CreateLoungePostValidationError value)
    validationError,
    required TResult Function(CreateLoungePostNetworkError value) networkError,
    required TResult Function(CreateLoungePostServerError value) serverError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateLoungePostSuccess value)? success,
    TResult? Function(CreateLoungePostValidationError value)? validationError,
    TResult? Function(CreateLoungePostNetworkError value)? networkError,
    TResult? Function(CreateLoungePostServerError value)? serverError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateLoungePostSuccess value)? success,
    TResult Function(CreateLoungePostValidationError value)? validationError,
    TResult Function(CreateLoungePostNetworkError value)? networkError,
    TResult Function(CreateLoungePostServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class CreateLoungePostNetworkError implements CreateLoungePostResult {
  const factory CreateLoungePostNetworkError() =
      _$CreateLoungePostNetworkErrorImpl;
}

/// @nodoc
abstract class _$$CreateLoungePostServerErrorImplCopyWith<$Res> {
  factory _$$CreateLoungePostServerErrorImplCopyWith(
    _$CreateLoungePostServerErrorImpl value,
    $Res Function(_$CreateLoungePostServerErrorImpl) then,
  ) = __$$CreateLoungePostServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateLoungePostServerErrorImplCopyWithImpl<$Res>
    extends
        _$CreateLoungePostResultCopyWithImpl<
          $Res,
          _$CreateLoungePostServerErrorImpl
        >
    implements _$$CreateLoungePostServerErrorImplCopyWith<$Res> {
  __$$CreateLoungePostServerErrorImplCopyWithImpl(
    _$CreateLoungePostServerErrorImpl _value,
    $Res Function(_$CreateLoungePostServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateLoungePostResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreateLoungePostServerErrorImpl implements CreateLoungePostServerError {
  const _$CreateLoungePostServerErrorImpl();

  @override
  String toString() {
    return 'CreateLoungePostResult.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateLoungePostServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int postId) success,
    required TResult Function(String message) validationError,
    required TResult Function() networkError,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int postId)? success,
    TResult? Function(String message)? validationError,
    TResult? Function()? networkError,
    TResult? Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int postId)? success,
    TResult Function(String message)? validationError,
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
    required TResult Function(CreateLoungePostSuccess value) success,
    required TResult Function(CreateLoungePostValidationError value)
    validationError,
    required TResult Function(CreateLoungePostNetworkError value) networkError,
    required TResult Function(CreateLoungePostServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateLoungePostSuccess value)? success,
    TResult? Function(CreateLoungePostValidationError value)? validationError,
    TResult? Function(CreateLoungePostNetworkError value)? networkError,
    TResult? Function(CreateLoungePostServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateLoungePostSuccess value)? success,
    TResult Function(CreateLoungePostValidationError value)? validationError,
    TResult Function(CreateLoungePostNetworkError value)? networkError,
    TResult Function(CreateLoungePostServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class CreateLoungePostServerError implements CreateLoungePostResult {
  const factory CreateLoungePostServerError() =
      _$CreateLoungePostServerErrorImpl;
}
