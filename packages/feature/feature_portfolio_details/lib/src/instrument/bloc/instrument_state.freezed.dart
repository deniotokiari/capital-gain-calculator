// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instrument_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InstrumentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            InstrumentStateTitle title, InstrumentStatePositions positions)
        idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            InstrumentStateTitle title, InstrumentStatePositions positions)?
        idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            InstrumentStateTitle title, InstrumentStatePositions positions)?
        idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InstrumentStateLoading value) loading,
    required TResult Function(InstrumentStateInstrumentIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstrumentStateLoading value)? loading,
    TResult? Function(InstrumentStateInstrumentIdle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstrumentStateLoading value)? loading,
    TResult Function(InstrumentStateInstrumentIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstrumentStateCopyWith<$Res> {
  factory $InstrumentStateCopyWith(
          InstrumentState value, $Res Function(InstrumentState) then) =
      _$InstrumentStateCopyWithImpl<$Res, InstrumentState>;
}

/// @nodoc
class _$InstrumentStateCopyWithImpl<$Res, $Val extends InstrumentState>
    implements $InstrumentStateCopyWith<$Res> {
  _$InstrumentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InstrumentStateLoadingCopyWith<$Res> {
  factory _$$InstrumentStateLoadingCopyWith(_$InstrumentStateLoading value,
          $Res Function(_$InstrumentStateLoading) then) =
      __$$InstrumentStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InstrumentStateLoadingCopyWithImpl<$Res>
    extends _$InstrumentStateCopyWithImpl<$Res, _$InstrumentStateLoading>
    implements _$$InstrumentStateLoadingCopyWith<$Res> {
  __$$InstrumentStateLoadingCopyWithImpl(_$InstrumentStateLoading _value,
      $Res Function(_$InstrumentStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InstrumentStateLoading implements InstrumentStateLoading {
  _$InstrumentStateLoading();

  @override
  String toString() {
    return 'InstrumentState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InstrumentStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            InstrumentStateTitle title, InstrumentStatePositions positions)
        idle,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            InstrumentStateTitle title, InstrumentStatePositions positions)?
        idle,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            InstrumentStateTitle title, InstrumentStatePositions positions)?
        idle,
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
    required TResult Function(InstrumentStateLoading value) loading,
    required TResult Function(InstrumentStateInstrumentIdle value) idle,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstrumentStateLoading value)? loading,
    TResult? Function(InstrumentStateInstrumentIdle value)? idle,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstrumentStateLoading value)? loading,
    TResult Function(InstrumentStateInstrumentIdle value)? idle,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class InstrumentStateLoading implements InstrumentState {
  factory InstrumentStateLoading() = _$InstrumentStateLoading;
}

/// @nodoc
abstract class _$$InstrumentStateInstrumentIdleCopyWith<$Res> {
  factory _$$InstrumentStateInstrumentIdleCopyWith(
          _$InstrumentStateInstrumentIdle value,
          $Res Function(_$InstrumentStateInstrumentIdle) then) =
      __$$InstrumentStateInstrumentIdleCopyWithImpl<$Res>;
  @useResult
  $Res call({InstrumentStateTitle title, InstrumentStatePositions positions});
}

/// @nodoc
class __$$InstrumentStateInstrumentIdleCopyWithImpl<$Res>
    extends _$InstrumentStateCopyWithImpl<$Res, _$InstrumentStateInstrumentIdle>
    implements _$$InstrumentStateInstrumentIdleCopyWith<$Res> {
  __$$InstrumentStateInstrumentIdleCopyWithImpl(
      _$InstrumentStateInstrumentIdle _value,
      $Res Function(_$InstrumentStateInstrumentIdle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? positions = null,
  }) {
    return _then(_$InstrumentStateInstrumentIdle(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as InstrumentStateTitle,
      null == positions
          ? _value.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as InstrumentStatePositions,
    ));
  }
}

/// @nodoc

class _$InstrumentStateInstrumentIdle implements InstrumentStateInstrumentIdle {
  _$InstrumentStateInstrumentIdle(this.title, this.positions);

  @override
  final InstrumentStateTitle title;
  @override
  final InstrumentStatePositions positions;

  @override
  String toString() {
    return 'InstrumentState.idle(title: $title, positions: $positions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstrumentStateInstrumentIdle &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.positions, positions) ||
                other.positions == positions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, positions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstrumentStateInstrumentIdleCopyWith<_$InstrumentStateInstrumentIdle>
      get copyWith => __$$InstrumentStateInstrumentIdleCopyWithImpl<
          _$InstrumentStateInstrumentIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            InstrumentStateTitle title, InstrumentStatePositions positions)
        idle,
  }) {
    return idle(title, positions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            InstrumentStateTitle title, InstrumentStatePositions positions)?
        idle,
  }) {
    return idle?.call(title, positions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            InstrumentStateTitle title, InstrumentStatePositions positions)?
        idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(title, positions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InstrumentStateLoading value) loading,
    required TResult Function(InstrumentStateInstrumentIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstrumentStateLoading value)? loading,
    TResult? Function(InstrumentStateInstrumentIdle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstrumentStateLoading value)? loading,
    TResult Function(InstrumentStateInstrumentIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class InstrumentStateInstrumentIdle implements InstrumentState {
  factory InstrumentStateInstrumentIdle(final InstrumentStateTitle title,
          final InstrumentStatePositions positions) =
      _$InstrumentStateInstrumentIdle;

  InstrumentStateTitle get title;
  InstrumentStatePositions get positions;
  @JsonKey(ignore: true)
  _$$InstrumentStateInstrumentIdleCopyWith<_$InstrumentStateInstrumentIdle>
      get copyWith => throw _privateConstructorUsedError;
}
