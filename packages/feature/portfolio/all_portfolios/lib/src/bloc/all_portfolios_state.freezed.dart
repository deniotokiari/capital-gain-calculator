// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'all_portfolios_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllPortfoliosState {
  AllPortfoliosViewModel get model => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AllPortfoliosViewModel model) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AllPortfoliosViewModel model)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AllPortfoliosViewModel model)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AllPortfoliosStateIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AllPortfoliosStateIdle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AllPortfoliosStateIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllPortfoliosStateCopyWith<AllPortfoliosState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllPortfoliosStateCopyWith<$Res> {
  factory $AllPortfoliosStateCopyWith(
          AllPortfoliosState value, $Res Function(AllPortfoliosState) then) =
      _$AllPortfoliosStateCopyWithImpl<$Res>;
  $Res call({AllPortfoliosViewModel model});
}

/// @nodoc
class _$AllPortfoliosStateCopyWithImpl<$Res>
    implements $AllPortfoliosStateCopyWith<$Res> {
  _$AllPortfoliosStateCopyWithImpl(this._value, this._then);

  final AllPortfoliosState _value;
  // ignore: unused_field
  final $Res Function(AllPortfoliosState) _then;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_value.copyWith(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as AllPortfoliosViewModel,
    ));
  }
}

/// @nodoc
abstract class _$$_AllPortfoliosStateIdleCopyWith<$Res>
    implements $AllPortfoliosStateCopyWith<$Res> {
  factory _$$_AllPortfoliosStateIdleCopyWith(_$_AllPortfoliosStateIdle value,
          $Res Function(_$_AllPortfoliosStateIdle) then) =
      __$$_AllPortfoliosStateIdleCopyWithImpl<$Res>;
  @override
  $Res call({AllPortfoliosViewModel model});
}

/// @nodoc
class __$$_AllPortfoliosStateIdleCopyWithImpl<$Res>
    extends _$AllPortfoliosStateCopyWithImpl<$Res>
    implements _$$_AllPortfoliosStateIdleCopyWith<$Res> {
  __$$_AllPortfoliosStateIdleCopyWithImpl(_$_AllPortfoliosStateIdle _value,
      $Res Function(_$_AllPortfoliosStateIdle) _then)
      : super(_value, (v) => _then(v as _$_AllPortfoliosStateIdle));

  @override
  _$_AllPortfoliosStateIdle get _value =>
      super._value as _$_AllPortfoliosStateIdle;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$_AllPortfoliosStateIdle(
      model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as AllPortfoliosViewModel,
    ));
  }
}

/// @nodoc

class _$_AllPortfoliosStateIdle implements _AllPortfoliosStateIdle {
  _$_AllPortfoliosStateIdle(this.model);

  @override
  final AllPortfoliosViewModel model;

  @override
  String toString() {
    return 'AllPortfoliosState.idle(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllPortfoliosStateIdle &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  _$$_AllPortfoliosStateIdleCopyWith<_$_AllPortfoliosStateIdle> get copyWith =>
      __$$_AllPortfoliosStateIdleCopyWithImpl<_$_AllPortfoliosStateIdle>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AllPortfoliosViewModel model) idle,
  }) {
    return idle(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AllPortfoliosViewModel model)? idle,
  }) {
    return idle?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AllPortfoliosViewModel model)? idle,
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
    required TResult Function(_AllPortfoliosStateIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AllPortfoliosStateIdle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AllPortfoliosStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _AllPortfoliosStateIdle implements AllPortfoliosState {
  factory _AllPortfoliosStateIdle(final AllPortfoliosViewModel model) =
      _$_AllPortfoliosStateIdle;

  @override
  AllPortfoliosViewModel get model;
  @override
  @JsonKey(ignore: true)
  _$$_AllPortfoliosStateIdleCopyWith<_$_AllPortfoliosStateIdle> get copyWith =>
      throw _privateConstructorUsedError;
}
