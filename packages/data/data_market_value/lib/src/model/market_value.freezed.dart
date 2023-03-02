// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MarketValue {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            CurrencyValue market, CurrencyValue interest, double percent)
        $default, {
    required TResult Function(
            double count, CurrencyValue current, CurrencyValue invested)
        calculated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            CurrencyValue market, CurrencyValue interest, double percent)?
        $default, {
    TResult? Function(
            double count, CurrencyValue current, CurrencyValue invested)?
        calculated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            CurrencyValue market, CurrencyValue interest, double percent)?
        $default, {
    TResult Function(
            double count, CurrencyValue current, CurrencyValue invested)?
        calculated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MarketValue value) $default, {
    required TResult Function(_MarketValueCalculated value) calculated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MarketValue value)? $default, {
    TResult? Function(_MarketValueCalculated value)? calculated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MarketValue value)? $default, {
    TResult Function(_MarketValueCalculated value)? calculated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketValueCopyWith<$Res> {
  factory $MarketValueCopyWith(
          MarketValue value, $Res Function(MarketValue) then) =
      _$MarketValueCopyWithImpl<$Res, MarketValue>;
}

/// @nodoc
class _$MarketValueCopyWithImpl<$Res, $Val extends MarketValue>
    implements $MarketValueCopyWith<$Res> {
  _$MarketValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_MarketValueCalculatedCopyWith<$Res> {
  factory _$$_MarketValueCalculatedCopyWith(_$_MarketValueCalculated value,
          $Res Function(_$_MarketValueCalculated) then) =
      __$$_MarketValueCalculatedCopyWithImpl<$Res>;
  @useResult
  $Res call({double count, CurrencyValue current, CurrencyValue invested});
}

/// @nodoc
class __$$_MarketValueCalculatedCopyWithImpl<$Res>
    extends _$MarketValueCopyWithImpl<$Res, _$_MarketValueCalculated>
    implements _$$_MarketValueCalculatedCopyWith<$Res> {
  __$$_MarketValueCalculatedCopyWithImpl(_$_MarketValueCalculated _value,
      $Res Function(_$_MarketValueCalculated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? current = null,
    Object? invested = null,
  }) {
    return _then(_$_MarketValueCalculated(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as double,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as CurrencyValue,
      invested: null == invested
          ? _value.invested
          : invested // ignore: cast_nullable_to_non_nullable
              as CurrencyValue,
    ));
  }
}

/// @nodoc

class _$_MarketValueCalculated extends _MarketValueCalculated {
  _$_MarketValueCalculated(
      {required this.count, required this.current, required this.invested})
      : super._();

  @override
  final double count;
  @override
  final CurrencyValue current;
  @override
  final CurrencyValue invested;

  @override
  String toString() {
    return 'MarketValue.calculated(count: $count, current: $current, invested: $invested)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarketValueCalculated &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.invested, invested) ||
                other.invested == invested));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count, current, invested);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarketValueCalculatedCopyWith<_$_MarketValueCalculated> get copyWith =>
      __$$_MarketValueCalculatedCopyWithImpl<_$_MarketValueCalculated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            CurrencyValue market, CurrencyValue interest, double percent)
        $default, {
    required TResult Function(
            double count, CurrencyValue current, CurrencyValue invested)
        calculated,
  }) {
    return calculated(count, current, invested);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            CurrencyValue market, CurrencyValue interest, double percent)?
        $default, {
    TResult? Function(
            double count, CurrencyValue current, CurrencyValue invested)?
        calculated,
  }) {
    return calculated?.call(count, current, invested);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            CurrencyValue market, CurrencyValue interest, double percent)?
        $default, {
    TResult Function(
            double count, CurrencyValue current, CurrencyValue invested)?
        calculated,
    required TResult orElse(),
  }) {
    if (calculated != null) {
      return calculated(count, current, invested);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MarketValue value) $default, {
    required TResult Function(_MarketValueCalculated value) calculated,
  }) {
    return calculated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MarketValue value)? $default, {
    TResult? Function(_MarketValueCalculated value)? calculated,
  }) {
    return calculated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MarketValue value)? $default, {
    TResult Function(_MarketValueCalculated value)? calculated,
    required TResult orElse(),
  }) {
    if (calculated != null) {
      return calculated(this);
    }
    return orElse();
  }
}

abstract class _MarketValueCalculated extends MarketValue {
  factory _MarketValueCalculated(
      {required final double count,
      required final CurrencyValue current,
      required final CurrencyValue invested}) = _$_MarketValueCalculated;
  _MarketValueCalculated._() : super._();

  double get count;
  CurrencyValue get current;
  CurrencyValue get invested;
  @JsonKey(ignore: true)
  _$$_MarketValueCalculatedCopyWith<_$_MarketValueCalculated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MarketValueCopyWith<$Res> {
  factory _$$_MarketValueCopyWith(
          _$_MarketValue value, $Res Function(_$_MarketValue) then) =
      __$$_MarketValueCopyWithImpl<$Res>;
  @useResult
  $Res call({CurrencyValue market, CurrencyValue interest, double percent});
}

/// @nodoc
class __$$_MarketValueCopyWithImpl<$Res>
    extends _$MarketValueCopyWithImpl<$Res, _$_MarketValue>
    implements _$$_MarketValueCopyWith<$Res> {
  __$$_MarketValueCopyWithImpl(
      _$_MarketValue _value, $Res Function(_$_MarketValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? market = null,
    Object? interest = null,
    Object? percent = null,
  }) {
    return _then(_$_MarketValue(
      market: null == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as CurrencyValue,
      interest: null == interest
          ? _value.interest
          : interest // ignore: cast_nullable_to_non_nullable
              as CurrencyValue,
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_MarketValue extends _MarketValue {
  _$_MarketValue(
      {required this.market, required this.interest, required this.percent})
      : super._();

  @override
  final CurrencyValue market;
  @override
  final CurrencyValue interest;
  @override
  final double percent;

  @override
  String toString() {
    return 'MarketValue(market: $market, interest: $interest, percent: $percent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarketValue &&
            (identical(other.market, market) || other.market == market) &&
            (identical(other.interest, interest) ||
                other.interest == interest) &&
            (identical(other.percent, percent) || other.percent == percent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, market, interest, percent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarketValueCopyWith<_$_MarketValue> get copyWith =>
      __$$_MarketValueCopyWithImpl<_$_MarketValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            CurrencyValue market, CurrencyValue interest, double percent)
        $default, {
    required TResult Function(
            double count, CurrencyValue current, CurrencyValue invested)
        calculated,
  }) {
    return $default(market, interest, percent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            CurrencyValue market, CurrencyValue interest, double percent)?
        $default, {
    TResult? Function(
            double count, CurrencyValue current, CurrencyValue invested)?
        calculated,
  }) {
    return $default?.call(market, interest, percent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            CurrencyValue market, CurrencyValue interest, double percent)?
        $default, {
    TResult Function(
            double count, CurrencyValue current, CurrencyValue invested)?
        calculated,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(market, interest, percent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MarketValue value) $default, {
    required TResult Function(_MarketValueCalculated value) calculated,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MarketValue value)? $default, {
    TResult? Function(_MarketValueCalculated value)? calculated,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MarketValue value)? $default, {
    TResult Function(_MarketValueCalculated value)? calculated,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _MarketValue extends MarketValue {
  factory _MarketValue(
      {required final CurrencyValue market,
      required final CurrencyValue interest,
      required final double percent}) = _$_MarketValue;
  _MarketValue._() : super._();

  CurrencyValue get market;
  CurrencyValue get interest;
  double get percent;
  @JsonKey(ignore: true)
  _$$_MarketValueCopyWith<_$_MarketValue> get copyWith =>
      throw _privateConstructorUsedError;
}
