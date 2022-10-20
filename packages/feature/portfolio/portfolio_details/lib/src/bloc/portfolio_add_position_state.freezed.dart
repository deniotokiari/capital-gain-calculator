// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'portfolio_add_position_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioAddPositionState {
  double? get count => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  bool get submitEnabled => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double? count, double? price, DateTime date, bool submitEnabled)
        idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            double? count, double? price, DateTime date, bool submitEnabled)?
        idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double? count, double? price, DateTime date, bool submitEnabled)?
        idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PortfolioAddPositionStateIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PortfolioAddPositionStateIdle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PortfolioAddPositionStateIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortfolioAddPositionStateCopyWith<PortfolioAddPositionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioAddPositionStateCopyWith<$Res> {
  factory $PortfolioAddPositionStateCopyWith(PortfolioAddPositionState value,
          $Res Function(PortfolioAddPositionState) then) =
      _$PortfolioAddPositionStateCopyWithImpl<$Res>;
  $Res call({double? count, double? price, DateTime date, bool submitEnabled});
}

/// @nodoc
class _$PortfolioAddPositionStateCopyWithImpl<$Res>
    implements $PortfolioAddPositionStateCopyWith<$Res> {
  _$PortfolioAddPositionStateCopyWithImpl(this._value, this._then);

  final PortfolioAddPositionState _value;
  // ignore: unused_field
  final $Res Function(PortfolioAddPositionState) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? price = freezed,
    Object? date = freezed,
    Object? submitEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as double?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      submitEnabled: submitEnabled == freezed
          ? _value.submitEnabled
          : submitEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PortfolioAddPositionStateIdleCopyWith<$Res>
    implements $PortfolioAddPositionStateCopyWith<$Res> {
  factory _$$_PortfolioAddPositionStateIdleCopyWith(
          _$_PortfolioAddPositionStateIdle value,
          $Res Function(_$_PortfolioAddPositionStateIdle) then) =
      __$$_PortfolioAddPositionStateIdleCopyWithImpl<$Res>;
  @override
  $Res call({double? count, double? price, DateTime date, bool submitEnabled});
}

/// @nodoc
class __$$_PortfolioAddPositionStateIdleCopyWithImpl<$Res>
    extends _$PortfolioAddPositionStateCopyWithImpl<$Res>
    implements _$$_PortfolioAddPositionStateIdleCopyWith<$Res> {
  __$$_PortfolioAddPositionStateIdleCopyWithImpl(
      _$_PortfolioAddPositionStateIdle _value,
      $Res Function(_$_PortfolioAddPositionStateIdle) _then)
      : super(_value, (v) => _then(v as _$_PortfolioAddPositionStateIdle));

  @override
  _$_PortfolioAddPositionStateIdle get _value =>
      super._value as _$_PortfolioAddPositionStateIdle;

  @override
  $Res call({
    Object? count = freezed,
    Object? price = freezed,
    Object? date = freezed,
    Object? submitEnabled = freezed,
  }) {
    return _then(_$_PortfolioAddPositionStateIdle(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as double?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      submitEnabled: submitEnabled == freezed
          ? _value.submitEnabled
          : submitEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PortfolioAddPositionStateIdle
    implements _PortfolioAddPositionStateIdle {
  _$_PortfolioAddPositionStateIdle(
      {required this.count,
      required this.price,
      required this.date,
      required this.submitEnabled});

  @override
  final double? count;
  @override
  final double? price;
  @override
  final DateTime date;
  @override
  final bool submitEnabled;

  @override
  String toString() {
    return 'PortfolioAddPositionState.idle(count: $count, price: $price, date: $date, submitEnabled: $submitEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PortfolioAddPositionStateIdle &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other.submitEnabled, submitEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(submitEnabled));

  @JsonKey(ignore: true)
  @override
  _$$_PortfolioAddPositionStateIdleCopyWith<_$_PortfolioAddPositionStateIdle>
      get copyWith => __$$_PortfolioAddPositionStateIdleCopyWithImpl<
          _$_PortfolioAddPositionStateIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double? count, double? price, DateTime date, bool submitEnabled)
        idle,
  }) {
    return idle(count, price, date, submitEnabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            double? count, double? price, DateTime date, bool submitEnabled)?
        idle,
  }) {
    return idle?.call(count, price, date, submitEnabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double? count, double? price, DateTime date, bool submitEnabled)?
        idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(count, price, date, submitEnabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PortfolioAddPositionStateIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PortfolioAddPositionStateIdle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PortfolioAddPositionStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _PortfolioAddPositionStateIdle
    implements PortfolioAddPositionState {
  factory _PortfolioAddPositionStateIdle(
      {required final double? count,
      required final double? price,
      required final DateTime date,
      required final bool submitEnabled}) = _$_PortfolioAddPositionStateIdle;

  @override
  double? get count;
  @override
  double? get price;
  @override
  DateTime get date;
  @override
  bool get submitEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_PortfolioAddPositionStateIdleCopyWith<_$_PortfolioAddPositionStateIdle>
      get copyWith => throw _privateConstructorUsedError;
}
