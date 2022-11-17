// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'portfolio_details_header_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioDetailsHeaderState {
  PortfolioDetailsHeaderViewModel get viewModel =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PortfolioDetailsHeaderViewModel viewModel) idle,
    required TResult Function(PortfolioDetailsHeaderViewModel viewModel)
        refreshing,
    required TResult Function(PortfolioDetailsHeaderViewModel viewModel)
        loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? idle,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? refreshing,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? idle,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? refreshing,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PortfolioDetailsHeaderStateIdle value) idle,
    required TResult Function(_PortfolioDetailsHeaderStateRefreshing value)
        refreshing,
    required TResult Function(PortfolioDetailsHeaderStateLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PortfolioDetailsHeaderStateIdle value)? idle,
    TResult Function(_PortfolioDetailsHeaderStateRefreshing value)? refreshing,
    TResult Function(PortfolioDetailsHeaderStateLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PortfolioDetailsHeaderStateIdle value)? idle,
    TResult Function(_PortfolioDetailsHeaderStateRefreshing value)? refreshing,
    TResult Function(PortfolioDetailsHeaderStateLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortfolioDetailsHeaderStateCopyWith<PortfolioDetailsHeaderState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioDetailsHeaderStateCopyWith<$Res> {
  factory $PortfolioDetailsHeaderStateCopyWith(
          PortfolioDetailsHeaderState value,
          $Res Function(PortfolioDetailsHeaderState) then) =
      _$PortfolioDetailsHeaderStateCopyWithImpl<$Res>;
  $Res call({PortfolioDetailsHeaderViewModel viewModel});

  $PortfolioDetailsHeaderViewModelCopyWith<$Res> get viewModel;
}

/// @nodoc
class _$PortfolioDetailsHeaderStateCopyWithImpl<$Res>
    implements $PortfolioDetailsHeaderStateCopyWith<$Res> {
  _$PortfolioDetailsHeaderStateCopyWithImpl(this._value, this._then);

  final PortfolioDetailsHeaderState _value;
  // ignore: unused_field
  final $Res Function(PortfolioDetailsHeaderState) _then;

  @override
  $Res call({
    Object? viewModel = freezed,
  }) {
    return _then(_value.copyWith(
      viewModel: viewModel == freezed
          ? _value.viewModel
          : viewModel // ignore: cast_nullable_to_non_nullable
              as PortfolioDetailsHeaderViewModel,
    ));
  }

  @override
  $PortfolioDetailsHeaderViewModelCopyWith<$Res> get viewModel {
    return $PortfolioDetailsHeaderViewModelCopyWith<$Res>(_value.viewModel,
        (value) {
      return _then(_value.copyWith(viewModel: value));
    });
  }
}

/// @nodoc
abstract class _$$_PortfolioDetailsHeaderStateIdleCopyWith<$Res>
    implements $PortfolioDetailsHeaderStateCopyWith<$Res> {
  factory _$$_PortfolioDetailsHeaderStateIdleCopyWith(
          _$_PortfolioDetailsHeaderStateIdle value,
          $Res Function(_$_PortfolioDetailsHeaderStateIdle) then) =
      __$$_PortfolioDetailsHeaderStateIdleCopyWithImpl<$Res>;
  @override
  $Res call({PortfolioDetailsHeaderViewModel viewModel});

  @override
  $PortfolioDetailsHeaderViewModelCopyWith<$Res> get viewModel;
}

/// @nodoc
class __$$_PortfolioDetailsHeaderStateIdleCopyWithImpl<$Res>
    extends _$PortfolioDetailsHeaderStateCopyWithImpl<$Res>
    implements _$$_PortfolioDetailsHeaderStateIdleCopyWith<$Res> {
  __$$_PortfolioDetailsHeaderStateIdleCopyWithImpl(
      _$_PortfolioDetailsHeaderStateIdle _value,
      $Res Function(_$_PortfolioDetailsHeaderStateIdle) _then)
      : super(_value, (v) => _then(v as _$_PortfolioDetailsHeaderStateIdle));

  @override
  _$_PortfolioDetailsHeaderStateIdle get _value =>
      super._value as _$_PortfolioDetailsHeaderStateIdle;

  @override
  $Res call({
    Object? viewModel = freezed,
  }) {
    return _then(_$_PortfolioDetailsHeaderStateIdle(
      viewModel == freezed
          ? _value.viewModel
          : viewModel // ignore: cast_nullable_to_non_nullable
              as PortfolioDetailsHeaderViewModel,
    ));
  }
}

/// @nodoc

class _$_PortfolioDetailsHeaderStateIdle
    implements _PortfolioDetailsHeaderStateIdle {
  _$_PortfolioDetailsHeaderStateIdle(this.viewModel);

  @override
  final PortfolioDetailsHeaderViewModel viewModel;

  @override
  String toString() {
    return 'PortfolioDetailsHeaderState.idle(viewModel: $viewModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PortfolioDetailsHeaderStateIdle &&
            const DeepCollectionEquality().equals(other.viewModel, viewModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(viewModel));

  @JsonKey(ignore: true)
  @override
  _$$_PortfolioDetailsHeaderStateIdleCopyWith<
          _$_PortfolioDetailsHeaderStateIdle>
      get copyWith => __$$_PortfolioDetailsHeaderStateIdleCopyWithImpl<
          _$_PortfolioDetailsHeaderStateIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PortfolioDetailsHeaderViewModel viewModel) idle,
    required TResult Function(PortfolioDetailsHeaderViewModel viewModel)
        refreshing,
    required TResult Function(PortfolioDetailsHeaderViewModel viewModel)
        loading,
  }) {
    return idle(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? idle,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? refreshing,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? loading,
  }) {
    return idle?.call(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? idle,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? refreshing,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? loading,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(viewModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PortfolioDetailsHeaderStateIdle value) idle,
    required TResult Function(_PortfolioDetailsHeaderStateRefreshing value)
        refreshing,
    required TResult Function(PortfolioDetailsHeaderStateLoading value) loading,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PortfolioDetailsHeaderStateIdle value)? idle,
    TResult Function(_PortfolioDetailsHeaderStateRefreshing value)? refreshing,
    TResult Function(PortfolioDetailsHeaderStateLoading value)? loading,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PortfolioDetailsHeaderStateIdle value)? idle,
    TResult Function(_PortfolioDetailsHeaderStateRefreshing value)? refreshing,
    TResult Function(PortfolioDetailsHeaderStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _PortfolioDetailsHeaderStateIdle
    implements
        PortfolioDetailsHeaderState,
        PortfolioDetailsHeaderStateViewModel {
  factory _PortfolioDetailsHeaderStateIdle(
          final PortfolioDetailsHeaderViewModel viewModel) =
      _$_PortfolioDetailsHeaderStateIdle;

  @override
  PortfolioDetailsHeaderViewModel get viewModel;
  @override
  @JsonKey(ignore: true)
  _$$_PortfolioDetailsHeaderStateIdleCopyWith<
          _$_PortfolioDetailsHeaderStateIdle>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PortfolioDetailsHeaderStateRefreshingCopyWith<$Res>
    implements $PortfolioDetailsHeaderStateCopyWith<$Res> {
  factory _$$_PortfolioDetailsHeaderStateRefreshingCopyWith(
          _$_PortfolioDetailsHeaderStateRefreshing value,
          $Res Function(_$_PortfolioDetailsHeaderStateRefreshing) then) =
      __$$_PortfolioDetailsHeaderStateRefreshingCopyWithImpl<$Res>;
  @override
  $Res call({PortfolioDetailsHeaderViewModel viewModel});

  @override
  $PortfolioDetailsHeaderViewModelCopyWith<$Res> get viewModel;
}

/// @nodoc
class __$$_PortfolioDetailsHeaderStateRefreshingCopyWithImpl<$Res>
    extends _$PortfolioDetailsHeaderStateCopyWithImpl<$Res>
    implements _$$_PortfolioDetailsHeaderStateRefreshingCopyWith<$Res> {
  __$$_PortfolioDetailsHeaderStateRefreshingCopyWithImpl(
      _$_PortfolioDetailsHeaderStateRefreshing _value,
      $Res Function(_$_PortfolioDetailsHeaderStateRefreshing) _then)
      : super(_value,
            (v) => _then(v as _$_PortfolioDetailsHeaderStateRefreshing));

  @override
  _$_PortfolioDetailsHeaderStateRefreshing get _value =>
      super._value as _$_PortfolioDetailsHeaderStateRefreshing;

  @override
  $Res call({
    Object? viewModel = freezed,
  }) {
    return _then(_$_PortfolioDetailsHeaderStateRefreshing(
      viewModel == freezed
          ? _value.viewModel
          : viewModel // ignore: cast_nullable_to_non_nullable
              as PortfolioDetailsHeaderViewModel,
    ));
  }
}

/// @nodoc

class _$_PortfolioDetailsHeaderStateRefreshing
    implements _PortfolioDetailsHeaderStateRefreshing {
  _$_PortfolioDetailsHeaderStateRefreshing(this.viewModel);

  @override
  final PortfolioDetailsHeaderViewModel viewModel;

  @override
  String toString() {
    return 'PortfolioDetailsHeaderState.refreshing(viewModel: $viewModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PortfolioDetailsHeaderStateRefreshing &&
            const DeepCollectionEquality().equals(other.viewModel, viewModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(viewModel));

  @JsonKey(ignore: true)
  @override
  _$$_PortfolioDetailsHeaderStateRefreshingCopyWith<
          _$_PortfolioDetailsHeaderStateRefreshing>
      get copyWith => __$$_PortfolioDetailsHeaderStateRefreshingCopyWithImpl<
          _$_PortfolioDetailsHeaderStateRefreshing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PortfolioDetailsHeaderViewModel viewModel) idle,
    required TResult Function(PortfolioDetailsHeaderViewModel viewModel)
        refreshing,
    required TResult Function(PortfolioDetailsHeaderViewModel viewModel)
        loading,
  }) {
    return refreshing(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? idle,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? refreshing,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? loading,
  }) {
    return refreshing?.call(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? idle,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? refreshing,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? loading,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(viewModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PortfolioDetailsHeaderStateIdle value) idle,
    required TResult Function(_PortfolioDetailsHeaderStateRefreshing value)
        refreshing,
    required TResult Function(PortfolioDetailsHeaderStateLoading value) loading,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PortfolioDetailsHeaderStateIdle value)? idle,
    TResult Function(_PortfolioDetailsHeaderStateRefreshing value)? refreshing,
    TResult Function(PortfolioDetailsHeaderStateLoading value)? loading,
  }) {
    return refreshing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PortfolioDetailsHeaderStateIdle value)? idle,
    TResult Function(_PortfolioDetailsHeaderStateRefreshing value)? refreshing,
    TResult Function(PortfolioDetailsHeaderStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class _PortfolioDetailsHeaderStateRefreshing
    implements
        PortfolioDetailsHeaderState,
        PortfolioDetailsHeaderStateViewModel {
  factory _PortfolioDetailsHeaderStateRefreshing(
          final PortfolioDetailsHeaderViewModel viewModel) =
      _$_PortfolioDetailsHeaderStateRefreshing;

  @override
  PortfolioDetailsHeaderViewModel get viewModel;
  @override
  @JsonKey(ignore: true)
  _$$_PortfolioDetailsHeaderStateRefreshingCopyWith<
          _$_PortfolioDetailsHeaderStateRefreshing>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PortfolioDetailsHeaderStateLoadingCopyWith<$Res>
    implements $PortfolioDetailsHeaderStateCopyWith<$Res> {
  factory _$$PortfolioDetailsHeaderStateLoadingCopyWith(
          _$PortfolioDetailsHeaderStateLoading value,
          $Res Function(_$PortfolioDetailsHeaderStateLoading) then) =
      __$$PortfolioDetailsHeaderStateLoadingCopyWithImpl<$Res>;
  @override
  $Res call({PortfolioDetailsHeaderViewModel viewModel});

  @override
  $PortfolioDetailsHeaderViewModelCopyWith<$Res> get viewModel;
}

/// @nodoc
class __$$PortfolioDetailsHeaderStateLoadingCopyWithImpl<$Res>
    extends _$PortfolioDetailsHeaderStateCopyWithImpl<$Res>
    implements _$$PortfolioDetailsHeaderStateLoadingCopyWith<$Res> {
  __$$PortfolioDetailsHeaderStateLoadingCopyWithImpl(
      _$PortfolioDetailsHeaderStateLoading _value,
      $Res Function(_$PortfolioDetailsHeaderStateLoading) _then)
      : super(_value, (v) => _then(v as _$PortfolioDetailsHeaderStateLoading));

  @override
  _$PortfolioDetailsHeaderStateLoading get _value =>
      super._value as _$PortfolioDetailsHeaderStateLoading;

  @override
  $Res call({
    Object? viewModel = freezed,
  }) {
    return _then(_$PortfolioDetailsHeaderStateLoading(
      viewModel == freezed
          ? _value.viewModel
          : viewModel // ignore: cast_nullable_to_non_nullable
              as PortfolioDetailsHeaderViewModel,
    ));
  }
}

/// @nodoc

class _$PortfolioDetailsHeaderStateLoading
    implements PortfolioDetailsHeaderStateLoading {
  _$PortfolioDetailsHeaderStateLoading(this.viewModel);

  @override
  final PortfolioDetailsHeaderViewModel viewModel;

  @override
  String toString() {
    return 'PortfolioDetailsHeaderState.loading(viewModel: $viewModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioDetailsHeaderStateLoading &&
            const DeepCollectionEquality().equals(other.viewModel, viewModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(viewModel));

  @JsonKey(ignore: true)
  @override
  _$$PortfolioDetailsHeaderStateLoadingCopyWith<
          _$PortfolioDetailsHeaderStateLoading>
      get copyWith => __$$PortfolioDetailsHeaderStateLoadingCopyWithImpl<
          _$PortfolioDetailsHeaderStateLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PortfolioDetailsHeaderViewModel viewModel) idle,
    required TResult Function(PortfolioDetailsHeaderViewModel viewModel)
        refreshing,
    required TResult Function(PortfolioDetailsHeaderViewModel viewModel)
        loading,
  }) {
    return loading(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? idle,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? refreshing,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? loading,
  }) {
    return loading?.call(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? idle,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? refreshing,
    TResult Function(PortfolioDetailsHeaderViewModel viewModel)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(viewModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PortfolioDetailsHeaderStateIdle value) idle,
    required TResult Function(_PortfolioDetailsHeaderStateRefreshing value)
        refreshing,
    required TResult Function(PortfolioDetailsHeaderStateLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PortfolioDetailsHeaderStateIdle value)? idle,
    TResult Function(_PortfolioDetailsHeaderStateRefreshing value)? refreshing,
    TResult Function(PortfolioDetailsHeaderStateLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PortfolioDetailsHeaderStateIdle value)? idle,
    TResult Function(_PortfolioDetailsHeaderStateRefreshing value)? refreshing,
    TResult Function(PortfolioDetailsHeaderStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PortfolioDetailsHeaderStateLoading
    implements
        PortfolioDetailsHeaderState,
        PortfolioDetailsHeaderStateViewModel {
  factory PortfolioDetailsHeaderStateLoading(
          final PortfolioDetailsHeaderViewModel viewModel) =
      _$PortfolioDetailsHeaderStateLoading;

  @override
  PortfolioDetailsHeaderViewModel get viewModel;
  @override
  @JsonKey(ignore: true)
  _$$PortfolioDetailsHeaderStateLoadingCopyWith<
          _$PortfolioDetailsHeaderStateLoading>
      get copyWith => throw _privateConstructorUsedError;
}
