// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioDetailsEvent {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioDetailsEventInit value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PortfolioDetailsEventInit value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioDetailsEventInit value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortfolioDetailsEventCopyWith<PortfolioDetailsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioDetailsEventCopyWith<$Res> {
  factory $PortfolioDetailsEventCopyWith(PortfolioDetailsEvent value,
          $Res Function(PortfolioDetailsEvent) then) =
      _$PortfolioDetailsEventCopyWithImpl<$Res, PortfolioDetailsEvent>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$PortfolioDetailsEventCopyWithImpl<$Res,
        $Val extends PortfolioDetailsEvent>
    implements $PortfolioDetailsEventCopyWith<$Res> {
  _$PortfolioDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PortfolioDetailsEventInitCopyWith<$Res>
    implements $PortfolioDetailsEventCopyWith<$Res> {
  factory _$$PortfolioDetailsEventInitCopyWith(
          _$PortfolioDetailsEventInit value,
          $Res Function(_$PortfolioDetailsEventInit) then) =
      __$$PortfolioDetailsEventInitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$PortfolioDetailsEventInitCopyWithImpl<$Res>
    extends _$PortfolioDetailsEventCopyWithImpl<$Res,
        _$PortfolioDetailsEventInit>
    implements _$$PortfolioDetailsEventInitCopyWith<$Res> {
  __$$PortfolioDetailsEventInitCopyWithImpl(_$PortfolioDetailsEventInit _value,
      $Res Function(_$PortfolioDetailsEventInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$PortfolioDetailsEventInit(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PortfolioDetailsEventInit implements PortfolioDetailsEventInit {
  _$PortfolioDetailsEventInit(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'PortfolioDetailsEvent.init(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioDetailsEventInit &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioDetailsEventInitCopyWith<_$PortfolioDetailsEventInit>
      get copyWith => __$$PortfolioDetailsEventInitCopyWithImpl<
          _$PortfolioDetailsEventInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) init,
  }) {
    return init(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? init,
  }) {
    return init?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioDetailsEventInit value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PortfolioDetailsEventInit value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioDetailsEventInit value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class PortfolioDetailsEventInit implements PortfolioDetailsEvent {
  factory PortfolioDetailsEventInit(final String id) =
      _$PortfolioDetailsEventInit;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$PortfolioDetailsEventInitCopyWith<_$PortfolioDetailsEventInit>
      get copyWith => throw _privateConstructorUsedError;
}
