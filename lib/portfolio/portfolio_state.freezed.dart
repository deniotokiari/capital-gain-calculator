// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'portfolio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioState {
  Portfolio get portfolio => throw _privateConstructorUsedError;
  List<SearchResultItem> get symbols => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Portfolio portfolio, List<SearchResultItem> symbols)
        idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Portfolio portfolio, List<SearchResultItem> symbols)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Portfolio portfolio, List<SearchResultItem> symbols)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PortfolioStateIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PortfolioStateIdle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PortfolioStateIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortfolioStateCopyWith<PortfolioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioStateCopyWith<$Res> {
  factory $PortfolioStateCopyWith(
          PortfolioState value, $Res Function(PortfolioState) then) =
      _$PortfolioStateCopyWithImpl<$Res>;
  $Res call({Portfolio portfolio, List<SearchResultItem> symbols});
}

/// @nodoc
class _$PortfolioStateCopyWithImpl<$Res>
    implements $PortfolioStateCopyWith<$Res> {
  _$PortfolioStateCopyWithImpl(this._value, this._then);

  final PortfolioState _value;
  // ignore: unused_field
  final $Res Function(PortfolioState) _then;

  @override
  $Res call({
    Object? portfolio = freezed,
    Object? symbols = freezed,
  }) {
    return _then(_value.copyWith(
      portfolio: portfolio == freezed
          ? _value.portfolio
          : portfolio // ignore: cast_nullable_to_non_nullable
              as Portfolio,
      symbols: symbols == freezed
          ? _value.symbols
          : symbols // ignore: cast_nullable_to_non_nullable
              as List<SearchResultItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_PortfolioStateIdleCopyWith<$Res>
    implements $PortfolioStateCopyWith<$Res> {
  factory _$$_PortfolioStateIdleCopyWith(_$_PortfolioStateIdle value,
          $Res Function(_$_PortfolioStateIdle) then) =
      __$$_PortfolioStateIdleCopyWithImpl<$Res>;
  @override
  $Res call({Portfolio portfolio, List<SearchResultItem> symbols});
}

/// @nodoc
class __$$_PortfolioStateIdleCopyWithImpl<$Res>
    extends _$PortfolioStateCopyWithImpl<$Res>
    implements _$$_PortfolioStateIdleCopyWith<$Res> {
  __$$_PortfolioStateIdleCopyWithImpl(
      _$_PortfolioStateIdle _value, $Res Function(_$_PortfolioStateIdle) _then)
      : super(_value, (v) => _then(v as _$_PortfolioStateIdle));

  @override
  _$_PortfolioStateIdle get _value => super._value as _$_PortfolioStateIdle;

  @override
  $Res call({
    Object? portfolio = freezed,
    Object? symbols = freezed,
  }) {
    return _then(_$_PortfolioStateIdle(
      portfolio == freezed
          ? _value.portfolio
          : portfolio // ignore: cast_nullable_to_non_nullable
              as Portfolio,
      symbols == freezed
          ? _value._symbols
          : symbols // ignore: cast_nullable_to_non_nullable
              as List<SearchResultItem>,
    ));
  }
}

/// @nodoc

class _$_PortfolioStateIdle implements _PortfolioStateIdle {
  _$_PortfolioStateIdle(this.portfolio, final List<SearchResultItem> symbols)
      : _symbols = symbols;

  @override
  final Portfolio portfolio;
  final List<SearchResultItem> _symbols;
  @override
  List<SearchResultItem> get symbols {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symbols);
  }

  @override
  String toString() {
    return 'PortfolioState.idle(portfolio: $portfolio, symbols: $symbols)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PortfolioStateIdle &&
            const DeepCollectionEquality().equals(other.portfolio, portfolio) &&
            const DeepCollectionEquality().equals(other._symbols, _symbols));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(portfolio),
      const DeepCollectionEquality().hash(_symbols));

  @JsonKey(ignore: true)
  @override
  _$$_PortfolioStateIdleCopyWith<_$_PortfolioStateIdle> get copyWith =>
      __$$_PortfolioStateIdleCopyWithImpl<_$_PortfolioStateIdle>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Portfolio portfolio, List<SearchResultItem> symbols)
        idle,
  }) {
    return idle(portfolio, symbols);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Portfolio portfolio, List<SearchResultItem> symbols)? idle,
  }) {
    return idle?.call(portfolio, symbols);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Portfolio portfolio, List<SearchResultItem> symbols)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(portfolio, symbols);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PortfolioStateIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PortfolioStateIdle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PortfolioStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _PortfolioStateIdle implements PortfolioState {
  factory _PortfolioStateIdle(
          final Portfolio portfolio, final List<SearchResultItem> symbols) =
      _$_PortfolioStateIdle;

  @override
  Portfolio get portfolio;
  @override
  List<SearchResultItem> get symbols;
  @override
  @JsonKey(ignore: true)
  _$$_PortfolioStateIdleCopyWith<_$_PortfolioStateIdle> get copyWith =>
      throw _privateConstructorUsedError;
}
