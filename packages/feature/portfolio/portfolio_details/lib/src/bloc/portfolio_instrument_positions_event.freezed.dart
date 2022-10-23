// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'portfolio_instrument_positions_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioInstrumentPositionsEvent {
  String get instrumentId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
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
    required TResult Function(PortfolioInstrumentPositionsEventInit value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioInstrumentPositionsEventInit value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioInstrumentPositionsEventInit value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortfolioInstrumentPositionsEventCopyWith<PortfolioInstrumentPositionsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioInstrumentPositionsEventCopyWith<$Res> {
  factory $PortfolioInstrumentPositionsEventCopyWith(
          PortfolioInstrumentPositionsEvent value,
          $Res Function(PortfolioInstrumentPositionsEvent) then) =
      _$PortfolioInstrumentPositionsEventCopyWithImpl<$Res>;
  $Res call({String instrumentId});
}

/// @nodoc
class _$PortfolioInstrumentPositionsEventCopyWithImpl<$Res>
    implements $PortfolioInstrumentPositionsEventCopyWith<$Res> {
  _$PortfolioInstrumentPositionsEventCopyWithImpl(this._value, this._then);

  final PortfolioInstrumentPositionsEvent _value;
  // ignore: unused_field
  final $Res Function(PortfolioInstrumentPositionsEvent) _then;

  @override
  $Res call({
    Object? instrumentId = freezed,
  }) {
    return _then(_value.copyWith(
      instrumentId: instrumentId == freezed
          ? _value.instrumentId
          : instrumentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$PortfolioInstrumentPositionsEventInitCopyWith<$Res>
    implements $PortfolioInstrumentPositionsEventCopyWith<$Res> {
  factory _$$PortfolioInstrumentPositionsEventInitCopyWith(
          _$PortfolioInstrumentPositionsEventInit value,
          $Res Function(_$PortfolioInstrumentPositionsEventInit) then) =
      __$$PortfolioInstrumentPositionsEventInitCopyWithImpl<$Res>;
  @override
  $Res call({String instrumentId});
}

/// @nodoc
class __$$PortfolioInstrumentPositionsEventInitCopyWithImpl<$Res>
    extends _$PortfolioInstrumentPositionsEventCopyWithImpl<$Res>
    implements _$$PortfolioInstrumentPositionsEventInitCopyWith<$Res> {
  __$$PortfolioInstrumentPositionsEventInitCopyWithImpl(
      _$PortfolioInstrumentPositionsEventInit _value,
      $Res Function(_$PortfolioInstrumentPositionsEventInit) _then)
      : super(
            _value, (v) => _then(v as _$PortfolioInstrumentPositionsEventInit));

  @override
  _$PortfolioInstrumentPositionsEventInit get _value =>
      super._value as _$PortfolioInstrumentPositionsEventInit;

  @override
  $Res call({
    Object? instrumentId = freezed,
  }) {
    return _then(_$PortfolioInstrumentPositionsEventInit(
      instrumentId == freezed
          ? _value.instrumentId
          : instrumentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PortfolioInstrumentPositionsEventInit
    implements PortfolioInstrumentPositionsEventInit {
  _$PortfolioInstrumentPositionsEventInit(this.instrumentId);

  @override
  final String instrumentId;

  @override
  String toString() {
    return 'PortfolioInstrumentPositionsEvent.init(instrumentId: $instrumentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioInstrumentPositionsEventInit &&
            const DeepCollectionEquality()
                .equals(other.instrumentId, instrumentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(instrumentId));

  @JsonKey(ignore: true)
  @override
  _$$PortfolioInstrumentPositionsEventInitCopyWith<
          _$PortfolioInstrumentPositionsEventInit>
      get copyWith => __$$PortfolioInstrumentPositionsEventInitCopyWithImpl<
          _$PortfolioInstrumentPositionsEventInit>(this, _$identity);

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
    TResult Function(String instrumentId)? init,
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
    required TResult Function(PortfolioInstrumentPositionsEventInit value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioInstrumentPositionsEventInit value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioInstrumentPositionsEventInit value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class PortfolioInstrumentPositionsEventInit
    implements PortfolioInstrumentPositionsEvent {
  factory PortfolioInstrumentPositionsEventInit(final String instrumentId) =
      _$PortfolioInstrumentPositionsEventInit;

  @override
  String get instrumentId;
  @override
  @JsonKey(ignore: true)
  _$$PortfolioInstrumentPositionsEventInitCopyWith<
          _$PortfolioInstrumentPositionsEventInit>
      get copyWith => throw _privateConstructorUsedError;
}
