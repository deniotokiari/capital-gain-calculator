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
            String? selectedCurrency, List<String>? listOfCurrency)
        $default, {
    required TResult Function() loading,
    required TResult Function(String message) signUpSuccess,
    required TResult Function(String message) signUpFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? email, String? password, String? alphavantageKey,
            String? selectedCurrency, List<String>? listOfCurrency)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(String message)? signUpSuccess,
    TResult? Function(String message)? signUpFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? selectedCurrency, List<String>? listOfCurrency)?
        $default, {
    TResult Function()? loading,
    TResult Function(String message)? signUpSuccess,
    TResult Function(String message)? signUpFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignUpState value) $default, {
    required TResult Function(_SignUpStateLoading value) loading,
    required TResult Function(_SignUpStateSignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpStateSignUpFailed value) signUpFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignUpState value)? $default, {
    TResult? Function(_SignUpStateLoading value)? loading,
    TResult? Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpStateSignUpFailed value)? signUpFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignUpState value)? $default, {
    TResult Function(_SignUpStateLoading value)? loading,
    TResult Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpStateSignUpFailed value)? signUpFailed,
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
      String? selectedCurrency,
      List<String>? listOfCurrency});
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
    Object? selectedCurrency = freezed,
    Object? listOfCurrency = freezed,
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
      selectedCurrency: freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      listOfCurrency: freezed == listOfCurrency
          ? _value._listOfCurrency
          : listOfCurrency // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$_SignUpState implements _SignUpState {
  _$_SignUpState(
      {required this.email,
      required this.password,
      required this.alphavantageKey,
      required this.selectedCurrency,
      required final List<String>? listOfCurrency})
      : _listOfCurrency = listOfCurrency;

  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? alphavantageKey;
  @override
  final String? selectedCurrency;
  final List<String>? _listOfCurrency;
  @override
  List<String>? get listOfCurrency {
    final value = _listOfCurrency;
    if (value == null) return null;
    if (_listOfCurrency is EqualUnmodifiableListView) return _listOfCurrency;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SignUpState(email: $email, password: $password, alphavantageKey: $alphavantageKey, selectedCurrency: $selectedCurrency, listOfCurrency: $listOfCurrency)';
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
            (identical(other.selectedCurrency, selectedCurrency) ||
                other.selectedCurrency == selectedCurrency) &&
            const DeepCollectionEquality()
                .equals(other._listOfCurrency, _listOfCurrency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, alphavantageKey,
      selectedCurrency, const DeepCollectionEquality().hash(_listOfCurrency));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      __$$_SignUpStateCopyWithImpl<_$_SignUpState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? selectedCurrency, List<String>? listOfCurrency)
        $default, {
    required TResult Function() loading,
    required TResult Function(String message) signUpSuccess,
    required TResult Function(String message) signUpFailed,
  }) {
    return $default(
        email, password, alphavantageKey, selectedCurrency, listOfCurrency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? email, String? password, String? alphavantageKey,
            String? selectedCurrency, List<String>? listOfCurrency)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(String message)? signUpSuccess,
    TResult? Function(String message)? signUpFailed,
  }) {
    return $default?.call(
        email, password, alphavantageKey, selectedCurrency, listOfCurrency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? selectedCurrency, List<String>? listOfCurrency)?
        $default, {
    TResult Function()? loading,
    TResult Function(String message)? signUpSuccess,
    TResult Function(String message)? signUpFailed,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          email, password, alphavantageKey, selectedCurrency, listOfCurrency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignUpState value) $default, {
    required TResult Function(_SignUpStateLoading value) loading,
    required TResult Function(_SignUpStateSignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpStateSignUpFailed value) signUpFailed,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignUpState value)? $default, {
    TResult? Function(_SignUpStateLoading value)? loading,
    TResult? Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpStateSignUpFailed value)? signUpFailed,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignUpState value)? $default, {
    TResult Function(_SignUpStateLoading value)? loading,
    TResult Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpStateSignUpFailed value)? signUpFailed,
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
      required final String? selectedCurrency,
      required final List<String>? listOfCurrency}) = _$_SignUpState;

  String? get email;
  String? get password;
  String? get alphavantageKey;
  String? get selectedCurrency;
  List<String>? get listOfCurrency;
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
            String? selectedCurrency, List<String>? listOfCurrency)
        $default, {
    required TResult Function() loading,
    required TResult Function(String message) signUpSuccess,
    required TResult Function(String message) signUpFailed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? email, String? password, String? alphavantageKey,
            String? selectedCurrency, List<String>? listOfCurrency)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(String message)? signUpSuccess,
    TResult? Function(String message)? signUpFailed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? selectedCurrency, List<String>? listOfCurrency)?
        $default, {
    TResult Function()? loading,
    TResult Function(String message)? signUpSuccess,
    TResult Function(String message)? signUpFailed,
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
    required TResult Function(_SignUpStateSignUpFailed value) signUpFailed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignUpState value)? $default, {
    TResult? Function(_SignUpStateLoading value)? loading,
    TResult? Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpStateSignUpFailed value)? signUpFailed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignUpState value)? $default, {
    TResult Function(_SignUpStateLoading value)? loading,
    TResult Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpStateSignUpFailed value)? signUpFailed,
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
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_SignUpStateSignUpSuccessCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$_SignUpStateSignUpSuccess>
    implements _$$_SignUpStateSignUpSuccessCopyWith<$Res> {
  __$$_SignUpStateSignUpSuccessCopyWithImpl(_$_SignUpStateSignUpSuccess _value,
      $Res Function(_$_SignUpStateSignUpSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_SignUpStateSignUpSuccess(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignUpStateSignUpSuccess implements _SignUpStateSignUpSuccess {
  _$_SignUpStateSignUpSuccess(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SignUpState.signUpSuccess(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpStateSignUpSuccess &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpStateSignUpSuccessCopyWith<_$_SignUpStateSignUpSuccess>
      get copyWith => __$$_SignUpStateSignUpSuccessCopyWithImpl<
          _$_SignUpStateSignUpSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? selectedCurrency, List<String>? listOfCurrency)
        $default, {
    required TResult Function() loading,
    required TResult Function(String message) signUpSuccess,
    required TResult Function(String message) signUpFailed,
  }) {
    return signUpSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? email, String? password, String? alphavantageKey,
            String? selectedCurrency, List<String>? listOfCurrency)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(String message)? signUpSuccess,
    TResult? Function(String message)? signUpFailed,
  }) {
    return signUpSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? selectedCurrency, List<String>? listOfCurrency)?
        $default, {
    TResult Function()? loading,
    TResult Function(String message)? signUpSuccess,
    TResult Function(String message)? signUpFailed,
    required TResult orElse(),
  }) {
    if (signUpSuccess != null) {
      return signUpSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignUpState value) $default, {
    required TResult Function(_SignUpStateLoading value) loading,
    required TResult Function(_SignUpStateSignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpStateSignUpFailed value) signUpFailed,
  }) {
    return signUpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignUpState value)? $default, {
    TResult? Function(_SignUpStateLoading value)? loading,
    TResult? Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpStateSignUpFailed value)? signUpFailed,
  }) {
    return signUpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignUpState value)? $default, {
    TResult Function(_SignUpStateLoading value)? loading,
    TResult Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpStateSignUpFailed value)? signUpFailed,
    required TResult orElse(),
  }) {
    if (signUpSuccess != null) {
      return signUpSuccess(this);
    }
    return orElse();
  }
}

abstract class _SignUpStateSignUpSuccess implements SignUpState {
  factory _SignUpStateSignUpSuccess(final String message) =
      _$_SignUpStateSignUpSuccess;

  String get message;
  @JsonKey(ignore: true)
  _$$_SignUpStateSignUpSuccessCopyWith<_$_SignUpStateSignUpSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignUpStateSignUpFailedCopyWith<$Res> {
  factory _$$_SignUpStateSignUpFailedCopyWith(_$_SignUpStateSignUpFailed value,
          $Res Function(_$_SignUpStateSignUpFailed) then) =
      __$$_SignUpStateSignUpFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_SignUpStateSignUpFailedCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$_SignUpStateSignUpFailed>
    implements _$$_SignUpStateSignUpFailedCopyWith<$Res> {
  __$$_SignUpStateSignUpFailedCopyWithImpl(_$_SignUpStateSignUpFailed _value,
      $Res Function(_$_SignUpStateSignUpFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_SignUpStateSignUpFailed(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignUpStateSignUpFailed implements _SignUpStateSignUpFailed {
  _$_SignUpStateSignUpFailed(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SignUpState.signUpFailed(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpStateSignUpFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpStateSignUpFailedCopyWith<_$_SignUpStateSignUpFailed>
      get copyWith =>
          __$$_SignUpStateSignUpFailedCopyWithImpl<_$_SignUpStateSignUpFailed>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? selectedCurrency, List<String>? listOfCurrency)
        $default, {
    required TResult Function() loading,
    required TResult Function(String message) signUpSuccess,
    required TResult Function(String message) signUpFailed,
  }) {
    return signUpFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? email, String? password, String? alphavantageKey,
            String? selectedCurrency, List<String>? listOfCurrency)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(String message)? signUpSuccess,
    TResult? Function(String message)? signUpFailed,
  }) {
    return signUpFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? email, String? password, String? alphavantageKey,
            String? selectedCurrency, List<String>? listOfCurrency)?
        $default, {
    TResult Function()? loading,
    TResult Function(String message)? signUpSuccess,
    TResult Function(String message)? signUpFailed,
    required TResult orElse(),
  }) {
    if (signUpFailed != null) {
      return signUpFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignUpState value) $default, {
    required TResult Function(_SignUpStateLoading value) loading,
    required TResult Function(_SignUpStateSignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpStateSignUpFailed value) signUpFailed,
  }) {
    return signUpFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignUpState value)? $default, {
    TResult? Function(_SignUpStateLoading value)? loading,
    TResult? Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpStateSignUpFailed value)? signUpFailed,
  }) {
    return signUpFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignUpState value)? $default, {
    TResult Function(_SignUpStateLoading value)? loading,
    TResult Function(_SignUpStateSignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpStateSignUpFailed value)? signUpFailed,
    required TResult orElse(),
  }) {
    if (signUpFailed != null) {
      return signUpFailed(this);
    }
    return orElse();
  }
}

abstract class _SignUpStateSignUpFailed implements SignUpState {
  factory _SignUpStateSignUpFailed(final String message) =
      _$_SignUpStateSignUpFailed;

  String get message;
  @JsonKey(ignore: true)
  _$$_SignUpStateSignUpFailedCopyWith<_$_SignUpStateSignUpFailed>
      get copyWith => throw _privateConstructorUsedError;
}
