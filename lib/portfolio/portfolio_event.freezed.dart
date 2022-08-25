// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'portfolio_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioEvent {
  int get portfolioId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int portfolioId) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int portfolioId)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int portfolioId)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioEventInit value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioEventInit value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioEventInit value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortfolioEventCopyWith<PortfolioEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioEventCopyWith<$Res> {
  factory $PortfolioEventCopyWith(
          PortfolioEvent value, $Res Function(PortfolioEvent) then) =
      _$PortfolioEventCopyWithImpl<$Res>;
  $Res call({int portfolioId});
}

/// @nodoc
class _$PortfolioEventCopyWithImpl<$Res>
    implements $PortfolioEventCopyWith<$Res> {
  _$PortfolioEventCopyWithImpl(this._value, this._then);

  final PortfolioEvent _value;
  // ignore: unused_field
  final $Res Function(PortfolioEvent) _then;

  @override
  $Res call({
    Object? portfolioId = freezed,
  }) {
    return _then(_value.copyWith(
      portfolioId: portfolioId == freezed
          ? _value.portfolioId
          : portfolioId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$PortfolioEventInitCopyWith<$Res>
    implements $PortfolioEventCopyWith<$Res> {
  factory _$$PortfolioEventInitCopyWith(_$PortfolioEventInit value,
          $Res Function(_$PortfolioEventInit) then) =
      __$$PortfolioEventInitCopyWithImpl<$Res>;
  @override
  $Res call({int portfolioId});
}

/// @nodoc
class __$$PortfolioEventInitCopyWithImpl<$Res>
    extends _$PortfolioEventCopyWithImpl<$Res>
    implements _$$PortfolioEventInitCopyWith<$Res> {
  __$$PortfolioEventInitCopyWithImpl(
      _$PortfolioEventInit _value, $Res Function(_$PortfolioEventInit) _then)
      : super(_value, (v) => _then(v as _$PortfolioEventInit));

  @override
  _$PortfolioEventInit get _value => super._value as _$PortfolioEventInit;

  @override
  $Res call({
    Object? portfolioId = freezed,
  }) {
    return _then(_$PortfolioEventInit(
      portfolioId == freezed
          ? _value.portfolioId
          : portfolioId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PortfolioEventInit implements PortfolioEventInit {
  _$PortfolioEventInit(this.portfolioId);

  @override
  final int portfolioId;

  @override
  String toString() {
    return 'PortfolioEvent.init(portfolioId: $portfolioId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioEventInit &&
            const DeepCollectionEquality()
                .equals(other.portfolioId, portfolioId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(portfolioId));

  @JsonKey(ignore: true)
  @override
  _$$PortfolioEventInitCopyWith<_$PortfolioEventInit> get copyWith =>
      __$$PortfolioEventInitCopyWithImpl<_$PortfolioEventInit>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int portfolioId) init,
  }) {
    return init(portfolioId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int portfolioId)? init,
  }) {
    return init?.call(portfolioId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int portfolioId)? init,
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
    required TResult Function(PortfolioEventInit value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioEventInit value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioEventInit value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class PortfolioEventInit implements PortfolioEvent {
  factory PortfolioEventInit(final int portfolioId) = _$PortfolioEventInit;

  @override
  int get portfolioId;
  @override
  @JsonKey(ignore: true)
  _$$PortfolioEventInitCopyWith<_$PortfolioEventInit> get copyWith =>
      throw _privateConstructorUsedError;
}
