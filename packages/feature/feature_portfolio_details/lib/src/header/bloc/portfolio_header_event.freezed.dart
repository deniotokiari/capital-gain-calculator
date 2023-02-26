// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_header_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioHeaderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String porftolioId) init,
    required TResult Function() update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String porftolioId)? init,
    TResult? Function()? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String porftolioId)? init,
    TResult Function()? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioHeaderEventInit value) init,
    required TResult Function(PortfolioHeaderEventUpdate value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PortfolioHeaderEventInit value)? init,
    TResult? Function(PortfolioHeaderEventUpdate value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioHeaderEventInit value)? init,
    TResult Function(PortfolioHeaderEventUpdate value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioHeaderEventCopyWith<$Res> {
  factory $PortfolioHeaderEventCopyWith(PortfolioHeaderEvent value,
          $Res Function(PortfolioHeaderEvent) then) =
      _$PortfolioHeaderEventCopyWithImpl<$Res, PortfolioHeaderEvent>;
}

/// @nodoc
class _$PortfolioHeaderEventCopyWithImpl<$Res,
        $Val extends PortfolioHeaderEvent>
    implements $PortfolioHeaderEventCopyWith<$Res> {
  _$PortfolioHeaderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PortfolioHeaderEventInitCopyWith<$Res> {
  factory _$$PortfolioHeaderEventInitCopyWith(_$PortfolioHeaderEventInit value,
          $Res Function(_$PortfolioHeaderEventInit) then) =
      __$$PortfolioHeaderEventInitCopyWithImpl<$Res>;
  @useResult
  $Res call({String porftolioId});
}

/// @nodoc
class __$$PortfolioHeaderEventInitCopyWithImpl<$Res>
    extends _$PortfolioHeaderEventCopyWithImpl<$Res, _$PortfolioHeaderEventInit>
    implements _$$PortfolioHeaderEventInitCopyWith<$Res> {
  __$$PortfolioHeaderEventInitCopyWithImpl(_$PortfolioHeaderEventInit _value,
      $Res Function(_$PortfolioHeaderEventInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? porftolioId = null,
  }) {
    return _then(_$PortfolioHeaderEventInit(
      null == porftolioId
          ? _value.porftolioId
          : porftolioId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PortfolioHeaderEventInit implements PortfolioHeaderEventInit {
  _$PortfolioHeaderEventInit(this.porftolioId);

  @override
  final String porftolioId;

  @override
  String toString() {
    return 'PortfolioHeaderEvent.init(porftolioId: $porftolioId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioHeaderEventInit &&
            (identical(other.porftolioId, porftolioId) ||
                other.porftolioId == porftolioId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, porftolioId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioHeaderEventInitCopyWith<_$PortfolioHeaderEventInit>
      get copyWith =>
          __$$PortfolioHeaderEventInitCopyWithImpl<_$PortfolioHeaderEventInit>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String porftolioId) init,
    required TResult Function() update,
  }) {
    return init(porftolioId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String porftolioId)? init,
    TResult? Function()? update,
  }) {
    return init?.call(porftolioId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String porftolioId)? init,
    TResult Function()? update,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(porftolioId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioHeaderEventInit value) init,
    required TResult Function(PortfolioHeaderEventUpdate value) update,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PortfolioHeaderEventInit value)? init,
    TResult? Function(PortfolioHeaderEventUpdate value)? update,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioHeaderEventInit value)? init,
    TResult Function(PortfolioHeaderEventUpdate value)? update,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class PortfolioHeaderEventInit implements PortfolioHeaderEvent {
  factory PortfolioHeaderEventInit(final String porftolioId) =
      _$PortfolioHeaderEventInit;

  String get porftolioId;
  @JsonKey(ignore: true)
  _$$PortfolioHeaderEventInitCopyWith<_$PortfolioHeaderEventInit>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PortfolioHeaderEventUpdateCopyWith<$Res> {
  factory _$$PortfolioHeaderEventUpdateCopyWith(
          _$PortfolioHeaderEventUpdate value,
          $Res Function(_$PortfolioHeaderEventUpdate) then) =
      __$$PortfolioHeaderEventUpdateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PortfolioHeaderEventUpdateCopyWithImpl<$Res>
    extends _$PortfolioHeaderEventCopyWithImpl<$Res,
        _$PortfolioHeaderEventUpdate>
    implements _$$PortfolioHeaderEventUpdateCopyWith<$Res> {
  __$$PortfolioHeaderEventUpdateCopyWithImpl(
      _$PortfolioHeaderEventUpdate _value,
      $Res Function(_$PortfolioHeaderEventUpdate) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PortfolioHeaderEventUpdate implements PortfolioHeaderEventUpdate {
  _$PortfolioHeaderEventUpdate();

  @override
  String toString() {
    return 'PortfolioHeaderEvent.update()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioHeaderEventUpdate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String porftolioId) init,
    required TResult Function() update,
  }) {
    return update();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String porftolioId)? init,
    TResult? Function()? update,
  }) {
    return update?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String porftolioId)? init,
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
    required TResult Function(PortfolioHeaderEventInit value) init,
    required TResult Function(PortfolioHeaderEventUpdate value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PortfolioHeaderEventInit value)? init,
    TResult? Function(PortfolioHeaderEventUpdate value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioHeaderEventInit value)? init,
    TResult Function(PortfolioHeaderEventUpdate value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class PortfolioHeaderEventUpdate implements PortfolioHeaderEvent {
  factory PortfolioHeaderEventUpdate() = _$PortfolioHeaderEventUpdate;
}
