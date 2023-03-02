// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_header_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioHeaderState {
  String? get title => throw _privateConstructorUsedError;
  MarketValue? get marketValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortfolioHeaderStateCopyWith<PortfolioHeaderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioHeaderStateCopyWith<$Res> {
  factory $PortfolioHeaderStateCopyWith(PortfolioHeaderState value,
          $Res Function(PortfolioHeaderState) then) =
      _$PortfolioHeaderStateCopyWithImpl<$Res, PortfolioHeaderState>;
  @useResult
  $Res call({String? title, MarketValue? marketValue});

  $MarketValueCopyWith<$Res>? get marketValue;
}

/// @nodoc
class _$PortfolioHeaderStateCopyWithImpl<$Res,
        $Val extends PortfolioHeaderState>
    implements $PortfolioHeaderStateCopyWith<$Res> {
  _$PortfolioHeaderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? marketValue = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      marketValue: freezed == marketValue
          ? _value.marketValue
          : marketValue // ignore: cast_nullable_to_non_nullable
              as MarketValue?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MarketValueCopyWith<$Res>? get marketValue {
    if (_value.marketValue == null) {
      return null;
    }

    return $MarketValueCopyWith<$Res>(_value.marketValue!, (value) {
      return _then(_value.copyWith(marketValue: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PortfolioHeaderStateCopyWith<$Res>
    implements $PortfolioHeaderStateCopyWith<$Res> {
  factory _$$_PortfolioHeaderStateCopyWith(_$_PortfolioHeaderState value,
          $Res Function(_$_PortfolioHeaderState) then) =
      __$$_PortfolioHeaderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, MarketValue? marketValue});

  @override
  $MarketValueCopyWith<$Res>? get marketValue;
}

/// @nodoc
class __$$_PortfolioHeaderStateCopyWithImpl<$Res>
    extends _$PortfolioHeaderStateCopyWithImpl<$Res, _$_PortfolioHeaderState>
    implements _$$_PortfolioHeaderStateCopyWith<$Res> {
  __$$_PortfolioHeaderStateCopyWithImpl(_$_PortfolioHeaderState _value,
      $Res Function(_$_PortfolioHeaderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? marketValue = freezed,
  }) {
    return _then(_$_PortfolioHeaderState(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      marketValue: freezed == marketValue
          ? _value.marketValue
          : marketValue // ignore: cast_nullable_to_non_nullable
              as MarketValue?,
    ));
  }
}

/// @nodoc

class _$_PortfolioHeaderState implements _PortfolioHeaderState {
  _$_PortfolioHeaderState({required this.title, required this.marketValue});

  @override
  final String? title;
  @override
  final MarketValue? marketValue;

  @override
  String toString() {
    return 'PortfolioHeaderState(title: $title, marketValue: $marketValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PortfolioHeaderState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.marketValue, marketValue) ||
                other.marketValue == marketValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, marketValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PortfolioHeaderStateCopyWith<_$_PortfolioHeaderState> get copyWith =>
      __$$_PortfolioHeaderStateCopyWithImpl<_$_PortfolioHeaderState>(
          this, _$identity);
}

abstract class _PortfolioHeaderState implements PortfolioHeaderState {
  factory _PortfolioHeaderState(
      {required final String? title,
      required final MarketValue? marketValue}) = _$_PortfolioHeaderState;

  @override
  String? get title;
  @override
  MarketValue? get marketValue;
  @override
  @JsonKey(ignore: true)
  _$$_PortfolioHeaderStateCopyWith<_$_PortfolioHeaderState> get copyWith =>
      throw _privateConstructorUsedError;
}
