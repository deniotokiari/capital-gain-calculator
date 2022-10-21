// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'portfolio_details_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioDetailsViewModel {
  String get portfolioName => throw _privateConstructorUsedError;
  List<String> get tickers => throw _privateConstructorUsedError;
  List<PortfolioDetailsSymbolViewModel> get symbols =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortfolioDetailsViewModelCopyWith<PortfolioDetailsViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioDetailsViewModelCopyWith<$Res> {
  factory $PortfolioDetailsViewModelCopyWith(PortfolioDetailsViewModel value,
          $Res Function(PortfolioDetailsViewModel) then) =
      _$PortfolioDetailsViewModelCopyWithImpl<$Res>;
  $Res call(
      {String portfolioName,
      List<String> tickers,
      List<PortfolioDetailsSymbolViewModel> symbols});
}

/// @nodoc
class _$PortfolioDetailsViewModelCopyWithImpl<$Res>
    implements $PortfolioDetailsViewModelCopyWith<$Res> {
  _$PortfolioDetailsViewModelCopyWithImpl(this._value, this._then);

  final PortfolioDetailsViewModel _value;
  // ignore: unused_field
  final $Res Function(PortfolioDetailsViewModel) _then;

  @override
  $Res call({
    Object? portfolioName = freezed,
    Object? tickers = freezed,
    Object? symbols = freezed,
  }) {
    return _then(_value.copyWith(
      portfolioName: portfolioName == freezed
          ? _value.portfolioName
          : portfolioName // ignore: cast_nullable_to_non_nullable
              as String,
      tickers: tickers == freezed
          ? _value.tickers
          : tickers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      symbols: symbols == freezed
          ? _value.symbols
          : symbols // ignore: cast_nullable_to_non_nullable
              as List<PortfolioDetailsSymbolViewModel>,
    ));
  }
}

/// @nodoc
abstract class _$$$PortfolioDetailsViewModelCopyWith<$Res>
    implements $PortfolioDetailsViewModelCopyWith<$Res> {
  factory _$$$PortfolioDetailsViewModelCopyWith(
          _$$PortfolioDetailsViewModel value,
          $Res Function(_$$PortfolioDetailsViewModel) then) =
      __$$$PortfolioDetailsViewModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String portfolioName,
      List<String> tickers,
      List<PortfolioDetailsSymbolViewModel> symbols});
}

/// @nodoc
class __$$$PortfolioDetailsViewModelCopyWithImpl<$Res>
    extends _$PortfolioDetailsViewModelCopyWithImpl<$Res>
    implements _$$$PortfolioDetailsViewModelCopyWith<$Res> {
  __$$$PortfolioDetailsViewModelCopyWithImpl(
      _$$PortfolioDetailsViewModel _value,
      $Res Function(_$$PortfolioDetailsViewModel) _then)
      : super(_value, (v) => _then(v as _$$PortfolioDetailsViewModel));

  @override
  _$$PortfolioDetailsViewModel get _value =>
      super._value as _$$PortfolioDetailsViewModel;

  @override
  $Res call({
    Object? portfolioName = freezed,
    Object? tickers = freezed,
    Object? symbols = freezed,
  }) {
    return _then(_$$PortfolioDetailsViewModel(
      portfolioName == freezed
          ? _value.portfolioName
          : portfolioName // ignore: cast_nullable_to_non_nullable
              as String,
      tickers == freezed
          ? _value._tickers
          : tickers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      symbols == freezed
          ? _value._symbols
          : symbols // ignore: cast_nullable_to_non_nullable
              as List<PortfolioDetailsSymbolViewModel>,
    ));
  }
}

/// @nodoc

class _$$PortfolioDetailsViewModel implements $PortfolioDetailsViewModel {
  _$$PortfolioDetailsViewModel(this.portfolioName, final List<String> tickers,
      final List<PortfolioDetailsSymbolViewModel> symbols)
      : _tickers = tickers,
        _symbols = symbols;

  @override
  final String portfolioName;
  final List<String> _tickers;
  @override
  List<String> get tickers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickers);
  }

  final List<PortfolioDetailsSymbolViewModel> _symbols;
  @override
  List<PortfolioDetailsSymbolViewModel> get symbols {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symbols);
  }

  @override
  String toString() {
    return 'PortfolioDetailsViewModel(portfolioName: $portfolioName, tickers: $tickers, symbols: $symbols)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$PortfolioDetailsViewModel &&
            const DeepCollectionEquality()
                .equals(other.portfolioName, portfolioName) &&
            const DeepCollectionEquality().equals(other._tickers, _tickers) &&
            const DeepCollectionEquality().equals(other._symbols, _symbols));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(portfolioName),
      const DeepCollectionEquality().hash(_tickers),
      const DeepCollectionEquality().hash(_symbols));

  @JsonKey(ignore: true)
  @override
  _$$$PortfolioDetailsViewModelCopyWith<_$$PortfolioDetailsViewModel>
      get copyWith => __$$$PortfolioDetailsViewModelCopyWithImpl<
          _$$PortfolioDetailsViewModel>(this, _$identity);
}

abstract class $PortfolioDetailsViewModel implements PortfolioDetailsViewModel {
  factory $PortfolioDetailsViewModel(
          final String portfolioName,
          final List<String> tickers,
          final List<PortfolioDetailsSymbolViewModel> symbols) =
      _$$PortfolioDetailsViewModel;

  @override
  String get portfolioName;
  @override
  List<String> get tickers;
  @override
  List<PortfolioDetailsSymbolViewModel> get symbols;
  @override
  @JsonKey(ignore: true)
  _$$$PortfolioDetailsViewModelCopyWith<_$$PortfolioDetailsViewModel>
      get copyWith => throw _privateConstructorUsedError;
}
