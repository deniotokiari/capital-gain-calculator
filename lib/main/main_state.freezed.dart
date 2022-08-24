// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainState {
  List<Portfolio> get portfolios => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Portfolio> portfolios) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Portfolio> portfolios)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Portfolio> portfolios)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainStateIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MainStateIdle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainStateIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res>;
  $Res call({List<Portfolio> portfolios});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res> implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  final MainState _value;
  // ignore: unused_field
  final $Res Function(MainState) _then;

  @override
  $Res call({
    Object? portfolios = freezed,
  }) {
    return _then(_value.copyWith(
      portfolios: portfolios == freezed
          ? _value.portfolios
          : portfolios // ignore: cast_nullable_to_non_nullable
              as List<Portfolio>,
    ));
  }
}

/// @nodoc
abstract class _$$_MainStateIdleCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$_MainStateIdleCopyWith(
          _$_MainStateIdle value, $Res Function(_$_MainStateIdle) then) =
      __$$_MainStateIdleCopyWithImpl<$Res>;
  @override
  $Res call({List<Portfolio> portfolios});
}

/// @nodoc
class __$$_MainStateIdleCopyWithImpl<$Res> extends _$MainStateCopyWithImpl<$Res>
    implements _$$_MainStateIdleCopyWith<$Res> {
  __$$_MainStateIdleCopyWithImpl(
      _$_MainStateIdle _value, $Res Function(_$_MainStateIdle) _then)
      : super(_value, (v) => _then(v as _$_MainStateIdle));

  @override
  _$_MainStateIdle get _value => super._value as _$_MainStateIdle;

  @override
  $Res call({
    Object? portfolios = freezed,
  }) {
    return _then(_$_MainStateIdle(
      portfolios == freezed
          ? _value._portfolios
          : portfolios // ignore: cast_nullable_to_non_nullable
              as List<Portfolio>,
    ));
  }
}

/// @nodoc

class _$_MainStateIdle implements _MainStateIdle {
  _$_MainStateIdle(final List<Portfolio> portfolios) : _portfolios = portfolios;

  final List<Portfolio> _portfolios;
  @override
  List<Portfolio> get portfolios {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_portfolios);
  }

  @override
  String toString() {
    return 'MainState.idle(portfolios: $portfolios)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainStateIdle &&
            const DeepCollectionEquality()
                .equals(other._portfolios, _portfolios));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_portfolios));

  @JsonKey(ignore: true)
  @override
  _$$_MainStateIdleCopyWith<_$_MainStateIdle> get copyWith =>
      __$$_MainStateIdleCopyWithImpl<_$_MainStateIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Portfolio> portfolios) idle,
  }) {
    return idle(portfolios);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Portfolio> portfolios)? idle,
  }) {
    return idle?.call(portfolios);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Portfolio> portfolios)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(portfolios);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainStateIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MainStateIdle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _MainStateIdle implements MainState {
  factory _MainStateIdle(final List<Portfolio> portfolios) = _$_MainStateIdle;

  @override
  List<Portfolio> get portfolios;
  @override
  @JsonKey(ignore: true)
  _$$_MainStateIdleCopyWith<_$_MainStateIdle> get copyWith =>
      throw _privateConstructorUsedError;
}
