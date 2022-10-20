// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'portfolio_add_position_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioAddPositionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
    required TResult Function() submit,
    required TResult Function(double count) countChanged,
    required TResult Function(LocalDate date) dateChanged,
    required TResult Function(double price) priceChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(double count)? countChanged,
    TResult Function(LocalDate date)? dateChanged,
    TResult Function(double price)? priceChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(double count)? countChanged,
    TResult Function(LocalDate date)? dateChanged,
    TResult Function(double price)? priceChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioAddPositionEventInit value) init,
    required TResult Function(PortfolioAddPositionEventSubmit value) submit,
    required TResult Function(PortfolioAddPositionEventCountChanged value)
        countChanged,
    required TResult Function(PortfolioAddPositionEventDateChanged value)
        dateChanged,
    required TResult Function(PortfolioAddPositionEventPriceChanged value)
        priceChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioAddPositionEventInit value)? init,
    TResult Function(PortfolioAddPositionEventSubmit value)? submit,
    TResult Function(PortfolioAddPositionEventCountChanged value)? countChanged,
    TResult Function(PortfolioAddPositionEventDateChanged value)? dateChanged,
    TResult Function(PortfolioAddPositionEventPriceChanged value)? priceChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioAddPositionEventInit value)? init,
    TResult Function(PortfolioAddPositionEventSubmit value)? submit,
    TResult Function(PortfolioAddPositionEventCountChanged value)? countChanged,
    TResult Function(PortfolioAddPositionEventDateChanged value)? dateChanged,
    TResult Function(PortfolioAddPositionEventPriceChanged value)? priceChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioAddPositionEventCopyWith<$Res> {
  factory $PortfolioAddPositionEventCopyWith(PortfolioAddPositionEvent value,
          $Res Function(PortfolioAddPositionEvent) then) =
      _$PortfolioAddPositionEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PortfolioAddPositionEventCopyWithImpl<$Res>
    implements $PortfolioAddPositionEventCopyWith<$Res> {
  _$PortfolioAddPositionEventCopyWithImpl(this._value, this._then);

  final PortfolioAddPositionEvent _value;
  // ignore: unused_field
  final $Res Function(PortfolioAddPositionEvent) _then;
}

/// @nodoc
abstract class _$$PortfolioAddPositionEventInitCopyWith<$Res> {
  factory _$$PortfolioAddPositionEventInitCopyWith(
          _$PortfolioAddPositionEventInit value,
          $Res Function(_$PortfolioAddPositionEventInit) then) =
      __$$PortfolioAddPositionEventInitCopyWithImpl<$Res>;
  $Res call({String instrumentId});
}

/// @nodoc
class __$$PortfolioAddPositionEventInitCopyWithImpl<$Res>
    extends _$PortfolioAddPositionEventCopyWithImpl<$Res>
    implements _$$PortfolioAddPositionEventInitCopyWith<$Res> {
  __$$PortfolioAddPositionEventInitCopyWithImpl(
      _$PortfolioAddPositionEventInit _value,
      $Res Function(_$PortfolioAddPositionEventInit) _then)
      : super(_value, (v) => _then(v as _$PortfolioAddPositionEventInit));

  @override
  _$PortfolioAddPositionEventInit get _value =>
      super._value as _$PortfolioAddPositionEventInit;

  @override
  $Res call({
    Object? instrumentId = freezed,
  }) {
    return _then(_$PortfolioAddPositionEventInit(
      instrumentId == freezed
          ? _value.instrumentId
          : instrumentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PortfolioAddPositionEventInit implements PortfolioAddPositionEventInit {
  _$PortfolioAddPositionEventInit(this.instrumentId);

  @override
  final String instrumentId;

  @override
  String toString() {
    return 'PortfolioAddPositionEvent.init(instrumentId: $instrumentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioAddPositionEventInit &&
            const DeepCollectionEquality()
                .equals(other.instrumentId, instrumentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(instrumentId));

  @JsonKey(ignore: true)
  @override
  _$$PortfolioAddPositionEventInitCopyWith<_$PortfolioAddPositionEventInit>
      get copyWith => __$$PortfolioAddPositionEventInitCopyWithImpl<
          _$PortfolioAddPositionEventInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
    required TResult Function() submit,
    required TResult Function(double count) countChanged,
    required TResult Function(LocalDate date) dateChanged,
    required TResult Function(double price) priceChanged,
  }) {
    return init(instrumentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(double count)? countChanged,
    TResult Function(LocalDate date)? dateChanged,
    TResult Function(double price)? priceChanged,
  }) {
    return init?.call(instrumentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(double count)? countChanged,
    TResult Function(LocalDate date)? dateChanged,
    TResult Function(double price)? priceChanged,
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
    required TResult Function(PortfolioAddPositionEventInit value) init,
    required TResult Function(PortfolioAddPositionEventSubmit value) submit,
    required TResult Function(PortfolioAddPositionEventCountChanged value)
        countChanged,
    required TResult Function(PortfolioAddPositionEventDateChanged value)
        dateChanged,
    required TResult Function(PortfolioAddPositionEventPriceChanged value)
        priceChanged,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioAddPositionEventInit value)? init,
    TResult Function(PortfolioAddPositionEventSubmit value)? submit,
    TResult Function(PortfolioAddPositionEventCountChanged value)? countChanged,
    TResult Function(PortfolioAddPositionEventDateChanged value)? dateChanged,
    TResult Function(PortfolioAddPositionEventPriceChanged value)? priceChanged,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioAddPositionEventInit value)? init,
    TResult Function(PortfolioAddPositionEventSubmit value)? submit,
    TResult Function(PortfolioAddPositionEventCountChanged value)? countChanged,
    TResult Function(PortfolioAddPositionEventDateChanged value)? dateChanged,
    TResult Function(PortfolioAddPositionEventPriceChanged value)? priceChanged,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class PortfolioAddPositionEventInit
    implements PortfolioAddPositionEvent {
  factory PortfolioAddPositionEventInit(final String instrumentId) =
      _$PortfolioAddPositionEventInit;

  String get instrumentId;
  @JsonKey(ignore: true)
  _$$PortfolioAddPositionEventInitCopyWith<_$PortfolioAddPositionEventInit>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PortfolioAddPositionEventSubmitCopyWith<$Res> {
  factory _$$PortfolioAddPositionEventSubmitCopyWith(
          _$PortfolioAddPositionEventSubmit value,
          $Res Function(_$PortfolioAddPositionEventSubmit) then) =
      __$$PortfolioAddPositionEventSubmitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PortfolioAddPositionEventSubmitCopyWithImpl<$Res>
    extends _$PortfolioAddPositionEventCopyWithImpl<$Res>
    implements _$$PortfolioAddPositionEventSubmitCopyWith<$Res> {
  __$$PortfolioAddPositionEventSubmitCopyWithImpl(
      _$PortfolioAddPositionEventSubmit _value,
      $Res Function(_$PortfolioAddPositionEventSubmit) _then)
      : super(_value, (v) => _then(v as _$PortfolioAddPositionEventSubmit));

  @override
  _$PortfolioAddPositionEventSubmit get _value =>
      super._value as _$PortfolioAddPositionEventSubmit;
}

/// @nodoc

class _$PortfolioAddPositionEventSubmit
    implements PortfolioAddPositionEventSubmit {
  _$PortfolioAddPositionEventSubmit();

  @override
  String toString() {
    return 'PortfolioAddPositionEvent.submit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioAddPositionEventSubmit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
    required TResult Function() submit,
    required TResult Function(double count) countChanged,
    required TResult Function(LocalDate date) dateChanged,
    required TResult Function(double price) priceChanged,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(double count)? countChanged,
    TResult Function(LocalDate date)? dateChanged,
    TResult Function(double price)? priceChanged,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(double count)? countChanged,
    TResult Function(LocalDate date)? dateChanged,
    TResult Function(double price)? priceChanged,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioAddPositionEventInit value) init,
    required TResult Function(PortfolioAddPositionEventSubmit value) submit,
    required TResult Function(PortfolioAddPositionEventCountChanged value)
        countChanged,
    required TResult Function(PortfolioAddPositionEventDateChanged value)
        dateChanged,
    required TResult Function(PortfolioAddPositionEventPriceChanged value)
        priceChanged,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioAddPositionEventInit value)? init,
    TResult Function(PortfolioAddPositionEventSubmit value)? submit,
    TResult Function(PortfolioAddPositionEventCountChanged value)? countChanged,
    TResult Function(PortfolioAddPositionEventDateChanged value)? dateChanged,
    TResult Function(PortfolioAddPositionEventPriceChanged value)? priceChanged,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioAddPositionEventInit value)? init,
    TResult Function(PortfolioAddPositionEventSubmit value)? submit,
    TResult Function(PortfolioAddPositionEventCountChanged value)? countChanged,
    TResult Function(PortfolioAddPositionEventDateChanged value)? dateChanged,
    TResult Function(PortfolioAddPositionEventPriceChanged value)? priceChanged,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class PortfolioAddPositionEventSubmit
    implements PortfolioAddPositionEvent {
  factory PortfolioAddPositionEventSubmit() = _$PortfolioAddPositionEventSubmit;
}

/// @nodoc
abstract class _$$PortfolioAddPositionEventCountChangedCopyWith<$Res> {
  factory _$$PortfolioAddPositionEventCountChangedCopyWith(
          _$PortfolioAddPositionEventCountChanged value,
          $Res Function(_$PortfolioAddPositionEventCountChanged) then) =
      __$$PortfolioAddPositionEventCountChangedCopyWithImpl<$Res>;
  $Res call({double count});
}

/// @nodoc
class __$$PortfolioAddPositionEventCountChangedCopyWithImpl<$Res>
    extends _$PortfolioAddPositionEventCopyWithImpl<$Res>
    implements _$$PortfolioAddPositionEventCountChangedCopyWith<$Res> {
  __$$PortfolioAddPositionEventCountChangedCopyWithImpl(
      _$PortfolioAddPositionEventCountChanged _value,
      $Res Function(_$PortfolioAddPositionEventCountChanged) _then)
      : super(
            _value, (v) => _then(v as _$PortfolioAddPositionEventCountChanged));

  @override
  _$PortfolioAddPositionEventCountChanged get _value =>
      super._value as _$PortfolioAddPositionEventCountChanged;

  @override
  $Res call({
    Object? count = freezed,
  }) {
    return _then(_$PortfolioAddPositionEventCountChanged(
      count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PortfolioAddPositionEventCountChanged
    implements PortfolioAddPositionEventCountChanged {
  _$PortfolioAddPositionEventCountChanged(this.count);

  @override
  final double count;

  @override
  String toString() {
    return 'PortfolioAddPositionEvent.countChanged(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioAddPositionEventCountChanged &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$$PortfolioAddPositionEventCountChangedCopyWith<
          _$PortfolioAddPositionEventCountChanged>
      get copyWith => __$$PortfolioAddPositionEventCountChangedCopyWithImpl<
          _$PortfolioAddPositionEventCountChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
    required TResult Function() submit,
    required TResult Function(double count) countChanged,
    required TResult Function(LocalDate date) dateChanged,
    required TResult Function(double price) priceChanged,
  }) {
    return countChanged(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(double count)? countChanged,
    TResult Function(LocalDate date)? dateChanged,
    TResult Function(double price)? priceChanged,
  }) {
    return countChanged?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(double count)? countChanged,
    TResult Function(LocalDate date)? dateChanged,
    TResult Function(double price)? priceChanged,
    required TResult orElse(),
  }) {
    if (countChanged != null) {
      return countChanged(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioAddPositionEventInit value) init,
    required TResult Function(PortfolioAddPositionEventSubmit value) submit,
    required TResult Function(PortfolioAddPositionEventCountChanged value)
        countChanged,
    required TResult Function(PortfolioAddPositionEventDateChanged value)
        dateChanged,
    required TResult Function(PortfolioAddPositionEventPriceChanged value)
        priceChanged,
  }) {
    return countChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioAddPositionEventInit value)? init,
    TResult Function(PortfolioAddPositionEventSubmit value)? submit,
    TResult Function(PortfolioAddPositionEventCountChanged value)? countChanged,
    TResult Function(PortfolioAddPositionEventDateChanged value)? dateChanged,
    TResult Function(PortfolioAddPositionEventPriceChanged value)? priceChanged,
  }) {
    return countChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioAddPositionEventInit value)? init,
    TResult Function(PortfolioAddPositionEventSubmit value)? submit,
    TResult Function(PortfolioAddPositionEventCountChanged value)? countChanged,
    TResult Function(PortfolioAddPositionEventDateChanged value)? dateChanged,
    TResult Function(PortfolioAddPositionEventPriceChanged value)? priceChanged,
    required TResult orElse(),
  }) {
    if (countChanged != null) {
      return countChanged(this);
    }
    return orElse();
  }
}

abstract class PortfolioAddPositionEventCountChanged
    implements PortfolioAddPositionEvent {
  factory PortfolioAddPositionEventCountChanged(final double count) =
      _$PortfolioAddPositionEventCountChanged;

  double get count;
  @JsonKey(ignore: true)
  _$$PortfolioAddPositionEventCountChangedCopyWith<
          _$PortfolioAddPositionEventCountChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PortfolioAddPositionEventDateChangedCopyWith<$Res> {
  factory _$$PortfolioAddPositionEventDateChangedCopyWith(
          _$PortfolioAddPositionEventDateChanged value,
          $Res Function(_$PortfolioAddPositionEventDateChanged) then) =
      __$$PortfolioAddPositionEventDateChangedCopyWithImpl<$Res>;
  $Res call({LocalDate date});
}

/// @nodoc
class __$$PortfolioAddPositionEventDateChangedCopyWithImpl<$Res>
    extends _$PortfolioAddPositionEventCopyWithImpl<$Res>
    implements _$$PortfolioAddPositionEventDateChangedCopyWith<$Res> {
  __$$PortfolioAddPositionEventDateChangedCopyWithImpl(
      _$PortfolioAddPositionEventDateChanged _value,
      $Res Function(_$PortfolioAddPositionEventDateChanged) _then)
      : super(
            _value, (v) => _then(v as _$PortfolioAddPositionEventDateChanged));

  @override
  _$PortfolioAddPositionEventDateChanged get _value =>
      super._value as _$PortfolioAddPositionEventDateChanged;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_$PortfolioAddPositionEventDateChanged(
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as LocalDate,
    ));
  }
}

/// @nodoc

class _$PortfolioAddPositionEventDateChanged
    implements PortfolioAddPositionEventDateChanged {
  _$PortfolioAddPositionEventDateChanged(this.date);

  @override
  final LocalDate date;

  @override
  String toString() {
    return 'PortfolioAddPositionEvent.dateChanged(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioAddPositionEventDateChanged &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$PortfolioAddPositionEventDateChangedCopyWith<
          _$PortfolioAddPositionEventDateChanged>
      get copyWith => __$$PortfolioAddPositionEventDateChangedCopyWithImpl<
          _$PortfolioAddPositionEventDateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
    required TResult Function() submit,
    required TResult Function(double count) countChanged,
    required TResult Function(LocalDate date) dateChanged,
    required TResult Function(double price) priceChanged,
  }) {
    return dateChanged(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(double count)? countChanged,
    TResult Function(LocalDate date)? dateChanged,
    TResult Function(double price)? priceChanged,
  }) {
    return dateChanged?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(double count)? countChanged,
    TResult Function(LocalDate date)? dateChanged,
    TResult Function(double price)? priceChanged,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioAddPositionEventInit value) init,
    required TResult Function(PortfolioAddPositionEventSubmit value) submit,
    required TResult Function(PortfolioAddPositionEventCountChanged value)
        countChanged,
    required TResult Function(PortfolioAddPositionEventDateChanged value)
        dateChanged,
    required TResult Function(PortfolioAddPositionEventPriceChanged value)
        priceChanged,
  }) {
    return dateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioAddPositionEventInit value)? init,
    TResult Function(PortfolioAddPositionEventSubmit value)? submit,
    TResult Function(PortfolioAddPositionEventCountChanged value)? countChanged,
    TResult Function(PortfolioAddPositionEventDateChanged value)? dateChanged,
    TResult Function(PortfolioAddPositionEventPriceChanged value)? priceChanged,
  }) {
    return dateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioAddPositionEventInit value)? init,
    TResult Function(PortfolioAddPositionEventSubmit value)? submit,
    TResult Function(PortfolioAddPositionEventCountChanged value)? countChanged,
    TResult Function(PortfolioAddPositionEventDateChanged value)? dateChanged,
    TResult Function(PortfolioAddPositionEventPriceChanged value)? priceChanged,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(this);
    }
    return orElse();
  }
}

abstract class PortfolioAddPositionEventDateChanged
    implements PortfolioAddPositionEvent {
  factory PortfolioAddPositionEventDateChanged(final LocalDate date) =
      _$PortfolioAddPositionEventDateChanged;

  LocalDate get date;
  @JsonKey(ignore: true)
  _$$PortfolioAddPositionEventDateChangedCopyWith<
          _$PortfolioAddPositionEventDateChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PortfolioAddPositionEventPriceChangedCopyWith<$Res> {
  factory _$$PortfolioAddPositionEventPriceChangedCopyWith(
          _$PortfolioAddPositionEventPriceChanged value,
          $Res Function(_$PortfolioAddPositionEventPriceChanged) then) =
      __$$PortfolioAddPositionEventPriceChangedCopyWithImpl<$Res>;
  $Res call({double price});
}

/// @nodoc
class __$$PortfolioAddPositionEventPriceChangedCopyWithImpl<$Res>
    extends _$PortfolioAddPositionEventCopyWithImpl<$Res>
    implements _$$PortfolioAddPositionEventPriceChangedCopyWith<$Res> {
  __$$PortfolioAddPositionEventPriceChangedCopyWithImpl(
      _$PortfolioAddPositionEventPriceChanged _value,
      $Res Function(_$PortfolioAddPositionEventPriceChanged) _then)
      : super(
            _value, (v) => _then(v as _$PortfolioAddPositionEventPriceChanged));

  @override
  _$PortfolioAddPositionEventPriceChanged get _value =>
      super._value as _$PortfolioAddPositionEventPriceChanged;

  @override
  $Res call({
    Object? price = freezed,
  }) {
    return _then(_$PortfolioAddPositionEventPriceChanged(
      price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PortfolioAddPositionEventPriceChanged
    implements PortfolioAddPositionEventPriceChanged {
  _$PortfolioAddPositionEventPriceChanged(this.price);

  @override
  final double price;

  @override
  String toString() {
    return 'PortfolioAddPositionEvent.priceChanged(price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioAddPositionEventPriceChanged &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$$PortfolioAddPositionEventPriceChangedCopyWith<
          _$PortfolioAddPositionEventPriceChanged>
      get copyWith => __$$PortfolioAddPositionEventPriceChangedCopyWithImpl<
          _$PortfolioAddPositionEventPriceChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
    required TResult Function() submit,
    required TResult Function(double count) countChanged,
    required TResult Function(LocalDate date) dateChanged,
    required TResult Function(double price) priceChanged,
  }) {
    return priceChanged(price);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(double count)? countChanged,
    TResult Function(LocalDate date)? dateChanged,
    TResult Function(double price)? priceChanged,
  }) {
    return priceChanged?.call(price);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(double count)? countChanged,
    TResult Function(LocalDate date)? dateChanged,
    TResult Function(double price)? priceChanged,
    required TResult orElse(),
  }) {
    if (priceChanged != null) {
      return priceChanged(price);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioAddPositionEventInit value) init,
    required TResult Function(PortfolioAddPositionEventSubmit value) submit,
    required TResult Function(PortfolioAddPositionEventCountChanged value)
        countChanged,
    required TResult Function(PortfolioAddPositionEventDateChanged value)
        dateChanged,
    required TResult Function(PortfolioAddPositionEventPriceChanged value)
        priceChanged,
  }) {
    return priceChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioAddPositionEventInit value)? init,
    TResult Function(PortfolioAddPositionEventSubmit value)? submit,
    TResult Function(PortfolioAddPositionEventCountChanged value)? countChanged,
    TResult Function(PortfolioAddPositionEventDateChanged value)? dateChanged,
    TResult Function(PortfolioAddPositionEventPriceChanged value)? priceChanged,
  }) {
    return priceChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioAddPositionEventInit value)? init,
    TResult Function(PortfolioAddPositionEventSubmit value)? submit,
    TResult Function(PortfolioAddPositionEventCountChanged value)? countChanged,
    TResult Function(PortfolioAddPositionEventDateChanged value)? dateChanged,
    TResult Function(PortfolioAddPositionEventPriceChanged value)? priceChanged,
    required TResult orElse(),
  }) {
    if (priceChanged != null) {
      return priceChanged(this);
    }
    return orElse();
  }
}

abstract class PortfolioAddPositionEventPriceChanged
    implements PortfolioAddPositionEvent {
  factory PortfolioAddPositionEventPriceChanged(final double price) =
      _$PortfolioAddPositionEventPriceChanged;

  double get price;
  @JsonKey(ignore: true)
  _$$PortfolioAddPositionEventPriceChangedCopyWith<
          _$PortfolioAddPositionEventPriceChanged>
      get copyWith => throw _privateConstructorUsedError;
}
