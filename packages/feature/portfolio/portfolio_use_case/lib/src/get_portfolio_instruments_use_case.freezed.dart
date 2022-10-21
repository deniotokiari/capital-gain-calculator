// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_portfolio_instruments_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioInstrument {
  Symbol get symbol => throw _privateConstructorUsedError;
  String get instrumentId => throw _privateConstructorUsedError;
  PhysicalCurrency get currency => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Symbol symbol, String instrumentId, PhysicalCurrency currency)
        symbol,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Symbol symbol, String instrumentId, PhysicalCurrency currency)?
        symbol,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Symbol symbol, String instrumentId, PhysicalCurrency currency)?
        symbol,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PortfolioInstrumentSymbol value) symbol,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PortfolioInstrumentSymbol value)? symbol,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PortfolioInstrumentSymbol value)? symbol,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortfolioInstrumentCopyWith<PortfolioInstrument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioInstrumentCopyWith<$Res> {
  factory $PortfolioInstrumentCopyWith(
          PortfolioInstrument value, $Res Function(PortfolioInstrument) then) =
      _$PortfolioInstrumentCopyWithImpl<$Res, PortfolioInstrument>;
  @useResult
  $Res call({Symbol symbol, String instrumentId, PhysicalCurrency currency});
}

/// @nodoc
class _$PortfolioInstrumentCopyWithImpl<$Res, $Val extends PortfolioInstrument>
    implements $PortfolioInstrumentCopyWith<$Res> {
  _$PortfolioInstrumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? instrumentId = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as Symbol,
      instrumentId: null == instrumentId
          ? _value.instrumentId
          : instrumentId // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as PhysicalCurrency,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PortfolioInstrumentSymbolCopyWith<$Res>
    implements $PortfolioInstrumentCopyWith<$Res> {
  factory _$$_PortfolioInstrumentSymbolCopyWith(
          _$_PortfolioInstrumentSymbol value,
          $Res Function(_$_PortfolioInstrumentSymbol) then) =
      __$$_PortfolioInstrumentSymbolCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Symbol symbol, String instrumentId, PhysicalCurrency currency});
}

/// @nodoc
class __$$_PortfolioInstrumentSymbolCopyWithImpl<$Res>
    extends _$PortfolioInstrumentCopyWithImpl<$Res,
        _$_PortfolioInstrumentSymbol>
    implements _$$_PortfolioInstrumentSymbolCopyWith<$Res> {
  __$$_PortfolioInstrumentSymbolCopyWithImpl(
      _$_PortfolioInstrumentSymbol _value,
      $Res Function(_$_PortfolioInstrumentSymbol) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? instrumentId = null,
    Object? currency = null,
  }) {
    return _then(_$_PortfolioInstrumentSymbol(
      null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as Symbol,
      null == instrumentId
          ? _value.instrumentId
          : instrumentId // ignore: cast_nullable_to_non_nullable
              as String,
      null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as PhysicalCurrency,
    ));
  }
}

/// @nodoc

class _$_PortfolioInstrumentSymbol implements _PortfolioInstrumentSymbol {
  _$_PortfolioInstrumentSymbol(this.symbol, this.instrumentId, this.currency);

  @override
  final Symbol symbol;
  @override
  final String instrumentId;
  @override
  final PhysicalCurrency currency;

  @override
  String toString() {
    return 'PortfolioInstrument.symbol(symbol: $symbol, instrumentId: $instrumentId, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PortfolioInstrumentSymbol &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.instrumentId, instrumentId) ||
                other.instrumentId == instrumentId) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, symbol, instrumentId, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PortfolioInstrumentSymbolCopyWith<_$_PortfolioInstrumentSymbol>
      get copyWith => __$$_PortfolioInstrumentSymbolCopyWithImpl<
          _$_PortfolioInstrumentSymbol>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Symbol symbol, String instrumentId, PhysicalCurrency currency)
        symbol,
  }) {
    return symbol(this.symbol, instrumentId, currency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Symbol symbol, String instrumentId, PhysicalCurrency currency)?
        symbol,
  }) {
    return symbol?.call(this.symbol, instrumentId, currency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Symbol symbol, String instrumentId, PhysicalCurrency currency)?
        symbol,
    required TResult orElse(),
  }) {
    if (symbol != null) {
      return symbol(this.symbol, instrumentId, currency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PortfolioInstrumentSymbol value) symbol,
  }) {
    return symbol(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PortfolioInstrumentSymbol value)? symbol,
  }) {
    return symbol?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PortfolioInstrumentSymbol value)? symbol,
    required TResult orElse(),
  }) {
    if (symbol != null) {
      return symbol(this);
    }
    return orElse();
  }
}

abstract class _PortfolioInstrumentSymbol implements PortfolioInstrument {
  factory _PortfolioInstrumentSymbol(
      final Symbol symbol,
      final String instrumentId,
      final PhysicalCurrency currency) = _$_PortfolioInstrumentSymbol;

  @override
  Symbol get symbol;
  @override
  String get instrumentId;
  @override
  PhysicalCurrency get currency;
  @override
  @JsonKey(ignore: true)
  _$$_PortfolioInstrumentSymbolCopyWith<_$_PortfolioInstrumentSymbol>
      get copyWith => throw _privateConstructorUsedError;
}
