// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ok,
    required TResult Function() cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? ok,
    TResult Function()? cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ok,
    TResult Function()? cancel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationResultOk value) ok,
    required TResult Function(NavigationResultCancel value) cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationResultOk value)? ok,
    TResult Function(NavigationResultCancel value)? cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationResultOk value)? ok,
    TResult Function(NavigationResultCancel value)? cancel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationResultCopyWith<$Res> {
  factory $NavigationResultCopyWith(
          NavigationResult value, $Res Function(NavigationResult) then) =
      _$NavigationResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigationResultCopyWithImpl<$Res>
    implements $NavigationResultCopyWith<$Res> {
  _$NavigationResultCopyWithImpl(this._value, this._then);

  final NavigationResult _value;
  // ignore: unused_field
  final $Res Function(NavigationResult) _then;
}

/// @nodoc
abstract class _$$NavigationResultOkCopyWith<$Res> {
  factory _$$NavigationResultOkCopyWith(_$NavigationResultOk value,
          $Res Function(_$NavigationResultOk) then) =
      __$$NavigationResultOkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NavigationResultOkCopyWithImpl<$Res>
    extends _$NavigationResultCopyWithImpl<$Res>
    implements _$$NavigationResultOkCopyWith<$Res> {
  __$$NavigationResultOkCopyWithImpl(
      _$NavigationResultOk _value, $Res Function(_$NavigationResultOk) _then)
      : super(_value, (v) => _then(v as _$NavigationResultOk));

  @override
  _$NavigationResultOk get _value => super._value as _$NavigationResultOk;
}

/// @nodoc

class _$NavigationResultOk implements NavigationResultOk {
  const _$NavigationResultOk();

  @override
  String toString() {
    return 'NavigationResult.ok()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NavigationResultOk);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ok,
    required TResult Function() cancel,
  }) {
    return ok();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? ok,
    TResult Function()? cancel,
  }) {
    return ok?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ok,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationResultOk value) ok,
    required TResult Function(NavigationResultCancel value) cancel,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationResultOk value)? ok,
    TResult Function(NavigationResultCancel value)? cancel,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationResultOk value)? ok,
    TResult Function(NavigationResultCancel value)? cancel,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class NavigationResultOk implements NavigationResult {
  const factory NavigationResultOk() = _$NavigationResultOk;
}

/// @nodoc
abstract class _$$NavigationResultCancelCopyWith<$Res> {
  factory _$$NavigationResultCancelCopyWith(_$NavigationResultCancel value,
          $Res Function(_$NavigationResultCancel) then) =
      __$$NavigationResultCancelCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NavigationResultCancelCopyWithImpl<$Res>
    extends _$NavigationResultCopyWithImpl<$Res>
    implements _$$NavigationResultCancelCopyWith<$Res> {
  __$$NavigationResultCancelCopyWithImpl(_$NavigationResultCancel _value,
      $Res Function(_$NavigationResultCancel) _then)
      : super(_value, (v) => _then(v as _$NavigationResultCancel));

  @override
  _$NavigationResultCancel get _value =>
      super._value as _$NavigationResultCancel;
}

/// @nodoc

class _$NavigationResultCancel implements NavigationResultCancel {
  const _$NavigationResultCancel();

  @override
  String toString() {
    return 'NavigationResult.cancel()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NavigationResultCancel);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ok,
    required TResult Function() cancel,
  }) {
    return cancel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? ok,
    TResult Function()? cancel,
  }) {
    return cancel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ok,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationResultOk value) ok,
    required TResult Function(NavigationResultCancel value) cancel,
  }) {
    return cancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationResultOk value)? ok,
    TResult Function(NavigationResultCancel value)? cancel,
  }) {
    return cancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationResultOk value)? ok,
    TResult Function(NavigationResultCancel value)? cancel,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(this);
    }
    return orElse();
  }
}

abstract class NavigationResultCancel implements NavigationResult {
  const factory NavigationResultCancel() = _$NavigationResultCancel;
}
