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
  SearchResultItem get item => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SearchResultItem item) addSymbol,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SearchResultItem item)? addSymbol,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SearchResultItem item)? addSymbol,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioEventAddSymbol value) addSymbol,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioEventAddSymbol value)? addSymbol,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioEventAddSymbol value)? addSymbol,
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
  $Res call({SearchResultItem item});
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
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as SearchResultItem,
    ));
  }
}

/// @nodoc
abstract class _$$PortfolioEventAddSymbolCopyWith<$Res>
    implements $PortfolioEventCopyWith<$Res> {
  factory _$$PortfolioEventAddSymbolCopyWith(_$PortfolioEventAddSymbol value,
          $Res Function(_$PortfolioEventAddSymbol) then) =
      __$$PortfolioEventAddSymbolCopyWithImpl<$Res>;
  @override
  $Res call({SearchResultItem item});
}

/// @nodoc
class __$$PortfolioEventAddSymbolCopyWithImpl<$Res>
    extends _$PortfolioEventCopyWithImpl<$Res>
    implements _$$PortfolioEventAddSymbolCopyWith<$Res> {
  __$$PortfolioEventAddSymbolCopyWithImpl(_$PortfolioEventAddSymbol _value,
      $Res Function(_$PortfolioEventAddSymbol) _then)
      : super(_value, (v) => _then(v as _$PortfolioEventAddSymbol));

  @override
  _$PortfolioEventAddSymbol get _value =>
      super._value as _$PortfolioEventAddSymbol;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$PortfolioEventAddSymbol(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as SearchResultItem,
    ));
  }
}

/// @nodoc

class _$PortfolioEventAddSymbol implements PortfolioEventAddSymbol {
  _$PortfolioEventAddSymbol(this.item);

  @override
  final SearchResultItem item;

  @override
  String toString() {
    return 'PortfolioEvent.addSymbol(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioEventAddSymbol &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$$PortfolioEventAddSymbolCopyWith<_$PortfolioEventAddSymbol> get copyWith =>
      __$$PortfolioEventAddSymbolCopyWithImpl<_$PortfolioEventAddSymbol>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SearchResultItem item) addSymbol,
  }) {
    return addSymbol(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SearchResultItem item)? addSymbol,
  }) {
    return addSymbol?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SearchResultItem item)? addSymbol,
    required TResult orElse(),
  }) {
    if (addSymbol != null) {
      return addSymbol(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioEventAddSymbol value) addSymbol,
  }) {
    return addSymbol(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioEventAddSymbol value)? addSymbol,
  }) {
    return addSymbol?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioEventAddSymbol value)? addSymbol,
    required TResult orElse(),
  }) {
    if (addSymbol != null) {
      return addSymbol(this);
    }
    return orElse();
  }
}

abstract class PortfolioEventAddSymbol implements PortfolioEvent {
  factory PortfolioEventAddSymbol(final SearchResultItem item) =
      _$PortfolioEventAddSymbol;

  @override
  SearchResultItem get item;
  @override
  @JsonKey(ignore: true)
  _$$PortfolioEventAddSymbolCopyWith<_$PortfolioEventAddSymbol> get copyWith =>
      throw _privateConstructorUsedError;
}
