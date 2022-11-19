// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'portfolio_details_instrument_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioDetailsInstrumentViewModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String ticker, PhysicalCurrencyValue? marketValue,
            PhysicalCurrencyValue? returnValue, PercentValue? returnPercent)
        $default, {
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String ticker, PhysicalCurrencyValue? marketValue,
            PhysicalCurrencyValue? returnValue, PercentValue? returnPercent)?
        $default, {
    TResult Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String ticker, PhysicalCurrencyValue? marketValue,
            PhysicalCurrencyValue? returnValue, PercentValue? returnPercent)?
        $default, {
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PortfolioDetailsInstrumentViewModel value) $default, {
    required TResult Function(_PortfolioDetailsInstrumentViewModelEmpty value)
        empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_PortfolioDetailsInstrumentViewModel value)? $default, {
    TResult Function(_PortfolioDetailsInstrumentViewModelEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PortfolioDetailsInstrumentViewModel value)? $default, {
    TResult Function(_PortfolioDetailsInstrumentViewModelEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioDetailsInstrumentViewModelCopyWith<$Res> {
  factory $PortfolioDetailsInstrumentViewModelCopyWith(
          PortfolioDetailsInstrumentViewModel value,
          $Res Function(PortfolioDetailsInstrumentViewModel) then) =
      _$PortfolioDetailsInstrumentViewModelCopyWithImpl<$Res>;
}

/// @nodoc
class _$PortfolioDetailsInstrumentViewModelCopyWithImpl<$Res>
    implements $PortfolioDetailsInstrumentViewModelCopyWith<$Res> {
  _$PortfolioDetailsInstrumentViewModelCopyWithImpl(this._value, this._then);

  final PortfolioDetailsInstrumentViewModel _value;
  // ignore: unused_field
  final $Res Function(PortfolioDetailsInstrumentViewModel) _then;
}

/// @nodoc
abstract class _$$_PortfolioDetailsInstrumentViewModelCopyWith<$Res> {
  factory _$$_PortfolioDetailsInstrumentViewModelCopyWith(
          _$_PortfolioDetailsInstrumentViewModel value,
          $Res Function(_$_PortfolioDetailsInstrumentViewModel) then) =
      __$$_PortfolioDetailsInstrumentViewModelCopyWithImpl<$Res>;
  $Res call(
      {String ticker,
      PhysicalCurrencyValue? marketValue,
      PhysicalCurrencyValue? returnValue,
      PercentValue? returnPercent});
}

/// @nodoc
class __$$_PortfolioDetailsInstrumentViewModelCopyWithImpl<$Res>
    extends _$PortfolioDetailsInstrumentViewModelCopyWithImpl<$Res>
    implements _$$_PortfolioDetailsInstrumentViewModelCopyWith<$Res> {
  __$$_PortfolioDetailsInstrumentViewModelCopyWithImpl(
      _$_PortfolioDetailsInstrumentViewModel _value,
      $Res Function(_$_PortfolioDetailsInstrumentViewModel) _then)
      : super(
            _value, (v) => _then(v as _$_PortfolioDetailsInstrumentViewModel));

  @override
  _$_PortfolioDetailsInstrumentViewModel get _value =>
      super._value as _$_PortfolioDetailsInstrumentViewModel;

  @override
  $Res call({
    Object? ticker = freezed,
    Object? marketValue = freezed,
    Object? returnValue = freezed,
    Object? returnPercent = freezed,
  }) {
    return _then(_$_PortfolioDetailsInstrumentViewModel(
      ticker: ticker == freezed
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      marketValue: marketValue == freezed
          ? _value.marketValue
          : marketValue // ignore: cast_nullable_to_non_nullable
              as PhysicalCurrencyValue?,
      returnValue: returnValue == freezed
          ? _value.returnValue
          : returnValue // ignore: cast_nullable_to_non_nullable
              as PhysicalCurrencyValue?,
      returnPercent: returnPercent == freezed
          ? _value.returnPercent
          : returnPercent // ignore: cast_nullable_to_non_nullable
              as PercentValue?,
    ));
  }
}

/// @nodoc

class _$_PortfolioDetailsInstrumentViewModel
    implements _PortfolioDetailsInstrumentViewModel {
  _$_PortfolioDetailsInstrumentViewModel(
      {required this.ticker,
      required this.marketValue,
      required this.returnValue,
      required this.returnPercent});

  @override
  final String ticker;
  @override
  final PhysicalCurrencyValue? marketValue;
  @override
  final PhysicalCurrencyValue? returnValue;
  @override
  final PercentValue? returnPercent;

  @override
  String toString() {
    return 'PortfolioDetailsInstrumentViewModel(ticker: $ticker, marketValue: $marketValue, returnValue: $returnValue, returnPercent: $returnPercent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PortfolioDetailsInstrumentViewModel &&
            const DeepCollectionEquality().equals(other.ticker, ticker) &&
            const DeepCollectionEquality()
                .equals(other.marketValue, marketValue) &&
            const DeepCollectionEquality()
                .equals(other.returnValue, returnValue) &&
            const DeepCollectionEquality()
                .equals(other.returnPercent, returnPercent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ticker),
      const DeepCollectionEquality().hash(marketValue),
      const DeepCollectionEquality().hash(returnValue),
      const DeepCollectionEquality().hash(returnPercent));

  @JsonKey(ignore: true)
  @override
  _$$_PortfolioDetailsInstrumentViewModelCopyWith<
          _$_PortfolioDetailsInstrumentViewModel>
      get copyWith => __$$_PortfolioDetailsInstrumentViewModelCopyWithImpl<
          _$_PortfolioDetailsInstrumentViewModel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String ticker, PhysicalCurrencyValue? marketValue,
            PhysicalCurrencyValue? returnValue, PercentValue? returnPercent)
        $default, {
    required TResult Function() empty,
  }) {
    return $default(ticker, marketValue, returnValue, returnPercent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String ticker, PhysicalCurrencyValue? marketValue,
            PhysicalCurrencyValue? returnValue, PercentValue? returnPercent)?
        $default, {
    TResult Function()? empty,
  }) {
    return $default?.call(ticker, marketValue, returnValue, returnPercent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String ticker, PhysicalCurrencyValue? marketValue,
            PhysicalCurrencyValue? returnValue, PercentValue? returnPercent)?
        $default, {
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(ticker, marketValue, returnValue, returnPercent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PortfolioDetailsInstrumentViewModel value) $default, {
    required TResult Function(_PortfolioDetailsInstrumentViewModelEmpty value)
        empty,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_PortfolioDetailsInstrumentViewModel value)? $default, {
    TResult Function(_PortfolioDetailsInstrumentViewModelEmpty value)? empty,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PortfolioDetailsInstrumentViewModel value)? $default, {
    TResult Function(_PortfolioDetailsInstrumentViewModelEmpty value)? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _PortfolioDetailsInstrumentViewModel
    implements PortfolioDetailsInstrumentViewModel {
  factory _PortfolioDetailsInstrumentViewModel(
          {required final String ticker,
          required final PhysicalCurrencyValue? marketValue,
          required final PhysicalCurrencyValue? returnValue,
          required final PercentValue? returnPercent}) =
      _$_PortfolioDetailsInstrumentViewModel;

  String get ticker;
  PhysicalCurrencyValue? get marketValue;
  PhysicalCurrencyValue? get returnValue;
  PercentValue? get returnPercent;
  @JsonKey(ignore: true)
  _$$_PortfolioDetailsInstrumentViewModelCopyWith<
          _$_PortfolioDetailsInstrumentViewModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PortfolioDetailsInstrumentViewModelEmptyCopyWith<$Res> {
  factory _$$_PortfolioDetailsInstrumentViewModelEmptyCopyWith(
          _$_PortfolioDetailsInstrumentViewModelEmpty value,
          $Res Function(_$_PortfolioDetailsInstrumentViewModelEmpty) then) =
      __$$_PortfolioDetailsInstrumentViewModelEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PortfolioDetailsInstrumentViewModelEmptyCopyWithImpl<$Res>
    extends _$PortfolioDetailsInstrumentViewModelCopyWithImpl<$Res>
    implements _$$_PortfolioDetailsInstrumentViewModelEmptyCopyWith<$Res> {
  __$$_PortfolioDetailsInstrumentViewModelEmptyCopyWithImpl(
      _$_PortfolioDetailsInstrumentViewModelEmpty _value,
      $Res Function(_$_PortfolioDetailsInstrumentViewModelEmpty) _then)
      : super(_value,
            (v) => _then(v as _$_PortfolioDetailsInstrumentViewModelEmpty));

  @override
  _$_PortfolioDetailsInstrumentViewModelEmpty get _value =>
      super._value as _$_PortfolioDetailsInstrumentViewModelEmpty;
}

/// @nodoc

class _$_PortfolioDetailsInstrumentViewModelEmpty
    implements _PortfolioDetailsInstrumentViewModelEmpty {
  _$_PortfolioDetailsInstrumentViewModelEmpty();

  @override
  String toString() {
    return 'PortfolioDetailsInstrumentViewModel.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PortfolioDetailsInstrumentViewModelEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String ticker, PhysicalCurrencyValue? marketValue,
            PhysicalCurrencyValue? returnValue, PercentValue? returnPercent)
        $default, {
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String ticker, PhysicalCurrencyValue? marketValue,
            PhysicalCurrencyValue? returnValue, PercentValue? returnPercent)?
        $default, {
    TResult Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String ticker, PhysicalCurrencyValue? marketValue,
            PhysicalCurrencyValue? returnValue, PercentValue? returnPercent)?
        $default, {
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PortfolioDetailsInstrumentViewModel value) $default, {
    required TResult Function(_PortfolioDetailsInstrumentViewModelEmpty value)
        empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_PortfolioDetailsInstrumentViewModel value)? $default, {
    TResult Function(_PortfolioDetailsInstrumentViewModelEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PortfolioDetailsInstrumentViewModel value)? $default, {
    TResult Function(_PortfolioDetailsInstrumentViewModelEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _PortfolioDetailsInstrumentViewModelEmpty
    implements PortfolioDetailsInstrumentViewModel {
  factory _PortfolioDetailsInstrumentViewModelEmpty() =
      _$_PortfolioDetailsInstrumentViewModelEmpty;
}
