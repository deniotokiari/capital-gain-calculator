// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instrument_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InstrumentEvent {
  String get instrumentId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String instrumentId)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InstrumentEventInit value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstrumentEventInit value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstrumentEventInit value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InstrumentEventCopyWith<InstrumentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstrumentEventCopyWith<$Res> {
  factory $InstrumentEventCopyWith(
          InstrumentEvent value, $Res Function(InstrumentEvent) then) =
      _$InstrumentEventCopyWithImpl<$Res, InstrumentEvent>;
  @useResult
  $Res call({String instrumentId});
}

/// @nodoc
class _$InstrumentEventCopyWithImpl<$Res, $Val extends InstrumentEvent>
    implements $InstrumentEventCopyWith<$Res> {
  _$InstrumentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instrumentId = null,
  }) {
    return _then(_value.copyWith(
      instrumentId: null == instrumentId
          ? _value.instrumentId
          : instrumentId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstrumentEventInitCopyWith<$Res>
    implements $InstrumentEventCopyWith<$Res> {
  factory _$$InstrumentEventInitCopyWith(_$InstrumentEventInit value,
          $Res Function(_$InstrumentEventInit) then) =
      __$$InstrumentEventInitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String instrumentId});
}

/// @nodoc
class __$$InstrumentEventInitCopyWithImpl<$Res>
    extends _$InstrumentEventCopyWithImpl<$Res, _$InstrumentEventInit>
    implements _$$InstrumentEventInitCopyWith<$Res> {
  __$$InstrumentEventInitCopyWithImpl(
      _$InstrumentEventInit _value, $Res Function(_$InstrumentEventInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instrumentId = null,
  }) {
    return _then(_$InstrumentEventInit(
      null == instrumentId
          ? _value.instrumentId
          : instrumentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InstrumentEventInit implements InstrumentEventInit {
  _$InstrumentEventInit(this.instrumentId);

  @override
  final String instrumentId;

  @override
  String toString() {
    return 'InstrumentEvent.init(instrumentId: $instrumentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstrumentEventInit &&
            (identical(other.instrumentId, instrumentId) ||
                other.instrumentId == instrumentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, instrumentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstrumentEventInitCopyWith<_$InstrumentEventInit> get copyWith =>
      __$$InstrumentEventInitCopyWithImpl<_$InstrumentEventInit>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
  }) {
    return init(instrumentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String instrumentId)? init,
  }) {
    return init?.call(instrumentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(instrumentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InstrumentEventInit value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InstrumentEventInit value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InstrumentEventInit value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InstrumentEventInit implements InstrumentEvent {
  factory InstrumentEventInit(final String instrumentId) =
      _$InstrumentEventInit;

  @override
  String get instrumentId;
  @override
  @JsonKey(ignore: true)
  _$$InstrumentEventInitCopyWith<_$InstrumentEventInit> get copyWith =>
      throw _privateConstructorUsedError;
}
