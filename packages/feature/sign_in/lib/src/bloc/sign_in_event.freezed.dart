// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEventEventEmailChanged value) emailChanged,
    required TResult Function(SignInEventPasswordChanged value) passwordChanged,
    required TResult Function(SignInEventSignIn value) signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEventEventEmailChanged value)? emailChanged,
    TResult? Function(SignInEventPasswordChanged value)? passwordChanged,
    TResult? Function(SignInEventSignIn value)? signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEventEventEmailChanged value)? emailChanged,
    TResult Function(SignInEventPasswordChanged value)? passwordChanged,
    TResult Function(SignInEventSignIn value)? signIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEventCopyWith<$Res> {
  factory $SignInEventCopyWith(
          SignInEvent value, $Res Function(SignInEvent) then) =
      _$SignInEventCopyWithImpl<$Res, SignInEvent>;
}

/// @nodoc
class _$SignInEventCopyWithImpl<$Res, $Val extends SignInEvent>
    implements $SignInEventCopyWith<$Res> {
  _$SignInEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignInEventEventEmailChangedCopyWith<$Res> {
  factory _$$SignInEventEventEmailChangedCopyWith(
          _$SignInEventEventEmailChanged value,
          $Res Function(_$SignInEventEventEmailChanged) then) =
      __$$SignInEventEventEmailChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SignInEventEventEmailChangedCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$SignInEventEventEmailChanged>
    implements _$$SignInEventEventEmailChangedCopyWith<$Res> {
  __$$SignInEventEventEmailChangedCopyWithImpl(
      _$SignInEventEventEmailChanged _value,
      $Res Function(_$SignInEventEventEmailChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SignInEventEventEmailChanged(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInEventEventEmailChanged implements SignInEventEventEmailChanged {
  _$SignInEventEventEmailChanged(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'SignInEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInEventEventEmailChanged &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInEventEventEmailChangedCopyWith<_$SignInEventEventEmailChanged>
      get copyWith => __$$SignInEventEventEmailChangedCopyWithImpl<
          _$SignInEventEventEmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signIn,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? signIn,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
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
    required TResult Function(SignInEventEventEmailChanged value) emailChanged,
    required TResult Function(SignInEventPasswordChanged value) passwordChanged,
    required TResult Function(SignInEventSignIn value) signIn,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEventEventEmailChanged value)? emailChanged,
    TResult? Function(SignInEventPasswordChanged value)? passwordChanged,
    TResult? Function(SignInEventSignIn value)? signIn,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEventEventEmailChanged value)? emailChanged,
    TResult Function(SignInEventPasswordChanged value)? passwordChanged,
    TResult Function(SignInEventSignIn value)? signIn,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class SignInEventEventEmailChanged implements SignInEvent {
  factory SignInEventEventEmailChanged(final String email) =
      _$SignInEventEventEmailChanged;

  String get email;
  @JsonKey(ignore: true)
  _$$SignInEventEventEmailChangedCopyWith<_$SignInEventEventEmailChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInEventPasswordChangedCopyWith<$Res> {
  factory _$$SignInEventPasswordChangedCopyWith(
          _$SignInEventPasswordChanged value,
          $Res Function(_$SignInEventPasswordChanged) then) =
      __$$SignInEventPasswordChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$SignInEventPasswordChangedCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$SignInEventPasswordChanged>
    implements _$$SignInEventPasswordChangedCopyWith<$Res> {
  __$$SignInEventPasswordChangedCopyWithImpl(
      _$SignInEventPasswordChanged _value,
      $Res Function(_$SignInEventPasswordChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$SignInEventPasswordChanged(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInEventPasswordChanged implements SignInEventPasswordChanged {
  _$SignInEventPasswordChanged(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'SignInEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInEventPasswordChanged &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInEventPasswordChangedCopyWith<_$SignInEventPasswordChanged>
      get copyWith => __$$SignInEventPasswordChangedCopyWithImpl<
          _$SignInEventPasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signIn,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? signIn,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
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
    required TResult Function(SignInEventEventEmailChanged value) emailChanged,
    required TResult Function(SignInEventPasswordChanged value) passwordChanged,
    required TResult Function(SignInEventSignIn value) signIn,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEventEventEmailChanged value)? emailChanged,
    TResult? Function(SignInEventPasswordChanged value)? passwordChanged,
    TResult? Function(SignInEventSignIn value)? signIn,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEventEventEmailChanged value)? emailChanged,
    TResult Function(SignInEventPasswordChanged value)? passwordChanged,
    TResult Function(SignInEventSignIn value)? signIn,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class SignInEventPasswordChanged implements SignInEvent {
  factory SignInEventPasswordChanged(final String password) =
      _$SignInEventPasswordChanged;

  String get password;
  @JsonKey(ignore: true)
  _$$SignInEventPasswordChangedCopyWith<_$SignInEventPasswordChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInEventSignInCopyWith<$Res> {
  factory _$$SignInEventSignInCopyWith(
          _$SignInEventSignIn value, $Res Function(_$SignInEventSignIn) then) =
      __$$SignInEventSignInCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInEventSignInCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$SignInEventSignIn>
    implements _$$SignInEventSignInCopyWith<$Res> {
  __$$SignInEventSignInCopyWithImpl(
      _$SignInEventSignIn _value, $Res Function(_$SignInEventSignIn) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInEventSignIn implements SignInEventSignIn {
  _$SignInEventSignIn();

  @override
  String toString() {
    return 'SignInEvent.signIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInEventSignIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signIn,
  }) {
    return signIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? signIn,
  }) {
    return signIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEventEventEmailChanged value) emailChanged,
    required TResult Function(SignInEventPasswordChanged value) passwordChanged,
    required TResult Function(SignInEventSignIn value) signIn,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEventEventEmailChanged value)? emailChanged,
    TResult? Function(SignInEventPasswordChanged value)? passwordChanged,
    TResult? Function(SignInEventSignIn value)? signIn,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEventEventEmailChanged value)? emailChanged,
    TResult Function(SignInEventPasswordChanged value)? passwordChanged,
    TResult Function(SignInEventSignIn value)? signIn,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class SignInEventSignIn implements SignInEvent {
  factory SignInEventSignIn() = _$SignInEventSignIn;
}
