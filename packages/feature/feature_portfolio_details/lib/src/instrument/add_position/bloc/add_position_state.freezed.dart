// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_position_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPositionState {
  String? get price => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get count => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<String> get currencyList => throw _privateConstructorUsedError;
  bool get submitEnabled => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? price, String? currency, String? count,
            DateTime date, List<String> currencyList, bool submitEnabled)
        idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? price, String? currency, String? count,
            DateTime date, List<String> currencyList, bool submitEnabled)?
        idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? price, String? currency, String? count,
            DateTime date, List<String> currencyList, bool submitEnabled)?
        idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddPositionStateIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddPositionStateIdle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddPositionStateIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPositionStateCopyWith<AddPositionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPositionStateCopyWith<$Res> {
  factory $AddPositionStateCopyWith(
          AddPositionState value, $Res Function(AddPositionState) then) =
      _$AddPositionStateCopyWithImpl<$Res, AddPositionState>;
  @useResult
  $Res call(
      {String? price,
      String? currency,
      String? count,
      DateTime date,
      List<String> currencyList,
      bool submitEnabled});
}

/// @nodoc
class _$AddPositionStateCopyWithImpl<$Res, $Val extends AddPositionState>
    implements $AddPositionStateCopyWith<$Res> {
  _$AddPositionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = freezed,
    Object? currency = freezed,
    Object? count = freezed,
    Object? date = null,
    Object? currencyList = null,
    Object? submitEnabled = null,
  }) {
    return _then(_value.copyWith(
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currencyList: null == currencyList
          ? _value.currencyList
          : currencyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      submitEnabled: null == submitEnabled
          ? _value.submitEnabled
          : submitEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddPositionStateIdleCopyWith<$Res>
    implements $AddPositionStateCopyWith<$Res> {
  factory _$$AddPositionStateIdleCopyWith(_$AddPositionStateIdle value,
          $Res Function(_$AddPositionStateIdle) then) =
      __$$AddPositionStateIdleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? price,
      String? currency,
      String? count,
      DateTime date,
      List<String> currencyList,
      bool submitEnabled});
}

/// @nodoc
class __$$AddPositionStateIdleCopyWithImpl<$Res>
    extends _$AddPositionStateCopyWithImpl<$Res, _$AddPositionStateIdle>
    implements _$$AddPositionStateIdleCopyWith<$Res> {
  __$$AddPositionStateIdleCopyWithImpl(_$AddPositionStateIdle _value,
      $Res Function(_$AddPositionStateIdle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = freezed,
    Object? currency = freezed,
    Object? count = freezed,
    Object? date = null,
    Object? currencyList = null,
    Object? submitEnabled = null,
  }) {
    return _then(_$AddPositionStateIdle(
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currencyList: null == currencyList
          ? _value._currencyList
          : currencyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      submitEnabled: null == submitEnabled
          ? _value.submitEnabled
          : submitEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddPositionStateIdle implements AddPositionStateIdle {
  _$AddPositionStateIdle(
      {required this.price,
      required this.currency,
      required this.count,
      required this.date,
      required final List<String> currencyList,
      required this.submitEnabled})
      : _currencyList = currencyList;

  @override
  final String? price;
  @override
  final String? currency;
  @override
  final String? count;
  @override
  final DateTime date;
  final List<String> _currencyList;
  @override
  List<String> get currencyList {
    if (_currencyList is EqualUnmodifiableListView) return _currencyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencyList);
  }

  @override
  final bool submitEnabled;

  @override
  String toString() {
    return 'AddPositionState.idle(price: $price, currency: $currency, count: $count, date: $date, currencyList: $currencyList, submitEnabled: $submitEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPositionStateIdle &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._currencyList, _currencyList) &&
            (identical(other.submitEnabled, submitEnabled) ||
                other.submitEnabled == submitEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, price, currency, count, date,
      const DeepCollectionEquality().hash(_currencyList), submitEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPositionStateIdleCopyWith<_$AddPositionStateIdle> get copyWith =>
      __$$AddPositionStateIdleCopyWithImpl<_$AddPositionStateIdle>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? price, String? currency, String? count,
            DateTime date, List<String> currencyList, bool submitEnabled)
        idle,
  }) {
    return idle(price, currency, count, date, currencyList, submitEnabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? price, String? currency, String? count,
            DateTime date, List<String> currencyList, bool submitEnabled)?
        idle,
  }) {
    return idle?.call(
        price, currency, count, date, currencyList, submitEnabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? price, String? currency, String? count,
            DateTime date, List<String> currencyList, bool submitEnabled)?
        idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(price, currency, count, date, currencyList, submitEnabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddPositionStateIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddPositionStateIdle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddPositionStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class AddPositionStateIdle implements AddPositionState {
  factory AddPositionStateIdle(
      {required final String? price,
      required final String? currency,
      required final String? count,
      required final DateTime date,
      required final List<String> currencyList,
      required final bool submitEnabled}) = _$AddPositionStateIdle;

  @override
  String? get price;
  @override
  String? get currency;
  @override
  String? get count;
  @override
  DateTime get date;
  @override
  List<String> get currencyList;
  @override
  bool get submitEnabled;
  @override
  @JsonKey(ignore: true)
  _$$AddPositionStateIdleCopyWith<_$AddPositionStateIdle> get copyWith =>
      throw _privateConstructorUsedError;
}
