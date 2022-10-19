// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'portfolio_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioDetailsState {
  PortfolioDetailsViewModel get model => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PortfolioDetailsViewModel model) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsViewModel model)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PortfolioDetailsViewModel model)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PortfolioDetailsStateIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PortfolioDetailsStateIdle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PortfolioDetailsStateIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortfolioDetailsStateCopyWith<PortfolioDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioDetailsStateCopyWith<$Res> {
  factory $PortfolioDetailsStateCopyWith(PortfolioDetailsState value,
          $Res Function(PortfolioDetailsState) then) =
      _$PortfolioDetailsStateCopyWithImpl<$Res>;
  $Res call({PortfolioDetailsViewModel model});

  $PortfolioDetailsViewModelCopyWith<$Res> get model;
}

/// @nodoc
class _$PortfolioDetailsStateCopyWithImpl<$Res>
    implements $PortfolioDetailsStateCopyWith<$Res> {
  _$PortfolioDetailsStateCopyWithImpl(this._value, this._then);

  final PortfolioDetailsState _value;
  // ignore: unused_field
  final $Res Function(PortfolioDetailsState) _then;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_value.copyWith(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as PortfolioDetailsViewModel,
    ));
  }

  @override
  $PortfolioDetailsViewModelCopyWith<$Res> get model {
    return $PortfolioDetailsViewModelCopyWith<$Res>(_value.model, (value) {
      return _then(_value.copyWith(model: value));
    });
  }
}

/// @nodoc
abstract class _$$_PortfolioDetailsStateIdleCopyWith<$Res>
    implements $PortfolioDetailsStateCopyWith<$Res> {
  factory _$$_PortfolioDetailsStateIdleCopyWith(
          _$_PortfolioDetailsStateIdle value,
          $Res Function(_$_PortfolioDetailsStateIdle) then) =
      __$$_PortfolioDetailsStateIdleCopyWithImpl<$Res>;
  @override
  $Res call({PortfolioDetailsViewModel model});

  @override
  $PortfolioDetailsViewModelCopyWith<$Res> get model;
}

/// @nodoc
class __$$_PortfolioDetailsStateIdleCopyWithImpl<$Res>
    extends _$PortfolioDetailsStateCopyWithImpl<$Res>
    implements _$$_PortfolioDetailsStateIdleCopyWith<$Res> {
  __$$_PortfolioDetailsStateIdleCopyWithImpl(
      _$_PortfolioDetailsStateIdle _value,
      $Res Function(_$_PortfolioDetailsStateIdle) _then)
      : super(_value, (v) => _then(v as _$_PortfolioDetailsStateIdle));

  @override
  _$_PortfolioDetailsStateIdle get _value =>
      super._value as _$_PortfolioDetailsStateIdle;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$_PortfolioDetailsStateIdle(
      model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as PortfolioDetailsViewModel,
    ));
  }
}

/// @nodoc

class _$_PortfolioDetailsStateIdle implements _PortfolioDetailsStateIdle {
  _$_PortfolioDetailsStateIdle(this.model);

  @override
  final PortfolioDetailsViewModel model;

  @override
  String toString() {
    return 'PortfolioDetailsState.idle(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PortfolioDetailsStateIdle &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  _$$_PortfolioDetailsStateIdleCopyWith<_$_PortfolioDetailsStateIdle>
      get copyWith => __$$_PortfolioDetailsStateIdleCopyWithImpl<
          _$_PortfolioDetailsStateIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PortfolioDetailsViewModel model) idle,
  }) {
    return idle(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsViewModel model)? idle,
  }) {
    return idle?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PortfolioDetailsViewModel model)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PortfolioDetailsStateIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PortfolioDetailsStateIdle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PortfolioDetailsStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _PortfolioDetailsStateIdle implements PortfolioDetailsState {
  factory _PortfolioDetailsStateIdle(final PortfolioDetailsViewModel model) =
      _$_PortfolioDetailsStateIdle;

  @override
  PortfolioDetailsViewModel get model;
  @override
  @JsonKey(ignore: true)
  _$$_PortfolioDetailsStateIdleCopyWith<_$_PortfolioDetailsStateIdle>
      get copyWith => throw _privateConstructorUsedError;
}
