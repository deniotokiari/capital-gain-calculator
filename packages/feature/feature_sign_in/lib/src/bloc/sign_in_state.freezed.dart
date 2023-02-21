// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) signInSuccess,
    required TResult Function(String message) signInFailed,
    required TResult Function() loading,
    required TResult Function(bool isSignInButtonEnabled) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? signInSuccess,
    TResult? Function(String message)? signInFailed,
    TResult? Function()? loading,
    TResult? Function(bool isSignInButtonEnabled)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? signInSuccess,
    TResult Function(String message)? signInFailed,
    TResult Function()? loading,
    TResult Function(bool isSignInButtonEnabled)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInStateSignInSuccess value) signInSuccess,
    required TResult Function(_SignInStateSignInFailed value) signInFailed,
    required TResult Function(_SignInStateLoading value) loading,
    required TResult Function(_SignInStateIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInStateSignInSuccess value)? signInSuccess,
    TResult? Function(_SignInStateSignInFailed value)? signInFailed,
    TResult? Function(_SignInStateLoading value)? loading,
    TResult? Function(_SignInStateIdle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInStateSignInSuccess value)? signInSuccess,
    TResult Function(_SignInStateSignInFailed value)? signInFailed,
    TResult Function(_SignInStateLoading value)? loading,
    TResult Function(_SignInStateIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignInStateSignInSuccessCopyWith<$Res> {
  factory _$$SignInStateSignInSuccessCopyWith(_$SignInStateSignInSuccess value,
          $Res Function(_$SignInStateSignInSuccess) then) =
      __$$SignInStateSignInSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SignInStateSignInSuccessCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateSignInSuccess>
    implements _$$SignInStateSignInSuccessCopyWith<$Res> {
  __$$SignInStateSignInSuccessCopyWithImpl(_$SignInStateSignInSuccess _value,
      $Res Function(_$SignInStateSignInSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SignInStateSignInSuccess(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInStateSignInSuccess implements SignInStateSignInSuccess {
  _$SignInStateSignInSuccess(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SignInState.signInSuccess(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateSignInSuccess &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateSignInSuccessCopyWith<_$SignInStateSignInSuccess>
      get copyWith =>
          __$$SignInStateSignInSuccessCopyWithImpl<_$SignInStateSignInSuccess>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) signInSuccess,
    required TResult Function(String message) signInFailed,
    required TResult Function() loading,
    required TResult Function(bool isSignInButtonEnabled) idle,
  }) {
    return signInSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? signInSuccess,
    TResult? Function(String message)? signInFailed,
    TResult? Function()? loading,
    TResult? Function(bool isSignInButtonEnabled)? idle,
  }) {
    return signInSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? signInSuccess,
    TResult Function(String message)? signInFailed,
    TResult Function()? loading,
    TResult Function(bool isSignInButtonEnabled)? idle,
    required TResult orElse(),
  }) {
    if (signInSuccess != null) {
      return signInSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInStateSignInSuccess value) signInSuccess,
    required TResult Function(_SignInStateSignInFailed value) signInFailed,
    required TResult Function(_SignInStateLoading value) loading,
    required TResult Function(_SignInStateIdle value) idle,
  }) {
    return signInSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInStateSignInSuccess value)? signInSuccess,
    TResult? Function(_SignInStateSignInFailed value)? signInFailed,
    TResult? Function(_SignInStateLoading value)? loading,
    TResult? Function(_SignInStateIdle value)? idle,
  }) {
    return signInSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInStateSignInSuccess value)? signInSuccess,
    TResult Function(_SignInStateSignInFailed value)? signInFailed,
    TResult Function(_SignInStateLoading value)? loading,
    TResult Function(_SignInStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (signInSuccess != null) {
      return signInSuccess(this);
    }
    return orElse();
  }
}

abstract class SignInStateSignInSuccess implements SignInState {
  factory SignInStateSignInSuccess(final String message) =
      _$SignInStateSignInSuccess;

  String get message;
  @JsonKey(ignore: true)
  _$$SignInStateSignInSuccessCopyWith<_$SignInStateSignInSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignInStateSignInFailedCopyWith<$Res> {
  factory _$$_SignInStateSignInFailedCopyWith(_$_SignInStateSignInFailed value,
          $Res Function(_$_SignInStateSignInFailed) then) =
      __$$_SignInStateSignInFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_SignInStateSignInFailedCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$_SignInStateSignInFailed>
    implements _$$_SignInStateSignInFailedCopyWith<$Res> {
  __$$_SignInStateSignInFailedCopyWithImpl(_$_SignInStateSignInFailed _value,
      $Res Function(_$_SignInStateSignInFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_SignInStateSignInFailed(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignInStateSignInFailed implements _SignInStateSignInFailed {
  _$_SignInStateSignInFailed(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SignInState.signInFailed(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInStateSignInFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInStateSignInFailedCopyWith<_$_SignInStateSignInFailed>
      get copyWith =>
          __$$_SignInStateSignInFailedCopyWithImpl<_$_SignInStateSignInFailed>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) signInSuccess,
    required TResult Function(String message) signInFailed,
    required TResult Function() loading,
    required TResult Function(bool isSignInButtonEnabled) idle,
  }) {
    return signInFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? signInSuccess,
    TResult? Function(String message)? signInFailed,
    TResult? Function()? loading,
    TResult? Function(bool isSignInButtonEnabled)? idle,
  }) {
    return signInFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? signInSuccess,
    TResult Function(String message)? signInFailed,
    TResult Function()? loading,
    TResult Function(bool isSignInButtonEnabled)? idle,
    required TResult orElse(),
  }) {
    if (signInFailed != null) {
      return signInFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInStateSignInSuccess value) signInSuccess,
    required TResult Function(_SignInStateSignInFailed value) signInFailed,
    required TResult Function(_SignInStateLoading value) loading,
    required TResult Function(_SignInStateIdle value) idle,
  }) {
    return signInFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInStateSignInSuccess value)? signInSuccess,
    TResult? Function(_SignInStateSignInFailed value)? signInFailed,
    TResult? Function(_SignInStateLoading value)? loading,
    TResult? Function(_SignInStateIdle value)? idle,
  }) {
    return signInFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInStateSignInSuccess value)? signInSuccess,
    TResult Function(_SignInStateSignInFailed value)? signInFailed,
    TResult Function(_SignInStateLoading value)? loading,
    TResult Function(_SignInStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (signInFailed != null) {
      return signInFailed(this);
    }
    return orElse();
  }
}

abstract class _SignInStateSignInFailed implements SignInState {
  factory _SignInStateSignInFailed(final String message) =
      _$_SignInStateSignInFailed;

  String get message;
  @JsonKey(ignore: true)
  _$$_SignInStateSignInFailedCopyWith<_$_SignInStateSignInFailed>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignInStateLoadingCopyWith<$Res> {
  factory _$$_SignInStateLoadingCopyWith(_$_SignInStateLoading value,
          $Res Function(_$_SignInStateLoading) then) =
      __$$_SignInStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInStateLoadingCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$_SignInStateLoading>
    implements _$$_SignInStateLoadingCopyWith<$Res> {
  __$$_SignInStateLoadingCopyWithImpl(
      _$_SignInStateLoading _value, $Res Function(_$_SignInStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInStateLoading implements _SignInStateLoading {
  _$_SignInStateLoading();

  @override
  String toString() {
    return 'SignInState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignInStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) signInSuccess,
    required TResult Function(String message) signInFailed,
    required TResult Function() loading,
    required TResult Function(bool isSignInButtonEnabled) idle,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? signInSuccess,
    TResult? Function(String message)? signInFailed,
    TResult? Function()? loading,
    TResult? Function(bool isSignInButtonEnabled)? idle,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? signInSuccess,
    TResult Function(String message)? signInFailed,
    TResult Function()? loading,
    TResult Function(bool isSignInButtonEnabled)? idle,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInStateSignInSuccess value) signInSuccess,
    required TResult Function(_SignInStateSignInFailed value) signInFailed,
    required TResult Function(_SignInStateLoading value) loading,
    required TResult Function(_SignInStateIdle value) idle,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInStateSignInSuccess value)? signInSuccess,
    TResult? Function(_SignInStateSignInFailed value)? signInFailed,
    TResult? Function(_SignInStateLoading value)? loading,
    TResult? Function(_SignInStateIdle value)? idle,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInStateSignInSuccess value)? signInSuccess,
    TResult Function(_SignInStateSignInFailed value)? signInFailed,
    TResult Function(_SignInStateLoading value)? loading,
    TResult Function(_SignInStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SignInStateLoading implements SignInState {
  factory _SignInStateLoading() = _$_SignInStateLoading;
}

/// @nodoc
abstract class _$$_SignInStateIdleCopyWith<$Res> {
  factory _$$_SignInStateIdleCopyWith(
          _$_SignInStateIdle value, $Res Function(_$_SignInStateIdle) then) =
      __$$_SignInStateIdleCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isSignInButtonEnabled});
}

/// @nodoc
class __$$_SignInStateIdleCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$_SignInStateIdle>
    implements _$$_SignInStateIdleCopyWith<$Res> {
  __$$_SignInStateIdleCopyWithImpl(
      _$_SignInStateIdle _value, $Res Function(_$_SignInStateIdle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSignInButtonEnabled = null,
  }) {
    return _then(_$_SignInStateIdle(
      isSignInButtonEnabled: null == isSignInButtonEnabled
          ? _value.isSignInButtonEnabled
          : isSignInButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignInStateIdle implements _SignInStateIdle {
  _$_SignInStateIdle({required this.isSignInButtonEnabled});

  @override
  final bool isSignInButtonEnabled;

  @override
  String toString() {
    return 'SignInState.idle(isSignInButtonEnabled: $isSignInButtonEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInStateIdle &&
            (identical(other.isSignInButtonEnabled, isSignInButtonEnabled) ||
                other.isSignInButtonEnabled == isSignInButtonEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSignInButtonEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInStateIdleCopyWith<_$_SignInStateIdle> get copyWith =>
      __$$_SignInStateIdleCopyWithImpl<_$_SignInStateIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) signInSuccess,
    required TResult Function(String message) signInFailed,
    required TResult Function() loading,
    required TResult Function(bool isSignInButtonEnabled) idle,
  }) {
    return idle(isSignInButtonEnabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? signInSuccess,
    TResult? Function(String message)? signInFailed,
    TResult? Function()? loading,
    TResult? Function(bool isSignInButtonEnabled)? idle,
  }) {
    return idle?.call(isSignInButtonEnabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? signInSuccess,
    TResult Function(String message)? signInFailed,
    TResult Function()? loading,
    TResult Function(bool isSignInButtonEnabled)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(isSignInButtonEnabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInStateSignInSuccess value) signInSuccess,
    required TResult Function(_SignInStateSignInFailed value) signInFailed,
    required TResult Function(_SignInStateLoading value) loading,
    required TResult Function(_SignInStateIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInStateSignInSuccess value)? signInSuccess,
    TResult? Function(_SignInStateSignInFailed value)? signInFailed,
    TResult? Function(_SignInStateLoading value)? loading,
    TResult? Function(_SignInStateIdle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInStateSignInSuccess value)? signInSuccess,
    TResult Function(_SignInStateSignInFailed value)? signInFailed,
    TResult Function(_SignInStateLoading value)? loading,
    TResult Function(_SignInStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _SignInStateIdle implements SignInState {
  factory _SignInStateIdle({required final bool isSignInButtonEnabled}) =
      _$_SignInStateIdle;

  bool get isSignInButtonEnabled;
  @JsonKey(ignore: true)
  _$$_SignInStateIdleCopyWith<_$_SignInStateIdle> get copyWith =>
      throw _privateConstructorUsedError;
}
