// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsListState {
  NewsListViewModel get model => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NewsListViewModel model) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NewsListViewModel model)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NewsListViewModel model)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewsListStateIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewsListStateIdle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewsListStateIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsListStateCopyWith<NewsListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsListStateCopyWith<$Res> {
  factory $NewsListStateCopyWith(
          NewsListState value, $Res Function(NewsListState) then) =
      _$NewsListStateCopyWithImpl<$Res, NewsListState>;
  @useResult
  $Res call({NewsListViewModel model});
}

/// @nodoc
class _$NewsListStateCopyWithImpl<$Res, $Val extends NewsListState>
    implements $NewsListStateCopyWith<$Res> {
  _$NewsListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as NewsListViewModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsListStateIdleCopyWith<$Res>
    implements $NewsListStateCopyWith<$Res> {
  factory _$$_NewsListStateIdleCopyWith(_$_NewsListStateIdle value,
          $Res Function(_$_NewsListStateIdle) then) =
      __$$_NewsListStateIdleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NewsListViewModel model});
}

/// @nodoc
class __$$_NewsListStateIdleCopyWithImpl<$Res>
    extends _$NewsListStateCopyWithImpl<$Res, _$_NewsListStateIdle>
    implements _$$_NewsListStateIdleCopyWith<$Res> {
  __$$_NewsListStateIdleCopyWithImpl(
      _$_NewsListStateIdle _value, $Res Function(_$_NewsListStateIdle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$_NewsListStateIdle(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as NewsListViewModel,
    ));
  }
}

/// @nodoc

class _$_NewsListStateIdle implements _NewsListStateIdle {
  _$_NewsListStateIdle(this.model);

  @override
  final NewsListViewModel model;

  @override
  String toString() {
    return 'NewsListState.idle(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsListStateIdle &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsListStateIdleCopyWith<_$_NewsListStateIdle> get copyWith =>
      __$$_NewsListStateIdleCopyWithImpl<_$_NewsListStateIdle>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NewsListViewModel model) idle,
  }) {
    return idle(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NewsListViewModel model)? idle,
  }) {
    return idle?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NewsListViewModel model)? idle,
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
    required TResult Function(_NewsListStateIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewsListStateIdle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewsListStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _NewsListStateIdle implements NewsListState {
  factory _NewsListStateIdle(final NewsListViewModel model) =
      _$_NewsListStateIdle;

  @override
  NewsListViewModel get model;
  @override
  @JsonKey(ignore: true)
  _$$_NewsListStateIdleCopyWith<_$_NewsListStateIdle> get copyWith =>
      throw _privateConstructorUsedError;
}
