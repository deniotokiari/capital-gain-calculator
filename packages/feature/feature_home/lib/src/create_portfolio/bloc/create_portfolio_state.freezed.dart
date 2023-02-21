// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_portfolio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreatePortfolioState {
  bool get submitEnabled => throw _privateConstructorUsedError;
  List<String>? get listOfCurrency => throw _privateConstructorUsedError;
  String? get portfolioName => throw _privateConstructorUsedError;
  String? get selectedCurrency => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreatePortfolioStateCopyWith<CreatePortfolioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePortfolioStateCopyWith<$Res> {
  factory $CreatePortfolioStateCopyWith(CreatePortfolioState value,
          $Res Function(CreatePortfolioState) then) =
      _$CreatePortfolioStateCopyWithImpl<$Res, CreatePortfolioState>;
  @useResult
  $Res call(
      {bool submitEnabled,
      List<String>? listOfCurrency,
      String? portfolioName,
      String? selectedCurrency});
}

/// @nodoc
class _$CreatePortfolioStateCopyWithImpl<$Res,
        $Val extends CreatePortfolioState>
    implements $CreatePortfolioStateCopyWith<$Res> {
  _$CreatePortfolioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submitEnabled = null,
    Object? listOfCurrency = freezed,
    Object? portfolioName = freezed,
    Object? selectedCurrency = freezed,
  }) {
    return _then(_value.copyWith(
      submitEnabled: null == submitEnabled
          ? _value.submitEnabled
          : submitEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      listOfCurrency: freezed == listOfCurrency
          ? _value.listOfCurrency
          : listOfCurrency // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      portfolioName: freezed == portfolioName
          ? _value.portfolioName
          : portfolioName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCurrency: freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreatePortfolioStateCopyWith<$Res>
    implements $CreatePortfolioStateCopyWith<$Res> {
  factory _$$_CreatePortfolioStateCopyWith(_$_CreatePortfolioState value,
          $Res Function(_$_CreatePortfolioState) then) =
      __$$_CreatePortfolioStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool submitEnabled,
      List<String>? listOfCurrency,
      String? portfolioName,
      String? selectedCurrency});
}

/// @nodoc
class __$$_CreatePortfolioStateCopyWithImpl<$Res>
    extends _$CreatePortfolioStateCopyWithImpl<$Res, _$_CreatePortfolioState>
    implements _$$_CreatePortfolioStateCopyWith<$Res> {
  __$$_CreatePortfolioStateCopyWithImpl(_$_CreatePortfolioState _value,
      $Res Function(_$_CreatePortfolioState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submitEnabled = null,
    Object? listOfCurrency = freezed,
    Object? portfolioName = freezed,
    Object? selectedCurrency = freezed,
  }) {
    return _then(_$_CreatePortfolioState(
      submitEnabled: null == submitEnabled
          ? _value.submitEnabled
          : submitEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      listOfCurrency: freezed == listOfCurrency
          ? _value._listOfCurrency
          : listOfCurrency // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      portfolioName: freezed == portfolioName
          ? _value.portfolioName
          : portfolioName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCurrency: freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CreatePortfolioState implements _CreatePortfolioState {
  _$_CreatePortfolioState(
      {required this.submitEnabled,
      required final List<String>? listOfCurrency,
      required this.portfolioName,
      required this.selectedCurrency})
      : _listOfCurrency = listOfCurrency;

  @override
  final bool submitEnabled;
  final List<String>? _listOfCurrency;
  @override
  List<String>? get listOfCurrency {
    final value = _listOfCurrency;
    if (value == null) return null;
    if (_listOfCurrency is EqualUnmodifiableListView) return _listOfCurrency;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? portfolioName;
  @override
  final String? selectedCurrency;

  @override
  String toString() {
    return 'CreatePortfolioState(submitEnabled: $submitEnabled, listOfCurrency: $listOfCurrency, portfolioName: $portfolioName, selectedCurrency: $selectedCurrency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatePortfolioState &&
            (identical(other.submitEnabled, submitEnabled) ||
                other.submitEnabled == submitEnabled) &&
            const DeepCollectionEquality()
                .equals(other._listOfCurrency, _listOfCurrency) &&
            (identical(other.portfolioName, portfolioName) ||
                other.portfolioName == portfolioName) &&
            (identical(other.selectedCurrency, selectedCurrency) ||
                other.selectedCurrency == selectedCurrency));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      submitEnabled,
      const DeepCollectionEquality().hash(_listOfCurrency),
      portfolioName,
      selectedCurrency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreatePortfolioStateCopyWith<_$_CreatePortfolioState> get copyWith =>
      __$$_CreatePortfolioStateCopyWithImpl<_$_CreatePortfolioState>(
          this, _$identity);
}

abstract class _CreatePortfolioState implements CreatePortfolioState {
  factory _CreatePortfolioState(
      {required final bool submitEnabled,
      required final List<String>? listOfCurrency,
      required final String? portfolioName,
      required final String? selectedCurrency}) = _$_CreatePortfolioState;

  @override
  bool get submitEnabled;
  @override
  List<String>? get listOfCurrency;
  @override
  String? get portfolioName;
  @override
  String? get selectedCurrency;
  @override
  @JsonKey(ignore: true)
  _$$_CreatePortfolioStateCopyWith<_$_CreatePortfolioState> get copyWith =>
      throw _privateConstructorUsedError;
}
