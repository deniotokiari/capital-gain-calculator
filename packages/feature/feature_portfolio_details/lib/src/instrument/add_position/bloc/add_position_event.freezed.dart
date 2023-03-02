// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_position_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPositionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
    required TResult Function() submit,
    required TResult Function(String? currency) currencyChanged,
    required TResult Function(String? price) priceChanged,
    required TResult Function(String? count) countChanged,
    required TResult Function(DateTime date) dateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String instrumentId)? init,
    TResult? Function()? submit,
    TResult? Function(String? currency)? currencyChanged,
    TResult? Function(String? price)? priceChanged,
    TResult? Function(String? count)? countChanged,
    TResult? Function(DateTime date)? dateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(String? currency)? currencyChanged,
    TResult Function(String? price)? priceChanged,
    TResult Function(String? count)? countChanged,
    TResult Function(DateTime date)? dateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddPositionEventInit value) init,
    required TResult Function(AddPositionEventSubmit value) submit,
    required TResult Function(AddPositionEventCurrencyChanged value)
        currencyChanged,
    required TResult Function(AddPositionEventPriceChanged value) priceChanged,
    required TResult Function(AddPositionEventCountChanged value) countChanged,
    required TResult Function(AddPositionEventDateChanged value) dateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddPositionEventInit value)? init,
    TResult? Function(AddPositionEventSubmit value)? submit,
    TResult? Function(AddPositionEventCurrencyChanged value)? currencyChanged,
    TResult? Function(AddPositionEventPriceChanged value)? priceChanged,
    TResult? Function(AddPositionEventCountChanged value)? countChanged,
    TResult? Function(AddPositionEventDateChanged value)? dateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddPositionEventInit value)? init,
    TResult Function(AddPositionEventSubmit value)? submit,
    TResult Function(AddPositionEventCurrencyChanged value)? currencyChanged,
    TResult Function(AddPositionEventPriceChanged value)? priceChanged,
    TResult Function(AddPositionEventCountChanged value)? countChanged,
    TResult Function(AddPositionEventDateChanged value)? dateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPositionEventCopyWith<$Res> {
  factory $AddPositionEventCopyWith(
          AddPositionEvent value, $Res Function(AddPositionEvent) then) =
      _$AddPositionEventCopyWithImpl<$Res, AddPositionEvent>;
}

/// @nodoc
class _$AddPositionEventCopyWithImpl<$Res, $Val extends AddPositionEvent>
    implements $AddPositionEventCopyWith<$Res> {
  _$AddPositionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddPositionEventInitCopyWith<$Res> {
  factory _$$AddPositionEventInitCopyWith(_$AddPositionEventInit value,
          $Res Function(_$AddPositionEventInit) then) =
      __$$AddPositionEventInitCopyWithImpl<$Res>;
  @useResult
  $Res call({String instrumentId});
}

/// @nodoc
class __$$AddPositionEventInitCopyWithImpl<$Res>
    extends _$AddPositionEventCopyWithImpl<$Res, _$AddPositionEventInit>
    implements _$$AddPositionEventInitCopyWith<$Res> {
  __$$AddPositionEventInitCopyWithImpl(_$AddPositionEventInit _value,
      $Res Function(_$AddPositionEventInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instrumentId = null,
  }) {
    return _then(_$AddPositionEventInit(
      null == instrumentId
          ? _value.instrumentId
          : instrumentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddPositionEventInit implements AddPositionEventInit {
  _$AddPositionEventInit(this.instrumentId);

  @override
  final String instrumentId;

  @override
  String toString() {
    return 'AddPositionEvent.init(instrumentId: $instrumentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPositionEventInit &&
            (identical(other.instrumentId, instrumentId) ||
                other.instrumentId == instrumentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, instrumentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPositionEventInitCopyWith<_$AddPositionEventInit> get copyWith =>
      __$$AddPositionEventInitCopyWithImpl<_$AddPositionEventInit>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
    required TResult Function() submit,
    required TResult Function(String? currency) currencyChanged,
    required TResult Function(String? price) priceChanged,
    required TResult Function(String? count) countChanged,
    required TResult Function(DateTime date) dateChanged,
  }) {
    return init(instrumentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String instrumentId)? init,
    TResult? Function()? submit,
    TResult? Function(String? currency)? currencyChanged,
    TResult? Function(String? price)? priceChanged,
    TResult? Function(String? count)? countChanged,
    TResult? Function(DateTime date)? dateChanged,
  }) {
    return init?.call(instrumentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(String? currency)? currencyChanged,
    TResult Function(String? price)? priceChanged,
    TResult Function(String? count)? countChanged,
    TResult Function(DateTime date)? dateChanged,
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
    required TResult Function(AddPositionEventInit value) init,
    required TResult Function(AddPositionEventSubmit value) submit,
    required TResult Function(AddPositionEventCurrencyChanged value)
        currencyChanged,
    required TResult Function(AddPositionEventPriceChanged value) priceChanged,
    required TResult Function(AddPositionEventCountChanged value) countChanged,
    required TResult Function(AddPositionEventDateChanged value) dateChanged,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddPositionEventInit value)? init,
    TResult? Function(AddPositionEventSubmit value)? submit,
    TResult? Function(AddPositionEventCurrencyChanged value)? currencyChanged,
    TResult? Function(AddPositionEventPriceChanged value)? priceChanged,
    TResult? Function(AddPositionEventCountChanged value)? countChanged,
    TResult? Function(AddPositionEventDateChanged value)? dateChanged,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddPositionEventInit value)? init,
    TResult Function(AddPositionEventSubmit value)? submit,
    TResult Function(AddPositionEventCurrencyChanged value)? currencyChanged,
    TResult Function(AddPositionEventPriceChanged value)? priceChanged,
    TResult Function(AddPositionEventCountChanged value)? countChanged,
    TResult Function(AddPositionEventDateChanged value)? dateChanged,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class AddPositionEventInit implements AddPositionEvent {
  factory AddPositionEventInit(final String instrumentId) =
      _$AddPositionEventInit;

  String get instrumentId;
  @JsonKey(ignore: true)
  _$$AddPositionEventInitCopyWith<_$AddPositionEventInit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPositionEventSubmitCopyWith<$Res> {
  factory _$$AddPositionEventSubmitCopyWith(_$AddPositionEventSubmit value,
          $Res Function(_$AddPositionEventSubmit) then) =
      __$$AddPositionEventSubmitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddPositionEventSubmitCopyWithImpl<$Res>
    extends _$AddPositionEventCopyWithImpl<$Res, _$AddPositionEventSubmit>
    implements _$$AddPositionEventSubmitCopyWith<$Res> {
  __$$AddPositionEventSubmitCopyWithImpl(_$AddPositionEventSubmit _value,
      $Res Function(_$AddPositionEventSubmit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddPositionEventSubmit implements AddPositionEventSubmit {
  _$AddPositionEventSubmit();

  @override
  String toString() {
    return 'AddPositionEvent.submit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddPositionEventSubmit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
    required TResult Function() submit,
    required TResult Function(String? currency) currencyChanged,
    required TResult Function(String? price) priceChanged,
    required TResult Function(String? count) countChanged,
    required TResult Function(DateTime date) dateChanged,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String instrumentId)? init,
    TResult? Function()? submit,
    TResult? Function(String? currency)? currencyChanged,
    TResult? Function(String? price)? priceChanged,
    TResult? Function(String? count)? countChanged,
    TResult? Function(DateTime date)? dateChanged,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(String? currency)? currencyChanged,
    TResult Function(String? price)? priceChanged,
    TResult Function(String? count)? countChanged,
    TResult Function(DateTime date)? dateChanged,
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
    required TResult Function(AddPositionEventInit value) init,
    required TResult Function(AddPositionEventSubmit value) submit,
    required TResult Function(AddPositionEventCurrencyChanged value)
        currencyChanged,
    required TResult Function(AddPositionEventPriceChanged value) priceChanged,
    required TResult Function(AddPositionEventCountChanged value) countChanged,
    required TResult Function(AddPositionEventDateChanged value) dateChanged,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddPositionEventInit value)? init,
    TResult? Function(AddPositionEventSubmit value)? submit,
    TResult? Function(AddPositionEventCurrencyChanged value)? currencyChanged,
    TResult? Function(AddPositionEventPriceChanged value)? priceChanged,
    TResult? Function(AddPositionEventCountChanged value)? countChanged,
    TResult? Function(AddPositionEventDateChanged value)? dateChanged,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddPositionEventInit value)? init,
    TResult Function(AddPositionEventSubmit value)? submit,
    TResult Function(AddPositionEventCurrencyChanged value)? currencyChanged,
    TResult Function(AddPositionEventPriceChanged value)? priceChanged,
    TResult Function(AddPositionEventCountChanged value)? countChanged,
    TResult Function(AddPositionEventDateChanged value)? dateChanged,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class AddPositionEventSubmit implements AddPositionEvent {
  factory AddPositionEventSubmit() = _$AddPositionEventSubmit;
}

/// @nodoc
abstract class _$$AddPositionEventCurrencyChangedCopyWith<$Res> {
  factory _$$AddPositionEventCurrencyChangedCopyWith(
          _$AddPositionEventCurrencyChanged value,
          $Res Function(_$AddPositionEventCurrencyChanged) then) =
      __$$AddPositionEventCurrencyChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String? currency});
}

/// @nodoc
class __$$AddPositionEventCurrencyChangedCopyWithImpl<$Res>
    extends _$AddPositionEventCopyWithImpl<$Res,
        _$AddPositionEventCurrencyChanged>
    implements _$$AddPositionEventCurrencyChangedCopyWith<$Res> {
  __$$AddPositionEventCurrencyChangedCopyWithImpl(
      _$AddPositionEventCurrencyChanged _value,
      $Res Function(_$AddPositionEventCurrencyChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = freezed,
  }) {
    return _then(_$AddPositionEventCurrencyChanged(
      freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddPositionEventCurrencyChanged
    implements AddPositionEventCurrencyChanged {
  _$AddPositionEventCurrencyChanged(this.currency);

  @override
  final String? currency;

  @override
  String toString() {
    return 'AddPositionEvent.currencyChanged(currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPositionEventCurrencyChanged &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPositionEventCurrencyChangedCopyWith<_$AddPositionEventCurrencyChanged>
      get copyWith => __$$AddPositionEventCurrencyChangedCopyWithImpl<
          _$AddPositionEventCurrencyChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
    required TResult Function() submit,
    required TResult Function(String? currency) currencyChanged,
    required TResult Function(String? price) priceChanged,
    required TResult Function(String? count) countChanged,
    required TResult Function(DateTime date) dateChanged,
  }) {
    return currencyChanged(currency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String instrumentId)? init,
    TResult? Function()? submit,
    TResult? Function(String? currency)? currencyChanged,
    TResult? Function(String? price)? priceChanged,
    TResult? Function(String? count)? countChanged,
    TResult? Function(DateTime date)? dateChanged,
  }) {
    return currencyChanged?.call(currency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(String? currency)? currencyChanged,
    TResult Function(String? price)? priceChanged,
    TResult Function(String? count)? countChanged,
    TResult Function(DateTime date)? dateChanged,
    required TResult orElse(),
  }) {
    if (currencyChanged != null) {
      return currencyChanged(currency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddPositionEventInit value) init,
    required TResult Function(AddPositionEventSubmit value) submit,
    required TResult Function(AddPositionEventCurrencyChanged value)
        currencyChanged,
    required TResult Function(AddPositionEventPriceChanged value) priceChanged,
    required TResult Function(AddPositionEventCountChanged value) countChanged,
    required TResult Function(AddPositionEventDateChanged value) dateChanged,
  }) {
    return currencyChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddPositionEventInit value)? init,
    TResult? Function(AddPositionEventSubmit value)? submit,
    TResult? Function(AddPositionEventCurrencyChanged value)? currencyChanged,
    TResult? Function(AddPositionEventPriceChanged value)? priceChanged,
    TResult? Function(AddPositionEventCountChanged value)? countChanged,
    TResult? Function(AddPositionEventDateChanged value)? dateChanged,
  }) {
    return currencyChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddPositionEventInit value)? init,
    TResult Function(AddPositionEventSubmit value)? submit,
    TResult Function(AddPositionEventCurrencyChanged value)? currencyChanged,
    TResult Function(AddPositionEventPriceChanged value)? priceChanged,
    TResult Function(AddPositionEventCountChanged value)? countChanged,
    TResult Function(AddPositionEventDateChanged value)? dateChanged,
    required TResult orElse(),
  }) {
    if (currencyChanged != null) {
      return currencyChanged(this);
    }
    return orElse();
  }
}

abstract class AddPositionEventCurrencyChanged implements AddPositionEvent {
  factory AddPositionEventCurrencyChanged(final String? currency) =
      _$AddPositionEventCurrencyChanged;

  String? get currency;
  @JsonKey(ignore: true)
  _$$AddPositionEventCurrencyChangedCopyWith<_$AddPositionEventCurrencyChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPositionEventPriceChangedCopyWith<$Res> {
  factory _$$AddPositionEventPriceChangedCopyWith(
          _$AddPositionEventPriceChanged value,
          $Res Function(_$AddPositionEventPriceChanged) then) =
      __$$AddPositionEventPriceChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String? price});
}

/// @nodoc
class __$$AddPositionEventPriceChangedCopyWithImpl<$Res>
    extends _$AddPositionEventCopyWithImpl<$Res, _$AddPositionEventPriceChanged>
    implements _$$AddPositionEventPriceChangedCopyWith<$Res> {
  __$$AddPositionEventPriceChangedCopyWithImpl(
      _$AddPositionEventPriceChanged _value,
      $Res Function(_$AddPositionEventPriceChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = freezed,
  }) {
    return _then(_$AddPositionEventPriceChanged(
      freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddPositionEventPriceChanged implements AddPositionEventPriceChanged {
  _$AddPositionEventPriceChanged(this.price);

  @override
  final String? price;

  @override
  String toString() {
    return 'AddPositionEvent.priceChanged(price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPositionEventPriceChanged &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPositionEventPriceChangedCopyWith<_$AddPositionEventPriceChanged>
      get copyWith => __$$AddPositionEventPriceChangedCopyWithImpl<
          _$AddPositionEventPriceChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
    required TResult Function() submit,
    required TResult Function(String? currency) currencyChanged,
    required TResult Function(String? price) priceChanged,
    required TResult Function(String? count) countChanged,
    required TResult Function(DateTime date) dateChanged,
  }) {
    return priceChanged(price);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String instrumentId)? init,
    TResult? Function()? submit,
    TResult? Function(String? currency)? currencyChanged,
    TResult? Function(String? price)? priceChanged,
    TResult? Function(String? count)? countChanged,
    TResult? Function(DateTime date)? dateChanged,
  }) {
    return priceChanged?.call(price);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(String? currency)? currencyChanged,
    TResult Function(String? price)? priceChanged,
    TResult Function(String? count)? countChanged,
    TResult Function(DateTime date)? dateChanged,
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
    required TResult Function(AddPositionEventInit value) init,
    required TResult Function(AddPositionEventSubmit value) submit,
    required TResult Function(AddPositionEventCurrencyChanged value)
        currencyChanged,
    required TResult Function(AddPositionEventPriceChanged value) priceChanged,
    required TResult Function(AddPositionEventCountChanged value) countChanged,
    required TResult Function(AddPositionEventDateChanged value) dateChanged,
  }) {
    return priceChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddPositionEventInit value)? init,
    TResult? Function(AddPositionEventSubmit value)? submit,
    TResult? Function(AddPositionEventCurrencyChanged value)? currencyChanged,
    TResult? Function(AddPositionEventPriceChanged value)? priceChanged,
    TResult? Function(AddPositionEventCountChanged value)? countChanged,
    TResult? Function(AddPositionEventDateChanged value)? dateChanged,
  }) {
    return priceChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddPositionEventInit value)? init,
    TResult Function(AddPositionEventSubmit value)? submit,
    TResult Function(AddPositionEventCurrencyChanged value)? currencyChanged,
    TResult Function(AddPositionEventPriceChanged value)? priceChanged,
    TResult Function(AddPositionEventCountChanged value)? countChanged,
    TResult Function(AddPositionEventDateChanged value)? dateChanged,
    required TResult orElse(),
  }) {
    if (priceChanged != null) {
      return priceChanged(this);
    }
    return orElse();
  }
}

abstract class AddPositionEventPriceChanged implements AddPositionEvent {
  factory AddPositionEventPriceChanged(final String? price) =
      _$AddPositionEventPriceChanged;

  String? get price;
  @JsonKey(ignore: true)
  _$$AddPositionEventPriceChangedCopyWith<_$AddPositionEventPriceChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPositionEventCountChangedCopyWith<$Res> {
  factory _$$AddPositionEventCountChangedCopyWith(
          _$AddPositionEventCountChanged value,
          $Res Function(_$AddPositionEventCountChanged) then) =
      __$$AddPositionEventCountChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String? count});
}

/// @nodoc
class __$$AddPositionEventCountChangedCopyWithImpl<$Res>
    extends _$AddPositionEventCopyWithImpl<$Res, _$AddPositionEventCountChanged>
    implements _$$AddPositionEventCountChangedCopyWith<$Res> {
  __$$AddPositionEventCountChangedCopyWithImpl(
      _$AddPositionEventCountChanged _value,
      $Res Function(_$AddPositionEventCountChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
  }) {
    return _then(_$AddPositionEventCountChanged(
      freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddPositionEventCountChanged implements AddPositionEventCountChanged {
  _$AddPositionEventCountChanged(this.count);

  @override
  final String? count;

  @override
  String toString() {
    return 'AddPositionEvent.countChanged(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPositionEventCountChanged &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPositionEventCountChangedCopyWith<_$AddPositionEventCountChanged>
      get copyWith => __$$AddPositionEventCountChangedCopyWithImpl<
          _$AddPositionEventCountChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
    required TResult Function() submit,
    required TResult Function(String? currency) currencyChanged,
    required TResult Function(String? price) priceChanged,
    required TResult Function(String? count) countChanged,
    required TResult Function(DateTime date) dateChanged,
  }) {
    return countChanged(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String instrumentId)? init,
    TResult? Function()? submit,
    TResult? Function(String? currency)? currencyChanged,
    TResult? Function(String? price)? priceChanged,
    TResult? Function(String? count)? countChanged,
    TResult? Function(DateTime date)? dateChanged,
  }) {
    return countChanged?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(String? currency)? currencyChanged,
    TResult Function(String? price)? priceChanged,
    TResult Function(String? count)? countChanged,
    TResult Function(DateTime date)? dateChanged,
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
    required TResult Function(AddPositionEventInit value) init,
    required TResult Function(AddPositionEventSubmit value) submit,
    required TResult Function(AddPositionEventCurrencyChanged value)
        currencyChanged,
    required TResult Function(AddPositionEventPriceChanged value) priceChanged,
    required TResult Function(AddPositionEventCountChanged value) countChanged,
    required TResult Function(AddPositionEventDateChanged value) dateChanged,
  }) {
    return countChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddPositionEventInit value)? init,
    TResult? Function(AddPositionEventSubmit value)? submit,
    TResult? Function(AddPositionEventCurrencyChanged value)? currencyChanged,
    TResult? Function(AddPositionEventPriceChanged value)? priceChanged,
    TResult? Function(AddPositionEventCountChanged value)? countChanged,
    TResult? Function(AddPositionEventDateChanged value)? dateChanged,
  }) {
    return countChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddPositionEventInit value)? init,
    TResult Function(AddPositionEventSubmit value)? submit,
    TResult Function(AddPositionEventCurrencyChanged value)? currencyChanged,
    TResult Function(AddPositionEventPriceChanged value)? priceChanged,
    TResult Function(AddPositionEventCountChanged value)? countChanged,
    TResult Function(AddPositionEventDateChanged value)? dateChanged,
    required TResult orElse(),
  }) {
    if (countChanged != null) {
      return countChanged(this);
    }
    return orElse();
  }
}

abstract class AddPositionEventCountChanged implements AddPositionEvent {
  factory AddPositionEventCountChanged(final String? count) =
      _$AddPositionEventCountChanged;

  String? get count;
  @JsonKey(ignore: true)
  _$$AddPositionEventCountChangedCopyWith<_$AddPositionEventCountChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPositionEventDateChangedCopyWith<$Res> {
  factory _$$AddPositionEventDateChangedCopyWith(
          _$AddPositionEventDateChanged value,
          $Res Function(_$AddPositionEventDateChanged) then) =
      __$$AddPositionEventDateChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$AddPositionEventDateChangedCopyWithImpl<$Res>
    extends _$AddPositionEventCopyWithImpl<$Res, _$AddPositionEventDateChanged>
    implements _$$AddPositionEventDateChangedCopyWith<$Res> {
  __$$AddPositionEventDateChangedCopyWithImpl(
      _$AddPositionEventDateChanged _value,
      $Res Function(_$AddPositionEventDateChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$AddPositionEventDateChanged(
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$AddPositionEventDateChanged implements AddPositionEventDateChanged {
  _$AddPositionEventDateChanged(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'AddPositionEvent.dateChanged(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPositionEventDateChanged &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPositionEventDateChangedCopyWith<_$AddPositionEventDateChanged>
      get copyWith => __$$AddPositionEventDateChangedCopyWithImpl<
          _$AddPositionEventDateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String instrumentId) init,
    required TResult Function() submit,
    required TResult Function(String? currency) currencyChanged,
    required TResult Function(String? price) priceChanged,
    required TResult Function(String? count) countChanged,
    required TResult Function(DateTime date) dateChanged,
  }) {
    return dateChanged(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String instrumentId)? init,
    TResult? Function()? submit,
    TResult? Function(String? currency)? currencyChanged,
    TResult? Function(String? price)? priceChanged,
    TResult? Function(String? count)? countChanged,
    TResult? Function(DateTime date)? dateChanged,
  }) {
    return dateChanged?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String instrumentId)? init,
    TResult Function()? submit,
    TResult Function(String? currency)? currencyChanged,
    TResult Function(String? price)? priceChanged,
    TResult Function(String? count)? countChanged,
    TResult Function(DateTime date)? dateChanged,
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
    required TResult Function(AddPositionEventInit value) init,
    required TResult Function(AddPositionEventSubmit value) submit,
    required TResult Function(AddPositionEventCurrencyChanged value)
        currencyChanged,
    required TResult Function(AddPositionEventPriceChanged value) priceChanged,
    required TResult Function(AddPositionEventCountChanged value) countChanged,
    required TResult Function(AddPositionEventDateChanged value) dateChanged,
  }) {
    return dateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddPositionEventInit value)? init,
    TResult? Function(AddPositionEventSubmit value)? submit,
    TResult? Function(AddPositionEventCurrencyChanged value)? currencyChanged,
    TResult? Function(AddPositionEventPriceChanged value)? priceChanged,
    TResult? Function(AddPositionEventCountChanged value)? countChanged,
    TResult? Function(AddPositionEventDateChanged value)? dateChanged,
  }) {
    return dateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddPositionEventInit value)? init,
    TResult Function(AddPositionEventSubmit value)? submit,
    TResult Function(AddPositionEventCurrencyChanged value)? currencyChanged,
    TResult Function(AddPositionEventPriceChanged value)? priceChanged,
    TResult Function(AddPositionEventCountChanged value)? countChanged,
    TResult Function(AddPositionEventDateChanged value)? dateChanged,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(this);
    }
    return orElse();
  }
}

abstract class AddPositionEventDateChanged implements AddPositionEvent {
  factory AddPositionEventDateChanged(final DateTime date) =
      _$AddPositionEventDateChanged;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$AddPositionEventDateChangedCopyWith<_$AddPositionEventDateChanged>
      get copyWith => throw _privateConstructorUsedError;
}
