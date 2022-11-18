// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'portfolio_details_header_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioDetailsHeaderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String portfolioId) init,
    required TResult Function() refresh,
    required TResult Function() update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function()? refresh,
    TResult Function()? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function()? refresh,
    TResult Function()? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioDetailsHeaderEventInit value) init,
    required TResult Function(PortfolioDetailsHeaderEventRefresh value) refresh,
    required TResult Function(PortfolioDetailsHeaderEventUpdate value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderEventInit value)? init,
    TResult Function(PortfolioDetailsHeaderEventRefresh value)? refresh,
    TResult Function(PortfolioDetailsHeaderEventUpdate value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderEventInit value)? init,
    TResult Function(PortfolioDetailsHeaderEventRefresh value)? refresh,
    TResult Function(PortfolioDetailsHeaderEventUpdate value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioDetailsHeaderEventCopyWith<$Res> {
  factory $PortfolioDetailsHeaderEventCopyWith(
          PortfolioDetailsHeaderEvent value,
          $Res Function(PortfolioDetailsHeaderEvent) then) =
      _$PortfolioDetailsHeaderEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PortfolioDetailsHeaderEventCopyWithImpl<$Res>
    implements $PortfolioDetailsHeaderEventCopyWith<$Res> {
  _$PortfolioDetailsHeaderEventCopyWithImpl(this._value, this._then);

  final PortfolioDetailsHeaderEvent _value;
  // ignore: unused_field
  final $Res Function(PortfolioDetailsHeaderEvent) _then;
}

/// @nodoc
abstract class _$$PortfolioDetailsHeaderEventInitCopyWith<$Res> {
  factory _$$PortfolioDetailsHeaderEventInitCopyWith(
          _$PortfolioDetailsHeaderEventInit value,
          $Res Function(_$PortfolioDetailsHeaderEventInit) then) =
      __$$PortfolioDetailsHeaderEventInitCopyWithImpl<$Res>;
  $Res call({String portfolioId});
}

/// @nodoc
class __$$PortfolioDetailsHeaderEventInitCopyWithImpl<$Res>
    extends _$PortfolioDetailsHeaderEventCopyWithImpl<$Res>
    implements _$$PortfolioDetailsHeaderEventInitCopyWith<$Res> {
  __$$PortfolioDetailsHeaderEventInitCopyWithImpl(
      _$PortfolioDetailsHeaderEventInit _value,
      $Res Function(_$PortfolioDetailsHeaderEventInit) _then)
      : super(_value, (v) => _then(v as _$PortfolioDetailsHeaderEventInit));

  @override
  _$PortfolioDetailsHeaderEventInit get _value =>
      super._value as _$PortfolioDetailsHeaderEventInit;

  @override
  $Res call({
    Object? portfolioId = freezed,
  }) {
    return _then(_$PortfolioDetailsHeaderEventInit(
      portfolioId == freezed
          ? _value.portfolioId
          : portfolioId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PortfolioDetailsHeaderEventInit
    implements PortfolioDetailsHeaderEventInit {
  _$PortfolioDetailsHeaderEventInit(this.portfolioId);

  @override
  final String portfolioId;

  @override
  String toString() {
    return 'PortfolioDetailsHeaderEvent.init(portfolioId: $portfolioId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioDetailsHeaderEventInit &&
            const DeepCollectionEquality()
                .equals(other.portfolioId, portfolioId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(portfolioId));

  @JsonKey(ignore: true)
  @override
  _$$PortfolioDetailsHeaderEventInitCopyWith<_$PortfolioDetailsHeaderEventInit>
      get copyWith => __$$PortfolioDetailsHeaderEventInitCopyWithImpl<
          _$PortfolioDetailsHeaderEventInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String portfolioId) init,
    required TResult Function() refresh,
    required TResult Function() update,
  }) {
    return init(portfolioId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function()? refresh,
    TResult Function()? update,
  }) {
    return init?.call(portfolioId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function()? refresh,
    TResult Function()? update,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(portfolioId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioDetailsHeaderEventInit value) init,
    required TResult Function(PortfolioDetailsHeaderEventRefresh value) refresh,
    required TResult Function(PortfolioDetailsHeaderEventUpdate value) update,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderEventInit value)? init,
    TResult Function(PortfolioDetailsHeaderEventRefresh value)? refresh,
    TResult Function(PortfolioDetailsHeaderEventUpdate value)? update,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderEventInit value)? init,
    TResult Function(PortfolioDetailsHeaderEventRefresh value)? refresh,
    TResult Function(PortfolioDetailsHeaderEventUpdate value)? update,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class PortfolioDetailsHeaderEventInit
    implements PortfolioDetailsHeaderEvent {
  factory PortfolioDetailsHeaderEventInit(final String portfolioId) =
      _$PortfolioDetailsHeaderEventInit;

  String get portfolioId;
  @JsonKey(ignore: true)
  _$$PortfolioDetailsHeaderEventInitCopyWith<_$PortfolioDetailsHeaderEventInit>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PortfolioDetailsHeaderEventRefreshCopyWith<$Res> {
  factory _$$PortfolioDetailsHeaderEventRefreshCopyWith(
          _$PortfolioDetailsHeaderEventRefresh value,
          $Res Function(_$PortfolioDetailsHeaderEventRefresh) then) =
      __$$PortfolioDetailsHeaderEventRefreshCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PortfolioDetailsHeaderEventRefreshCopyWithImpl<$Res>
    extends _$PortfolioDetailsHeaderEventCopyWithImpl<$Res>
    implements _$$PortfolioDetailsHeaderEventRefreshCopyWith<$Res> {
  __$$PortfolioDetailsHeaderEventRefreshCopyWithImpl(
      _$PortfolioDetailsHeaderEventRefresh _value,
      $Res Function(_$PortfolioDetailsHeaderEventRefresh) _then)
      : super(_value, (v) => _then(v as _$PortfolioDetailsHeaderEventRefresh));

  @override
  _$PortfolioDetailsHeaderEventRefresh get _value =>
      super._value as _$PortfolioDetailsHeaderEventRefresh;
}

/// @nodoc

class _$PortfolioDetailsHeaderEventRefresh
    implements PortfolioDetailsHeaderEventRefresh {
  _$PortfolioDetailsHeaderEventRefresh();

  @override
  String toString() {
    return 'PortfolioDetailsHeaderEvent.refresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioDetailsHeaderEventRefresh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String portfolioId) init,
    required TResult Function() refresh,
    required TResult Function() update,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function()? refresh,
    TResult Function()? update,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function()? refresh,
    TResult Function()? update,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioDetailsHeaderEventInit value) init,
    required TResult Function(PortfolioDetailsHeaderEventRefresh value) refresh,
    required TResult Function(PortfolioDetailsHeaderEventUpdate value) update,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderEventInit value)? init,
    TResult Function(PortfolioDetailsHeaderEventRefresh value)? refresh,
    TResult Function(PortfolioDetailsHeaderEventUpdate value)? update,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderEventInit value)? init,
    TResult Function(PortfolioDetailsHeaderEventRefresh value)? refresh,
    TResult Function(PortfolioDetailsHeaderEventUpdate value)? update,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class PortfolioDetailsHeaderEventRefresh
    implements PortfolioDetailsHeaderEvent {
  factory PortfolioDetailsHeaderEventRefresh() =
      _$PortfolioDetailsHeaderEventRefresh;
}

/// @nodoc
abstract class _$$PortfolioDetailsHeaderEventUpdateCopyWith<$Res> {
  factory _$$PortfolioDetailsHeaderEventUpdateCopyWith(
          _$PortfolioDetailsHeaderEventUpdate value,
          $Res Function(_$PortfolioDetailsHeaderEventUpdate) then) =
      __$$PortfolioDetailsHeaderEventUpdateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PortfolioDetailsHeaderEventUpdateCopyWithImpl<$Res>
    extends _$PortfolioDetailsHeaderEventCopyWithImpl<$Res>
    implements _$$PortfolioDetailsHeaderEventUpdateCopyWith<$Res> {
  __$$PortfolioDetailsHeaderEventUpdateCopyWithImpl(
      _$PortfolioDetailsHeaderEventUpdate _value,
      $Res Function(_$PortfolioDetailsHeaderEventUpdate) _then)
      : super(_value, (v) => _then(v as _$PortfolioDetailsHeaderEventUpdate));

  @override
  _$PortfolioDetailsHeaderEventUpdate get _value =>
      super._value as _$PortfolioDetailsHeaderEventUpdate;
}

/// @nodoc

class _$PortfolioDetailsHeaderEventUpdate
    implements PortfolioDetailsHeaderEventUpdate {
  _$PortfolioDetailsHeaderEventUpdate();

  @override
  String toString() {
    return 'PortfolioDetailsHeaderEvent.update()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioDetailsHeaderEventUpdate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String portfolioId) init,
    required TResult Function() refresh,
    required TResult Function() update,
  }) {
    return update();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function()? refresh,
    TResult Function()? update,
  }) {
    return update?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String portfolioId)? init,
    TResult Function()? refresh,
    TResult Function()? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioDetailsHeaderEventInit value) init,
    required TResult Function(PortfolioDetailsHeaderEventRefresh value) refresh,
    required TResult Function(PortfolioDetailsHeaderEventUpdate value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderEventInit value)? init,
    TResult Function(PortfolioDetailsHeaderEventRefresh value)? refresh,
    TResult Function(PortfolioDetailsHeaderEventUpdate value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderEventInit value)? init,
    TResult Function(PortfolioDetailsHeaderEventRefresh value)? refresh,
    TResult Function(PortfolioDetailsHeaderEventUpdate value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class PortfolioDetailsHeaderEventUpdate
    implements PortfolioDetailsHeaderEvent {
  factory PortfolioDetailsHeaderEventUpdate() =
      _$PortfolioDetailsHeaderEventUpdate;
}
