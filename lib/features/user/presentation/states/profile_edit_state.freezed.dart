// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfileEditState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get nickname =>
      throw _privateConstructorUsedError; // 画面には出さないが、更新APIの都合で保持しておく（モックのため）
  String get bio => throw _privateConstructorUsedError;
  String get currentPassword => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get passwordConfirm => throw _privateConstructorUsedError;
  String? get emailError => throw _privateConstructorUsedError;
  String? get nicknameError => throw _privateConstructorUsedError;
  String? get currentPasswordError => throw _privateConstructorUsedError;
  String? get passwordError => throw _privateConstructorUsedError;
  String? get passwordConfirmError => throw _privateConstructorUsedError;

  /// Create a copy of ProfileEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileEditStateCopyWith<ProfileEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditStateCopyWith<$Res> {
  factory $ProfileEditStateCopyWith(
    ProfileEditState value,
    $Res Function(ProfileEditState) then,
  ) = _$ProfileEditStateCopyWithImpl<$Res, ProfileEditState>;
  @useResult
  $Res call({
    bool isLoading,
    bool isSaving,
    String email,
    String nickname,
    String bio,
    String currentPassword,
    String password,
    String passwordConfirm,
    String? emailError,
    String? nicknameError,
    String? currentPasswordError,
    String? passwordError,
    String? passwordConfirmError,
  });
}

/// @nodoc
class _$ProfileEditStateCopyWithImpl<$Res, $Val extends ProfileEditState>
    implements $ProfileEditStateCopyWith<$Res> {
  _$ProfileEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? email = null,
    Object? nickname = null,
    Object? bio = null,
    Object? currentPassword = null,
    Object? password = null,
    Object? passwordConfirm = null,
    Object? emailError = freezed,
    Object? nicknameError = freezed,
    Object? currentPasswordError = freezed,
    Object? passwordError = freezed,
    Object? passwordConfirmError = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSaving: null == isSaving
                ? _value.isSaving
                : isSaving // ignore: cast_nullable_to_non_nullable
                      as bool,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            nickname: null == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                      as String,
            bio: null == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                      as String,
            currentPassword: null == currentPassword
                ? _value.currentPassword
                : currentPassword // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            passwordConfirm: null == passwordConfirm
                ? _value.passwordConfirm
                : passwordConfirm // ignore: cast_nullable_to_non_nullable
                      as String,
            emailError: freezed == emailError
                ? _value.emailError
                : emailError // ignore: cast_nullable_to_non_nullable
                      as String?,
            nicknameError: freezed == nicknameError
                ? _value.nicknameError
                : nicknameError // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentPasswordError: freezed == currentPasswordError
                ? _value.currentPasswordError
                : currentPasswordError // ignore: cast_nullable_to_non_nullable
                      as String?,
            passwordError: freezed == passwordError
                ? _value.passwordError
                : passwordError // ignore: cast_nullable_to_non_nullable
                      as String?,
            passwordConfirmError: freezed == passwordConfirmError
                ? _value.passwordConfirmError
                : passwordConfirmError // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileEditStateImplCopyWith<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  factory _$$ProfileEditStateImplCopyWith(
    _$ProfileEditStateImpl value,
    $Res Function(_$ProfileEditStateImpl) then,
  ) = __$$ProfileEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isSaving,
    String email,
    String nickname,
    String bio,
    String currentPassword,
    String password,
    String passwordConfirm,
    String? emailError,
    String? nicknameError,
    String? currentPasswordError,
    String? passwordError,
    String? passwordConfirmError,
  });
}

/// @nodoc
class __$$ProfileEditStateImplCopyWithImpl<$Res>
    extends _$ProfileEditStateCopyWithImpl<$Res, _$ProfileEditStateImpl>
    implements _$$ProfileEditStateImplCopyWith<$Res> {
  __$$ProfileEditStateImplCopyWithImpl(
    _$ProfileEditStateImpl _value,
    $Res Function(_$ProfileEditStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? email = null,
    Object? nickname = null,
    Object? bio = null,
    Object? currentPassword = null,
    Object? password = null,
    Object? passwordConfirm = null,
    Object? emailError = freezed,
    Object? nicknameError = freezed,
    Object? currentPasswordError = freezed,
    Object? passwordError = freezed,
    Object? passwordConfirmError = freezed,
  }) {
    return _then(
      _$ProfileEditStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSaving: null == isSaving
            ? _value.isSaving
            : isSaving // ignore: cast_nullable_to_non_nullable
                  as bool,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        nickname: null == nickname
            ? _value.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String,
        bio: null == bio
            ? _value.bio
            : bio // ignore: cast_nullable_to_non_nullable
                  as String,
        currentPassword: null == currentPassword
            ? _value.currentPassword
            : currentPassword // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        passwordConfirm: null == passwordConfirm
            ? _value.passwordConfirm
            : passwordConfirm // ignore: cast_nullable_to_non_nullable
                  as String,
        emailError: freezed == emailError
            ? _value.emailError
            : emailError // ignore: cast_nullable_to_non_nullable
                  as String?,
        nicknameError: freezed == nicknameError
            ? _value.nicknameError
            : nicknameError // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentPasswordError: freezed == currentPasswordError
            ? _value.currentPasswordError
            : currentPasswordError // ignore: cast_nullable_to_non_nullable
                  as String?,
        passwordError: freezed == passwordError
            ? _value.passwordError
            : passwordError // ignore: cast_nullable_to_non_nullable
                  as String?,
        passwordConfirmError: freezed == passwordConfirmError
            ? _value.passwordConfirmError
            : passwordConfirmError // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ProfileEditStateImpl implements _ProfileEditState {
  const _$ProfileEditStateImpl({
    this.isLoading = true,
    this.isSaving = false,
    this.email = '',
    this.nickname = '',
    this.bio = '',
    this.currentPassword = '',
    this.password = '',
    this.passwordConfirm = '',
    this.emailError,
    this.nicknameError,
    this.currentPasswordError,
    this.passwordError,
    this.passwordConfirmError,
  });

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String nickname;
  // 画面には出さないが、更新APIの都合で保持しておく（モックのため）
  @override
  @JsonKey()
  final String bio;
  @override
  @JsonKey()
  final String currentPassword;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String passwordConfirm;
  @override
  final String? emailError;
  @override
  final String? nicknameError;
  @override
  final String? currentPasswordError;
  @override
  final String? passwordError;
  @override
  final String? passwordConfirmError;

  @override
  String toString() {
    return 'ProfileEditState(isLoading: $isLoading, isSaving: $isSaving, email: $email, nickname: $nickname, bio: $bio, currentPassword: $currentPassword, password: $password, passwordConfirm: $passwordConfirm, emailError: $emailError, nicknameError: $nicknameError, currentPasswordError: $currentPasswordError, passwordError: $passwordError, passwordConfirmError: $passwordConfirmError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirm, passwordConfirm) ||
                other.passwordConfirm == passwordConfirm) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.nicknameError, nicknameError) ||
                other.nicknameError == nicknameError) &&
            (identical(other.currentPasswordError, currentPasswordError) ||
                other.currentPasswordError == currentPasswordError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.passwordConfirmError, passwordConfirmError) ||
                other.passwordConfirmError == passwordConfirmError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isSaving,
    email,
    nickname,
    bio,
    currentPassword,
    password,
    passwordConfirm,
    emailError,
    nicknameError,
    currentPasswordError,
    passwordError,
    passwordConfirmError,
  );

  /// Create a copy of ProfileEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEditStateImplCopyWith<_$ProfileEditStateImpl> get copyWith =>
      __$$ProfileEditStateImplCopyWithImpl<_$ProfileEditStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ProfileEditState implements ProfileEditState {
  const factory _ProfileEditState({
    final bool isLoading,
    final bool isSaving,
    final String email,
    final String nickname,
    final String bio,
    final String currentPassword,
    final String password,
    final String passwordConfirm,
    final String? emailError,
    final String? nicknameError,
    final String? currentPasswordError,
    final String? passwordError,
    final String? passwordConfirmError,
  }) = _$ProfileEditStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  String get email;
  @override
  String get nickname; // 画面には出さないが、更新APIの都合で保持しておく（モックのため）
  @override
  String get bio;
  @override
  String get currentPassword;
  @override
  String get password;
  @override
  String get passwordConfirm;
  @override
  String? get emailError;
  @override
  String? get nicknameError;
  @override
  String? get currentPasswordError;
  @override
  String? get passwordError;
  @override
  String? get passwordConfirmError;

  /// Create a copy of ProfileEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileEditStateImplCopyWith<_$ProfileEditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
