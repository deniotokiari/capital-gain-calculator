// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplashState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplashStateLoading value) loading,
    required TResult Function(_SplashStateDone value) done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplashStateLoading value)? loading,
    TResult? Function(_SplashStateDone value)? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplashStateLoading value)? loading,
    TResult Function(_SplashStateDone value)? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res, SplashState>;
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res, $Val extends SplashState>
    implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SplashStateLoadingCopyWith<$Res> {
  factory _$$_SplashStateLoadingCopyWith(_$_SplashStateLoading value,
          $Res Function(_$_SplashStateLoading) then) =
      __$$_SplashStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SplashStateLoadingCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$_SplashStateLoading>
    implements _$$_SplashStateLoadingCopyWith<$Res> {
  __$$_SplashStateLoadingCopyWithImpl(
      _$_SplashStateLoading _value, $Res Function(_$_SplashStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SplashStateLoading implements _SplashStateLoading {
  _$_SplashStateLoading();

  @override
  String toString() {
    return 'SplashState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SplashStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() done,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? done,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? done,
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
    required TResult Function(_SplashStateLoading value) loading,
    required TResult Function(_SplashStateDone value) done,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplashStateLoading value)? loading,
    TResult? Function(_SplashStateDone value)? done,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplashStateLoading value)? loading,
    TResult Function(_SplashStateDone value)? done,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SplashStateLoading implements SplashState {
  factory _SplashStateLoading() = _$_SplashStateLoading;
}

/// @nodoc
abstract class _$$_SplashStateDoneCopyWith<$Res> {
  factory _$$_SplashStateDoneCopyWith(
          _$_SplashStateDone value, $Res Function(_$_SplashStateDone) then) =
      __$$_SplashStateDoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SplashStateDoneCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$_SplashStateDone>
    implements _$$_SplashStateDoneCopyWith<$Res> {
  __$$_SplashStateDoneCopyWithImpl(
      _$_SplashStateDone _value, $Res Function(_$_SplashStateDone) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SplashStateDone implements _SplashStateDone {
  _$_SplashStateDone();

  @override
  String toString() {
    return 'SplashState.done()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SplashStateDone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() done,
  }) {
    return done();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? done,
  }) {
    return done?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplashStateLoading value) loading,
    required TResult Function(_SplashStateDone value) done,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplashStateLoading value)? loading,
    TResult? Function(_SplashStateDone value)? done,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplashStateLoading value)? loading,
    TResult Function(_SplashStateDone value)? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class _SplashStateDone implements SplashState {
  factory _SplashStateDone() = _$_SplashStateDone;
}
