// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? failedReason)
        $default, {
    required TResult Function() loading,
    required TResult Function() signUpSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? email, String? password, String? alphavantageKey,
            String? failedReason)?
        $default, {
    TResult? Function()? loading,
    TResult? Function()? signUpSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? failedReason)?
        $default, {
    TResult Function()? loading,
    TResult Function()? signUpSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignUpState value) $default, {
    required TResult Function(_SignUpStateLoading value) loading,
    required TResult Function(_SignUpStateSignUpSuccess value) signUpSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignUpState value)? $default, {
    TResult? Function(_SignUpStateLoading value)? loading,
    TResult? Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignUpState value)? $default, {
    TResult Function(_SignUpStateLoading value)? loading,
    TResult Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SignUpStateCopyWith<$Res> {
  factory _$$_SignUpStateCopyWith(
          _$_SignUpState value, $Res Function(_$_SignUpState) then) =
      __$$_SignUpStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? email,
      String? password,
      String? alphavantageKey,
      String? failedReason});
}

/// @nodoc
class __$$_SignUpStateCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$_SignUpState>
    implements _$$_SignUpStateCopyWith<$Res> {
  __$$_SignUpStateCopyWithImpl(
      _$_SignUpState _value, $Res Function(_$_SignUpState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? alphavantageKey = freezed,
    Object? failedReason = freezed,
  }) {
    return _then(_$_SignUpState(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      alphavantageKey: freezed == alphavantageKey
          ? _value.alphavantageKey
          : alphavantageKey // ignore: cast_nullable_to_non_nullable
              as String?,
      failedReason: freezed == failedReason
          ? _value.failedReason
          : failedReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SignUpState implements _SignUpState {
  _$_SignUpState(
      {required this.email,
      required this.password,
      required this.alphavantageKey,
      required this.failedReason});

  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? alphavantageKey;
  @override
  final String? failedReason;

  @override
  String toString() {
    return 'SignUpState(email: $email, password: $password, alphavantageKey: $alphavantageKey, failedReason: $failedReason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.alphavantageKey, alphavantageKey) ||
                other.alphavantageKey == alphavantageKey) &&
            (identical(other.failedReason, failedReason) ||
                other.failedReason == failedReason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, alphavantageKey, failedReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      __$$_SignUpStateCopyWithImpl<_$_SignUpState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? failedReason)
        $default, {
    required TResult Function() loading,
    required TResult Function() signUpSuccess,
  }) {
    return $default(email, password, alphavantageKey, failedReason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? email, String? password, String? alphavantageKey,
            String? failedReason)?
        $default, {
    TResult? Function()? loading,
    TResult? Function()? signUpSuccess,
  }) {
    return $default?.call(email, password, alphavantageKey, failedReason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? failedReason)?
        $default, {
    TResult Function()? loading,
    TResult Function()? signUpSuccess,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(email, password, alphavantageKey, failedReason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignUpState value) $default, {
    required TResult Function(_SignUpStateLoading value) loading,
    required TResult Function(_SignUpStateSignUpSuccess value) signUpSuccess,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignUpState value)? $default, {
    TResult? Function(_SignUpStateLoading value)? loading,
    TResult? Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignUpState value)? $default, {
    TResult Function(_SignUpStateLoading value)? loading,
    TResult Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _SignUpState implements SignUpState {
  factory _SignUpState(
      {required final String? email,
      required final String? password,
      required final String? alphavantageKey,
      required final String? failedReason}) = _$_SignUpState;

  String? get email;
  String? get password;
  String? get alphavantageKey;
  String? get failedReason;
  @JsonKey(ignore: true)
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignUpStateLoadingCopyWith<$Res> {
  factory _$$_SignUpStateLoadingCopyWith(_$_SignUpStateLoading value,
          $Res Function(_$_SignUpStateLoading) then) =
      __$$_SignUpStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignUpStateLoadingCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$_SignUpStateLoading>
    implements _$$_SignUpStateLoadingCopyWith<$Res> {
  __$$_SignUpStateLoadingCopyWithImpl(
      _$_SignUpStateLoading _value, $Res Function(_$_SignUpStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignUpStateLoading implements _SignUpStateLoading {
  _$_SignUpStateLoading();

  @override
  String toString() {
    return 'SignUpState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignUpStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? failedReason)
        $default, {
    required TResult Function() loading,
    required TResult Function() signUpSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? email, String? password, String? alphavantageKey,
            String? failedReason)?
        $default, {
    TResult? Function()? loading,
    TResult? Function()? signUpSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? failedReason)?
        $default, {
    TResult Function()? loading,
    TResult Function()? signUpSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignUpState value) $default, {
    required TResult Function(_SignUpStateLoading value) loading,
    required TResult Function(_SignUpStateSignUpSuccess value) signUpSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignUpState value)? $default, {
    TResult? Function(_SignUpStateLoading value)? loading,
    TResult? Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignUpState value)? $default, {
    TResult Function(_SignUpStateLoading value)? loading,
    TResult Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SignUpStateLoading implements SignUpState {
  factory _SignUpStateLoading() = _$_SignUpStateLoading;
}

/// @nodoc
abstract class _$$_SignUpStateSignUpSuccessCopyWith<$Res> {
  factory _$$_SignUpStateSignUpSuccessCopyWith(
          _$_SignUpStateSignUpSuccess value,
          $Res Function(_$_SignUpStateSignUpSuccess) then) =
      __$$_SignUpStateSignUpSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignUpStateSignUpSuccessCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$_SignUpStateSignUpSuccess>
    implements _$$_SignUpStateSignUpSuccessCopyWith<$Res> {
  __$$_SignUpStateSignUpSuccessCopyWithImpl(_$_SignUpStateSignUpSuccess _value,
      $Res Function(_$_SignUpStateSignUpSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignUpStateSignUpSuccess implements _SignUpStateSignUpSuccess {
  _$_SignUpStateSignUpSuccess();

  @override
  String toString() {
    return 'SignUpState.signUpSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpStateSignUpSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? failedReason)
        $default, {
    required TResult Function() loading,
    required TResult Function() signUpSuccess,
  }) {
    return signUpSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? email, String? password, String? alphavantageKey,
            String? failedReason)?
        $default, {
    TResult? Function()? loading,
    TResult? Function()? signUpSuccess,
  }) {
    return signUpSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? failedReason)?
        $default, {
    TResult Function()? loading,
    TResult Function()? signUpSuccess,
    required TResult orElse(),
  }) {
    if (signUpSuccess != null) {
      return signUpSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignUpState value) $default, {
    required TResult Function(_SignUpStateLoading value) loading,
    required TResult Function(_SignUpStateSignUpSuccess value) signUpSuccess,
  }) {
    return signUpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignUpState value)? $default, {
    TResult? Function(_SignUpStateLoading value)? loading,
    TResult? Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
  }) {
    return signUpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignUpState value)? $default, {
    TResult Function(_SignUpStateLoading value)? loading,
    TResult Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
    required TResult orElse(),
  }) {
    if (signUpSuccess != null) {
      return signUpSuccess(this);
    }
    return orElse();
  }
}

abstract class _SignUpStateSignUpSuccess implements SignUpState {
  factory _SignUpStateSignUpSuccess() = _$_SignUpStateSignUpSuccess;
}
