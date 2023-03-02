// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolios_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfoliosListState {
  MarketValue? get marketValue => throw _privateConstructorUsedError;
  List<PortfolioViewModel> get portfolios => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortfoliosListStateCopyWith<PortfoliosListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfoliosListStateCopyWith<$Res> {
  factory $PortfoliosListStateCopyWith(
          PortfoliosListState value, $Res Function(PortfoliosListState) then) =
      _$PortfoliosListStateCopyWithImpl<$Res, PortfoliosListState>;
  @useResult
  $Res call({MarketValue? marketValue, List<PortfolioViewModel> portfolios});

  $MarketValueCopyWith<$Res>? get marketValue;
}

/// @nodoc
class _$PortfoliosListStateCopyWithImpl<$Res, $Val extends PortfoliosListState>
    implements $PortfoliosListStateCopyWith<$Res> {
  _$PortfoliosListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketValue = freezed,
    Object? portfolios = null,
  }) {
    return _then(_value.copyWith(
      marketValue: freezed == marketValue
          ? _value.marketValue
          : marketValue // ignore: cast_nullable_to_non_nullable
              as MarketValue?,
      portfolios: null == portfolios
          ? _value.portfolios
          : portfolios // ignore: cast_nullable_to_non_nullable
              as List<PortfolioViewModel>,
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
abstract class _$$_PortfoliosListStateCopyWith<$Res>
    implements $PortfoliosListStateCopyWith<$Res> {
  factory _$$_PortfoliosListStateCopyWith(_$_PortfoliosListState value,
          $Res Function(_$_PortfoliosListState) then) =
      __$$_PortfoliosListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MarketValue? marketValue, List<PortfolioViewModel> portfolios});

  @override
  $MarketValueCopyWith<$Res>? get marketValue;
}

/// @nodoc
class __$$_PortfoliosListStateCopyWithImpl<$Res>
    extends _$PortfoliosListStateCopyWithImpl<$Res, _$_PortfoliosListState>
    implements _$$_PortfoliosListStateCopyWith<$Res> {
  __$$_PortfoliosListStateCopyWithImpl(_$_PortfoliosListState _value,
      $Res Function(_$_PortfoliosListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketValue = freezed,
    Object? portfolios = null,
  }) {
    return _then(_$_PortfoliosListState(
      freezed == marketValue
          ? _value.marketValue
          : marketValue // ignore: cast_nullable_to_non_nullable
              as MarketValue?,
      null == portfolios
          ? _value._portfolios
          : portfolios // ignore: cast_nullable_to_non_nullable
              as List<PortfolioViewModel>,
    ));
  }
}

/// @nodoc

class _$_PortfoliosListState implements _PortfoliosListState {
  _$_PortfoliosListState(
      this.marketValue, final List<PortfolioViewModel> portfolios)
      : _portfolios = portfolios;

  @override
  final MarketValue? marketValue;
  final List<PortfolioViewModel> _portfolios;
  @override
  List<PortfolioViewModel> get portfolios {
    if (_portfolios is EqualUnmodifiableListView) return _portfolios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_portfolios);
  }

  @override
  String toString() {
    return 'PortfoliosListState(marketValue: $marketValue, portfolios: $portfolios)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PortfoliosListState &&
            (identical(other.marketValue, marketValue) ||
                other.marketValue == marketValue) &&
            const DeepCollectionEquality()
                .equals(other._portfolios, _portfolios));
  }

  @override
  int get hashCode => Object.hash(runtimeType, marketValue,
      const DeepCollectionEquality().hash(_portfolios));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PortfoliosListStateCopyWith<_$_PortfoliosListState> get copyWith =>
      __$$_PortfoliosListStateCopyWithImpl<_$_PortfoliosListState>(
          this, _$identity);
}

abstract class _PortfoliosListState implements PortfoliosListState {
  factory _PortfoliosListState(final MarketValue? marketValue,
      final List<PortfolioViewModel> portfolios) = _$_PortfoliosListState;

  @override
  MarketValue? get marketValue;
  @override
  List<PortfolioViewModel> get portfolios;
  @override
  @JsonKey(ignore: true)
  _$$_PortfoliosListStateCopyWith<_$_PortfoliosListState> get copyWith =>
      throw _privateConstructorUsedError;
}
