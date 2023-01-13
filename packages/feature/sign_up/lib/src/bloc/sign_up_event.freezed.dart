// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String alphavantageKey) alphavantageKeyChanged,
    required TResult Function() signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String alphavantageKey)? alphavantageKeyChanged,
    TResult? Function()? signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String alphavantageKey)? alphavantageKeyChanged,
    TResult Function()? signUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpEventEventEmailChanged value) emailChanged,
    required TResult Function(SignUpEventPasswordChanged value) passwordChanged,
    required TResult Function(SignUpEventAlphavantageKeyChanged value)
        alphavantageKeyChanged,
    required TResult Function(SignUpEventSignUp value) signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpEventEventEmailChanged value)? emailChanged,
    TResult? Function(SignUpEventPasswordChanged value)? passwordChanged,
    TResult? Function(SignUpEventAlphavantageKeyChanged value)?
        alphavantageKeyChanged,
    TResult? Function(SignUpEventSignUp value)? signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpEventEventEmailChanged value)? emailChanged,
    TResult Function(SignUpEventPasswordChanged value)? passwordChanged,
    TResult Function(SignUpEventAlphavantageKeyChanged value)?
        alphavantageKeyChanged,
    TResult Function(SignUpEventSignUp value)? signUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) then) =
      _$SignUpEventCopyWithImpl<$Res, SignUpEvent>;
}

/// @nodoc
class _$SignUpEventCopyWithImpl<$Res, $Val extends SignUpEvent>
    implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignUpEventEventEmailChangedCopyWith<$Res> {
  factory _$$SignUpEventEventEmailChangedCopyWith(
          _$SignUpEventEventEmailChanged value,
          $Res Function(_$SignUpEventEventEmailChanged) then) =
      __$$SignUpEventEventEmailChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SignUpEventEventEmailChangedCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SignUpEventEventEmailChanged>
    implements _$$SignUpEventEventEmailChangedCopyWith<$Res> {
  __$$SignUpEventEventEmailChangedCopyWithImpl(
      _$SignUpEventEventEmailChanged _value,
      $Res Function(_$SignUpEventEventEmailChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SignUpEventEventEmailChanged(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpEventEventEmailChanged implements SignUpEventEventEmailChanged {
  _$SignUpEventEventEmailChanged(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'SignUpEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpEventEventEmailChanged &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpEventEventEmailChangedCopyWith<_$SignUpEventEventEmailChanged>
      get copyWith => __$$SignUpEventEventEmailChangedCopyWithImpl<
          _$SignUpEventEventEmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String alphavantageKey) alphavantageKeyChanged,
    required TResult Function() signUp,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String alphavantageKey)? alphavantageKeyChanged,
    TResult? Function()? signUp,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String alphavantageKey)? alphavantageKeyChanged,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpEventEventEmailChanged value) emailChanged,
    required TResult Function(SignUpEventPasswordChanged value) passwordChanged,
    required TResult Function(SignUpEventAlphavantageKeyChanged value)
        alphavantageKeyChanged,
    required TResult Function(SignUpEventSignUp value) signUp,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpEventEventEmailChanged value)? emailChanged,
    TResult? Function(SignUpEventPasswordChanged value)? passwordChanged,
    TResult? Function(SignUpEventAlphavantageKeyChanged value)?
        alphavantageKeyChanged,
    TResult? Function(SignUpEventSignUp value)? signUp,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpEventEventEmailChanged value)? emailChanged,
    TResult Function(SignUpEventPasswordChanged value)? passwordChanged,
    TResult Function(SignUpEventAlphavantageKeyChanged value)?
        alphavantageKeyChanged,
    TResult Function(SignUpEventSignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class SignUpEventEventEmailChanged implements SignUpEvent {
  factory SignUpEventEventEmailChanged(final String email) =
      _$SignUpEventEventEmailChanged;

  String get email;
  @JsonKey(ignore: true)
  _$$SignUpEventEventEmailChangedCopyWith<_$SignUpEventEventEmailChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpEventPasswordChangedCopyWith<$Res> {
  factory _$$SignUpEventPasswordChangedCopyWith(
          _$SignUpEventPasswordChanged value,
          $Res Function(_$SignUpEventPasswordChanged) then) =
      __$$SignUpEventPasswordChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$SignUpEventPasswordChangedCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SignUpEventPasswordChanged>
    implements _$$SignUpEventPasswordChangedCopyWith<$Res> {
  __$$SignUpEventPasswordChangedCopyWithImpl(
      _$SignUpEventPasswordChanged _value,
      $Res Function(_$SignUpEventPasswordChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$SignUpEventPasswordChanged(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpEventPasswordChanged implements SignUpEventPasswordChanged {
  _$SignUpEventPasswordChanged(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'SignUpEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpEventPasswordChanged &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpEventPasswordChangedCopyWith<_$SignUpEventPasswordChanged>
      get copyWith => __$$SignUpEventPasswordChangedCopyWithImpl<
          _$SignUpEventPasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String alphavantageKey) alphavantageKeyChanged,
    required TResult Function() signUp,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String alphavantageKey)? alphavantageKeyChanged,
    TResult? Function()? signUp,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String alphavantageKey)? alphavantageKeyChanged,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpEventEventEmailChanged value) emailChanged,
    required TResult Function(SignUpEventPasswordChanged value) passwordChanged,
    required TResult Function(SignUpEventAlphavantageKeyChanged value)
        alphavantageKeyChanged,
    required TResult Function(SignUpEventSignUp value) signUp,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpEventEventEmailChanged value)? emailChanged,
    TResult? Function(SignUpEventPasswordChanged value)? passwordChanged,
    TResult? Function(SignUpEventAlphavantageKeyChanged value)?
        alphavantageKeyChanged,
    TResult? Function(SignUpEventSignUp value)? signUp,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpEventEventEmailChanged value)? emailChanged,
    TResult Function(SignUpEventPasswordChanged value)? passwordChanged,
    TResult Function(SignUpEventAlphavantageKeyChanged value)?
        alphavantageKeyChanged,
    TResult Function(SignUpEventSignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class SignUpEventPasswordChanged implements SignUpEvent {
  factory SignUpEventPasswordChanged(final String password) =
      _$SignUpEventPasswordChanged;

  String get password;
  @JsonKey(ignore: true)
  _$$SignUpEventPasswordChangedCopyWith<_$SignUpEventPasswordChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpEventAlphavantageKeyChangedCopyWith<$Res> {
  factory _$$SignUpEventAlphavantageKeyChangedCopyWith(
          _$SignUpEventAlphavantageKeyChanged value,
          $Res Function(_$SignUpEventAlphavantageKeyChanged) then) =
      __$$SignUpEventAlphavantageKeyChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String alphavantageKey});
}

/// @nodoc
class __$$SignUpEventAlphavantageKeyChangedCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SignUpEventAlphavantageKeyChanged>
    implements _$$SignUpEventAlphavantageKeyChangedCopyWith<$Res> {
  __$$SignUpEventAlphavantageKeyChangedCopyWithImpl(
      _$SignUpEventAlphavantageKeyChanged _value,
      $Res Function(_$SignUpEventAlphavantageKeyChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alphavantageKey = null,
  }) {
    return _then(_$SignUpEventAlphavantageKeyChanged(
      null == alphavantageKey
          ? _value.alphavantageKey
          : alphavantageKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpEventAlphavantageKeyChanged
    implements SignUpEventAlphavantageKeyChanged {
  _$SignUpEventAlphavantageKeyChanged(this.alphavantageKey);

  @override
  final String alphavantageKey;

  @override
  String toString() {
    return 'SignUpEvent.alphavantageKeyChanged(alphavantageKey: $alphavantageKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpEventAlphavantageKeyChanged &&
            (identical(other.alphavantageKey, alphavantageKey) ||
                other.alphavantageKey == alphavantageKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, alphavantageKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpEventAlphavantageKeyChangedCopyWith<
          _$SignUpEventAlphavantageKeyChanged>
      get copyWith => __$$SignUpEventAlphavantageKeyChangedCopyWithImpl<
          _$SignUpEventAlphavantageKeyChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String alphavantageKey) alphavantageKeyChanged,
    required TResult Function() signUp,
  }) {
    return alphavantageKeyChanged(alphavantageKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String alphavantageKey)? alphavantageKeyChanged,
    TResult? Function()? signUp,
  }) {
    return alphavantageKeyChanged?.call(alphavantageKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String alphavantageKey)? alphavantageKeyChanged,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (alphavantageKeyChanged != null) {
      return alphavantageKeyChanged(alphavantageKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpEventEventEmailChanged value) emailChanged,
    required TResult Function(SignUpEventPasswordChanged value) passwordChanged,
    required TResult Function(SignUpEventAlphavantageKeyChanged value)
        alphavantageKeyChanged,
    required TResult Function(SignUpEventSignUp value) signUp,
  }) {
    return alphavantageKeyChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpEventEventEmailChanged value)? emailChanged,
    TResult? Function(SignUpEventPasswordChanged value)? passwordChanged,
    TResult? Function(SignUpEventAlphavantageKeyChanged value)?
        alphavantageKeyChanged,
    TResult? Function(SignUpEventSignUp value)? signUp,
  }) {
    return alphavantageKeyChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpEventEventEmailChanged value)? emailChanged,
    TResult Function(SignUpEventPasswordChanged value)? passwordChanged,
    TResult Function(SignUpEventAlphavantageKeyChanged value)?
        alphavantageKeyChanged,
    TResult Function(SignUpEventSignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (alphavantageKeyChanged != null) {
      return alphavantageKeyChanged(this);
    }
    return orElse();
  }
}

abstract class SignUpEventAlphavantageKeyChanged implements SignUpEvent {
  factory SignUpEventAlphavantageKeyChanged(final String alphavantageKey) =
      _$SignUpEventAlphavantageKeyChanged;

  String get alphavantageKey;
  @JsonKey(ignore: true)
  _$$SignUpEventAlphavantageKeyChangedCopyWith<
          _$SignUpEventAlphavantageKeyChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpEventSignUpCopyWith<$Res> {
  factory _$$SignUpEventSignUpCopyWith(
          _$SignUpEventSignUp value, $Res Function(_$SignUpEventSignUp) then) =
      __$$SignUpEventSignUpCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpEventSignUpCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SignUpEventSignUp>
    implements _$$SignUpEventSignUpCopyWith<$Res> {
  __$$SignUpEventSignUpCopyWithImpl(
      _$SignUpEventSignUp _value, $Res Function(_$SignUpEventSignUp) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignUpEventSignUp implements SignUpEventSignUp {
  _$SignUpEventSignUp();

  @override
  String toString() {
    return 'SignUpEvent.signUp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpEventSignUp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String alphavantageKey) alphavantageKeyChanged,
    required TResult Function() signUp,
  }) {
    return signUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String alphavantageKey)? alphavantageKeyChanged,
    TResult? Function()? signUp,
  }) {
    return signUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String alphavantageKey)? alphavantageKeyChanged,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpEventEventEmailChanged value) emailChanged,
    required TResult Function(SignUpEventPasswordChanged value) passwordChanged,
    required TResult Function(SignUpEventAlphavantageKeyChanged value)
        alphavantageKeyChanged,
    required TResult Function(SignUpEventSignUp value) signUp,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpEventEventEmailChanged value)? emailChanged,
    TResult? Function(SignUpEventPasswordChanged value)? passwordChanged,
    TResult? Function(SignUpEventAlphavantageKeyChanged value)?
        alphavantageKeyChanged,
    TResult? Function(SignUpEventSignUp value)? signUp,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpEventEventEmailChanged value)? emailChanged,
    TResult Function(SignUpEventPasswordChanged value)? passwordChanged,
    TResult Function(SignUpEventAlphavantageKeyChanged value)?
        alphavantageKeyChanged,
    TResult Function(SignUpEventSignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class SignUpEventSignUp implements SignUpEvent {
  factory SignUpEventSignUp() = _$SignUpEventSignUp;
}
