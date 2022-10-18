// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'symbol_search_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SymbolSearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SymbolSearchEventSearch value) search,
    required TResult Function(SymbolSearchEventClear value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SymbolSearchEventSearch value)? search,
    TResult? Function(SymbolSearchEventClear value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SymbolSearchEventSearch value)? search,
    TResult Function(SymbolSearchEventClear value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymbolSearchEventCopyWith<$Res> {
  factory $SymbolSearchEventCopyWith(
          SymbolSearchEvent value, $Res Function(SymbolSearchEvent) then) =
      _$SymbolSearchEventCopyWithImpl<$Res, SymbolSearchEvent>;
}

/// @nodoc
class _$SymbolSearchEventCopyWithImpl<$Res, $Val extends SymbolSearchEvent>
    implements $SymbolSearchEventCopyWith<$Res> {
  _$SymbolSearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SymbolSearchEventSearchCopyWith<$Res> {
  factory _$$SymbolSearchEventSearchCopyWith(_$SymbolSearchEventSearch value,
          $Res Function(_$SymbolSearchEventSearch) then) =
      __$$SymbolSearchEventSearchCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SymbolSearchEventSearchCopyWithImpl<$Res>
    extends _$SymbolSearchEventCopyWithImpl<$Res, _$SymbolSearchEventSearch>
    implements _$$SymbolSearchEventSearchCopyWith<$Res> {
  __$$SymbolSearchEventSearchCopyWithImpl(_$SymbolSearchEventSearch _value,
      $Res Function(_$SymbolSearchEventSearch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SymbolSearchEventSearch(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SymbolSearchEventSearch implements SymbolSearchEventSearch {
  _$SymbolSearchEventSearch(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'SymbolSearchEvent.search(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SymbolSearchEventSearch &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SymbolSearchEventSearchCopyWith<_$SymbolSearchEventSearch> get copyWith =>
      __$$SymbolSearchEventSearchCopyWithImpl<_$SymbolSearchEventSearch>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function() clear,
  }) {
    return search(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function()? clear,
  }) {
    return search?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SymbolSearchEventSearch value) search,
    required TResult Function(SymbolSearchEventClear value) clear,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SymbolSearchEventSearch value)? search,
    TResult? Function(SymbolSearchEventClear value)? clear,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SymbolSearchEventSearch value)? search,
    TResult Function(SymbolSearchEventClear value)? clear,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class SymbolSearchEventSearch implements SymbolSearchEvent {
  factory SymbolSearchEventSearch(final String query) =
      _$SymbolSearchEventSearch;

  String get query;
  @JsonKey(ignore: true)
  _$$SymbolSearchEventSearchCopyWith<_$SymbolSearchEventSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SymbolSearchEventClearCopyWith<$Res> {
  factory _$$SymbolSearchEventClearCopyWith(_$SymbolSearchEventClear value,
          $Res Function(_$SymbolSearchEventClear) then) =
      __$$SymbolSearchEventClearCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SymbolSearchEventClearCopyWithImpl<$Res>
    extends _$SymbolSearchEventCopyWithImpl<$Res, _$SymbolSearchEventClear>
    implements _$$SymbolSearchEventClearCopyWith<$Res> {
  __$$SymbolSearchEventClearCopyWithImpl(_$SymbolSearchEventClear _value,
      $Res Function(_$SymbolSearchEventClear) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SymbolSearchEventClear implements SymbolSearchEventClear {
  _$SymbolSearchEventClear();

  @override
  String toString() {
    return 'SymbolSearchEvent.clear()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SymbolSearchEventClear);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SymbolSearchEventSearch value) search,
    required TResult Function(SymbolSearchEventClear value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SymbolSearchEventSearch value)? search,
    TResult? Function(SymbolSearchEventClear value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SymbolSearchEventSearch value)? search,
    TResult Function(SymbolSearchEventClear value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class SymbolSearchEventClear implements SymbolSearchEvent {
  factory SymbolSearchEventClear() = _$SymbolSearchEventClear;
}
