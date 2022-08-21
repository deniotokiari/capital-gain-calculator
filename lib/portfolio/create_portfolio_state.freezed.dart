// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  List<Currency> get listOfCurrency => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool submitEnabled, List<Currency> listOfCurrency)
        idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool submitEnabled, List<Currency> listOfCurrency)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool submitEnabled, List<Currency> listOfCurrency)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreatePortfolioStateIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreatePortfolioStateIdle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreatePortfolioStateIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreatePortfolioStateCopyWith<CreatePortfolioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePortfolioStateCopyWith<$Res> {
  factory $CreatePortfolioStateCopyWith(CreatePortfolioState value,
          $Res Function(CreatePortfolioState) then) =
      _$CreatePortfolioStateCopyWithImpl<$Res>;
  $Res call({bool submitEnabled, List<Currency> listOfCurrency});
}

/// @nodoc
class _$CreatePortfolioStateCopyWithImpl<$Res>
    implements $CreatePortfolioStateCopyWith<$Res> {
  _$CreatePortfolioStateCopyWithImpl(this._value, this._then);

  final CreatePortfolioState _value;
  // ignore: unused_field
  final $Res Function(CreatePortfolioState) _then;

  @override
  $Res call({
    Object? submitEnabled = freezed,
    Object? listOfCurrency = freezed,
  }) {
    return _then(_value.copyWith(
      submitEnabled: submitEnabled == freezed
          ? _value.submitEnabled
          : submitEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      listOfCurrency: listOfCurrency == freezed
          ? _value.listOfCurrency
          : listOfCurrency // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
    ));
  }
}

/// @nodoc
abstract class _$$_CreatePortfolioStateIdleCopyWith<$Res>
    implements $CreatePortfolioStateCopyWith<$Res> {
  factory _$$_CreatePortfolioStateIdleCopyWith(
          _$_CreatePortfolioStateIdle value,
          $Res Function(_$_CreatePortfolioStateIdle) then) =
      __$$_CreatePortfolioStateIdleCopyWithImpl<$Res>;
  @override
  $Res call({bool submitEnabled, List<Currency> listOfCurrency});
}

/// @nodoc
class __$$_CreatePortfolioStateIdleCopyWithImpl<$Res>
    extends _$CreatePortfolioStateCopyWithImpl<$Res>
    implements _$$_CreatePortfolioStateIdleCopyWith<$Res> {
  __$$_CreatePortfolioStateIdleCopyWithImpl(_$_CreatePortfolioStateIdle _value,
      $Res Function(_$_CreatePortfolioStateIdle) _then)
      : super(_value, (v) => _then(v as _$_CreatePortfolioStateIdle));

  @override
  _$_CreatePortfolioStateIdle get _value =>
      super._value as _$_CreatePortfolioStateIdle;

  @override
  $Res call({
    Object? submitEnabled = freezed,
    Object? listOfCurrency = freezed,
  }) {
    return _then(_$_CreatePortfolioStateIdle(
      submitEnabled: submitEnabled == freezed
          ? _value.submitEnabled
          : submitEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      listOfCurrency: listOfCurrency == freezed
          ? _value._listOfCurrency
          : listOfCurrency // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
    ));
  }
}

/// @nodoc

class _$_CreatePortfolioStateIdle implements _CreatePortfolioStateIdle {
  _$_CreatePortfolioStateIdle(
      {required this.submitEnabled,
      required final List<Currency> listOfCurrency})
      : _listOfCurrency = listOfCurrency;

  @override
  final bool submitEnabled;
  final List<Currency> _listOfCurrency;
  @override
  List<Currency> get listOfCurrency {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfCurrency);
  }

  @override
  String toString() {
    return 'CreatePortfolioState.idle(submitEnabled: $submitEnabled, listOfCurrency: $listOfCurrency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatePortfolioStateIdle &&
            const DeepCollectionEquality()
                .equals(other.submitEnabled, submitEnabled) &&
            const DeepCollectionEquality()
                .equals(other._listOfCurrency, _listOfCurrency));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(submitEnabled),
      const DeepCollectionEquality().hash(_listOfCurrency));

  @JsonKey(ignore: true)
  @override
  _$$_CreatePortfolioStateIdleCopyWith<_$_CreatePortfolioStateIdle>
      get copyWith => __$$_CreatePortfolioStateIdleCopyWithImpl<
          _$_CreatePortfolioStateIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool submitEnabled, List<Currency> listOfCurrency)
        idle,
  }) {
    return idle(submitEnabled, listOfCurrency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool submitEnabled, List<Currency> listOfCurrency)? idle,
  }) {
    return idle?.call(submitEnabled, listOfCurrency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool submitEnabled, List<Currency> listOfCurrency)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(submitEnabled, listOfCurrency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreatePortfolioStateIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreatePortfolioStateIdle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreatePortfolioStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _CreatePortfolioStateIdle implements CreatePortfolioState {
  factory _CreatePortfolioStateIdle(
          {required final bool submitEnabled,
          required final List<Currency> listOfCurrency}) =
      _$_CreatePortfolioStateIdle;

  @override
  bool get submitEnabled;
  @override
  List<Currency> get listOfCurrency;
  @override
  @JsonKey(ignore: true)
  _$$_CreatePortfolioStateIdleCopyWith<_$_CreatePortfolioStateIdle>
      get copyWith => throw _privateConstructorUsedError;
}
