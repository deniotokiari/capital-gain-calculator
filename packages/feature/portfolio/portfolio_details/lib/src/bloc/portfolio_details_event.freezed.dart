// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'portfolio_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String portfolioId) init,
    required TResult Function(SymbolSearchWidgetNavigationResult symbol)
        addSymbol,
    required TResult Function() refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function(SymbolSearchWidgetNavigationResult symbol)? addSymbol,
    TResult Function()? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function(SymbolSearchWidgetNavigationResult symbol)? addSymbol,
    TResult Function()? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioDetailsEventInit value) init,
    required TResult Function(PortfolioDetailsEventAddSymbol value) addSymbol,
    required TResult Function(PortfolioDetailsEventRefresh value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsEventInit value)? init,
    TResult Function(PortfolioDetailsEventAddSymbol value)? addSymbol,
    TResult Function(PortfolioDetailsEventRefresh value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioDetailsEventInit value)? init,
    TResult Function(PortfolioDetailsEventAddSymbol value)? addSymbol,
    TResult Function(PortfolioDetailsEventRefresh value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioDetailsEventCopyWith<$Res> {
  factory $PortfolioDetailsEventCopyWith(PortfolioDetailsEvent value,
          $Res Function(PortfolioDetailsEvent) then) =
      _$PortfolioDetailsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PortfolioDetailsEventCopyWithImpl<$Res>
    implements $PortfolioDetailsEventCopyWith<$Res> {
  _$PortfolioDetailsEventCopyWithImpl(this._value, this._then);

  final PortfolioDetailsEvent _value;
  // ignore: unused_field
  final $Res Function(PortfolioDetailsEvent) _then;
}

/// @nodoc
abstract class _$$PortfolioDetailsEventInitCopyWith<$Res> {
  factory _$$PortfolioDetailsEventInitCopyWith(
          _$PortfolioDetailsEventInit value,
          $Res Function(_$PortfolioDetailsEventInit) then) =
      __$$PortfolioDetailsEventInitCopyWithImpl<$Res>;
  $Res call({String portfolioId});
}

/// @nodoc
class __$$PortfolioDetailsEventInitCopyWithImpl<$Res>
    extends _$PortfolioDetailsEventCopyWithImpl<$Res>
    implements _$$PortfolioDetailsEventInitCopyWith<$Res> {
  __$$PortfolioDetailsEventInitCopyWithImpl(_$PortfolioDetailsEventInit _value,
      $Res Function(_$PortfolioDetailsEventInit) _then)
      : super(_value, (v) => _then(v as _$PortfolioDetailsEventInit));

  @override
  _$PortfolioDetailsEventInit get _value =>
      super._value as _$PortfolioDetailsEventInit;

  @override
  $Res call({
    Object? portfolioId = freezed,
  }) {
    return _then(_$PortfolioDetailsEventInit(
      portfolioId == freezed
          ? _value.portfolioId
          : portfolioId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PortfolioDetailsEventInit implements PortfolioDetailsEventInit {
  _$PortfolioDetailsEventInit(this.portfolioId);

  @override
  final String portfolioId;

  @override
  String toString() {
    return 'PortfolioDetailsEvent.init(portfolioId: $portfolioId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioDetailsEventInit &&
            const DeepCollectionEquality()
                .equals(other.portfolioId, portfolioId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(portfolioId));

  @JsonKey(ignore: true)
  @override
  _$$PortfolioDetailsEventInitCopyWith<_$PortfolioDetailsEventInit>
      get copyWith => __$$PortfolioDetailsEventInitCopyWithImpl<
          _$PortfolioDetailsEventInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String portfolioId) init,
    required TResult Function(SymbolSearchWidgetNavigationResult symbol)
        addSymbol,
    required TResult Function() refresh,
  }) {
    return init(portfolioId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function(SymbolSearchWidgetNavigationResult symbol)? addSymbol,
    TResult Function()? refresh,
  }) {
    return init?.call(portfolioId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function(SymbolSearchWidgetNavigationResult symbol)? addSymbol,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(portfolioId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioDetailsEventInit value) init,
    required TResult Function(PortfolioDetailsEventAddSymbol value) addSymbol,
    required TResult Function(PortfolioDetailsEventRefresh value) refresh,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsEventInit value)? init,
    TResult Function(PortfolioDetailsEventAddSymbol value)? addSymbol,
    TResult Function(PortfolioDetailsEventRefresh value)? refresh,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioDetailsEventInit value)? init,
    TResult Function(PortfolioDetailsEventAddSymbol value)? addSymbol,
    TResult Function(PortfolioDetailsEventRefresh value)? refresh,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class PortfolioDetailsEventInit implements PortfolioDetailsEvent {
  factory PortfolioDetailsEventInit(final String portfolioId) =
      _$PortfolioDetailsEventInit;

  String get portfolioId;
  @JsonKey(ignore: true)
  _$$PortfolioDetailsEventInitCopyWith<_$PortfolioDetailsEventInit>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PortfolioDetailsEventAddSymbolCopyWith<$Res> {
  factory _$$PortfolioDetailsEventAddSymbolCopyWith(
          _$PortfolioDetailsEventAddSymbol value,
          $Res Function(_$PortfolioDetailsEventAddSymbol) then) =
      __$$PortfolioDetailsEventAddSymbolCopyWithImpl<$Res>;
  $Res call({SymbolSearchWidgetNavigationResult symbol});
}

/// @nodoc
class __$$PortfolioDetailsEventAddSymbolCopyWithImpl<$Res>
    extends _$PortfolioDetailsEventCopyWithImpl<$Res>
    implements _$$PortfolioDetailsEventAddSymbolCopyWith<$Res> {
  __$$PortfolioDetailsEventAddSymbolCopyWithImpl(
      _$PortfolioDetailsEventAddSymbol _value,
      $Res Function(_$PortfolioDetailsEventAddSymbol) _then)
      : super(_value, (v) => _then(v as _$PortfolioDetailsEventAddSymbol));

  @override
  _$PortfolioDetailsEventAddSymbol get _value =>
      super._value as _$PortfolioDetailsEventAddSymbol;

  @override
  $Res call({
    Object? symbol = freezed,
  }) {
    return _then(_$PortfolioDetailsEventAddSymbol(
      symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as SymbolSearchWidgetNavigationResult,
    ));
  }
}

/// @nodoc

class _$PortfolioDetailsEventAddSymbol
    implements PortfolioDetailsEventAddSymbol {
  _$PortfolioDetailsEventAddSymbol(this.symbol);

  @override
  final SymbolSearchWidgetNavigationResult symbol;

  @override
  String toString() {
    return 'PortfolioDetailsEvent.addSymbol(symbol: $symbol)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioDetailsEventAddSymbol &&
            const DeepCollectionEquality().equals(other.symbol, symbol));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(symbol));

  @JsonKey(ignore: true)
  @override
  _$$PortfolioDetailsEventAddSymbolCopyWith<_$PortfolioDetailsEventAddSymbol>
      get copyWith => __$$PortfolioDetailsEventAddSymbolCopyWithImpl<
          _$PortfolioDetailsEventAddSymbol>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String portfolioId) init,
    required TResult Function(SymbolSearchWidgetNavigationResult symbol)
        addSymbol,
    required TResult Function() refresh,
  }) {
    return addSymbol(symbol);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function(SymbolSearchWidgetNavigationResult symbol)? addSymbol,
    TResult Function()? refresh,
  }) {
    return addSymbol?.call(symbol);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function(SymbolSearchWidgetNavigationResult symbol)? addSymbol,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (addSymbol != null) {
      return addSymbol(symbol);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioDetailsEventInit value) init,
    required TResult Function(PortfolioDetailsEventAddSymbol value) addSymbol,
    required TResult Function(PortfolioDetailsEventRefresh value) refresh,
  }) {
    return addSymbol(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsEventInit value)? init,
    TResult Function(PortfolioDetailsEventAddSymbol value)? addSymbol,
    TResult Function(PortfolioDetailsEventRefresh value)? refresh,
  }) {
    return addSymbol?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioDetailsEventInit value)? init,
    TResult Function(PortfolioDetailsEventAddSymbol value)? addSymbol,
    TResult Function(PortfolioDetailsEventRefresh value)? refresh,
    required TResult orElse(),
  }) {
    if (addSymbol != null) {
      return addSymbol(this);
    }
    return orElse();
  }
}

abstract class PortfolioDetailsEventAddSymbol implements PortfolioDetailsEvent {
  factory PortfolioDetailsEventAddSymbol(
          final SymbolSearchWidgetNavigationResult symbol) =
      _$PortfolioDetailsEventAddSymbol;

  SymbolSearchWidgetNavigationResult get symbol;
  @JsonKey(ignore: true)
  _$$PortfolioDetailsEventAddSymbolCopyWith<_$PortfolioDetailsEventAddSymbol>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PortfolioDetailsEventRefreshCopyWith<$Res> {
  factory _$$PortfolioDetailsEventRefreshCopyWith(
          _$PortfolioDetailsEventRefresh value,
          $Res Function(_$PortfolioDetailsEventRefresh) then) =
      __$$PortfolioDetailsEventRefreshCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PortfolioDetailsEventRefreshCopyWithImpl<$Res>
    extends _$PortfolioDetailsEventCopyWithImpl<$Res>
    implements _$$PortfolioDetailsEventRefreshCopyWith<$Res> {
  __$$PortfolioDetailsEventRefreshCopyWithImpl(
      _$PortfolioDetailsEventRefresh _value,
      $Res Function(_$PortfolioDetailsEventRefresh) _then)
      : super(_value, (v) => _then(v as _$PortfolioDetailsEventRefresh));

  @override
  _$PortfolioDetailsEventRefresh get _value =>
      super._value as _$PortfolioDetailsEventRefresh;
}

/// @nodoc

class _$PortfolioDetailsEventRefresh implements PortfolioDetailsEventRefresh {
  _$PortfolioDetailsEventRefresh();

  @override
  String toString() {
    return 'PortfolioDetailsEvent.refresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioDetailsEventRefresh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String portfolioId) init,
    required TResult Function(SymbolSearchWidgetNavigationResult symbol)
        addSymbol,
    required TResult Function() refresh,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function(SymbolSearchWidgetNavigationResult symbol)? addSymbol,
    TResult Function()? refresh,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function(SymbolSearchWidgetNavigationResult symbol)? addSymbol,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioDetailsEventInit value) init,
    required TResult Function(PortfolioDetailsEventAddSymbol value) addSymbol,
    required TResult Function(PortfolioDetailsEventRefresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsEventInit value)? init,
    TResult Function(PortfolioDetailsEventAddSymbol value)? addSymbol,
    TResult Function(PortfolioDetailsEventRefresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioDetailsEventInit value)? init,
    TResult Function(PortfolioDetailsEventAddSymbol value)? addSymbol,
    TResult Function(PortfolioDetailsEventRefresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class PortfolioDetailsEventRefresh implements PortfolioDetailsEvent {
  factory PortfolioDetailsEventRefresh() = _$PortfolioDetailsEventRefresh;
}
