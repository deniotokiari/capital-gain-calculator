// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SearchResult result) result,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchResult result)? result,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchResult result)? result,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateResult value) result,
    required TResult Function(_SearchStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateResult value)? result,
    TResult Function(_SearchStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateResult value)? result,
    TResult Function(_SearchStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;
}

/// @nodoc
abstract class _$$_SearchStateInitialCopyWith<$Res> {
  factory _$$_SearchStateInitialCopyWith(_$_SearchStateInitial value,
          $Res Function(_$_SearchStateInitial) then) =
      __$$_SearchStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SearchStateInitialCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements _$$_SearchStateInitialCopyWith<$Res> {
  __$$_SearchStateInitialCopyWithImpl(
      _$_SearchStateInitial _value, $Res Function(_$_SearchStateInitial) _then)
      : super(_value, (v) => _then(v as _$_SearchStateInitial));

  @override
  _$_SearchStateInitial get _value => super._value as _$_SearchStateInitial;
}

/// @nodoc

class _$_SearchStateInitial implements _SearchStateInitial {
  _$_SearchStateInitial();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SearchStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SearchResult result) result,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchResult result)? result,
    TResult Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchResult result)? result,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateResult value) result,
    required TResult Function(_SearchStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateResult value)? result,
    TResult Function(_SearchStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateResult value)? result,
    TResult Function(_SearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SearchStateInitial implements SearchState {
  factory _SearchStateInitial() = _$_SearchStateInitial;
}

/// @nodoc
abstract class _$$_SearchStateLoadingCopyWith<$Res> {
  factory _$$_SearchStateLoadingCopyWith(_$_SearchStateLoading value,
          $Res Function(_$_SearchStateLoading) then) =
      __$$_SearchStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SearchStateLoadingCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements _$$_SearchStateLoadingCopyWith<$Res> {
  __$$_SearchStateLoadingCopyWithImpl(
      _$_SearchStateLoading _value, $Res Function(_$_SearchStateLoading) _then)
      : super(_value, (v) => _then(v as _$_SearchStateLoading));

  @override
  _$_SearchStateLoading get _value => super._value as _$_SearchStateLoading;
}

/// @nodoc

class _$_SearchStateLoading implements _SearchStateLoading {
  _$_SearchStateLoading();

  @override
  String toString() {
    return 'SearchState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SearchStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SearchResult result) result,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchResult result)? result,
    TResult Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchResult result)? result,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateResult value) result,
    required TResult Function(_SearchStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateResult value)? result,
    TResult Function(_SearchStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateResult value)? result,
    TResult Function(_SearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SearchStateLoading implements SearchState {
  factory _SearchStateLoading() = _$_SearchStateLoading;
}

/// @nodoc
abstract class _$$_SearchStateResultCopyWith<$Res> {
  factory _$$_SearchStateResultCopyWith(_$_SearchStateResult value,
          $Res Function(_$_SearchStateResult) then) =
      __$$_SearchStateResultCopyWithImpl<$Res>;
  $Res call({SearchResult result});
}

/// @nodoc
class __$$_SearchStateResultCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements _$$_SearchStateResultCopyWith<$Res> {
  __$$_SearchStateResultCopyWithImpl(
      _$_SearchStateResult _value, $Res Function(_$_SearchStateResult) _then)
      : super(_value, (v) => _then(v as _$_SearchStateResult));

  @override
  _$_SearchStateResult get _value => super._value as _$_SearchStateResult;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$_SearchStateResult(
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as SearchResult,
    ));
  }
}

/// @nodoc

class _$_SearchStateResult implements _SearchStateResult {
  _$_SearchStateResult(this.result);

  @override
  final SearchResult result;

  @override
  String toString() {
    return 'SearchState.result(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchStateResult &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  _$$_SearchStateResultCopyWith<_$_SearchStateResult> get copyWith =>
      __$$_SearchStateResultCopyWithImpl<_$_SearchStateResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SearchResult result) result,
    required TResult Function() error,
  }) {
    return result(this.result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchResult result)? result,
    TResult Function()? error,
  }) {
    return result?.call(this.result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchResult result)? result,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(this.result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateResult value) result,
    required TResult Function(_SearchStateError value) error,
  }) {
    return result(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateResult value)? result,
    TResult Function(_SearchStateError value)? error,
  }) {
    return result?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateResult value)? result,
    TResult Function(_SearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(this);
    }
    return orElse();
  }
}

abstract class _SearchStateResult implements SearchState {
  factory _SearchStateResult(final SearchResult result) = _$_SearchStateResult;

  SearchResult get result;
  @JsonKey(ignore: true)
  _$$_SearchStateResultCopyWith<_$_SearchStateResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SearchStateErrorCopyWith<$Res> {
  factory _$$_SearchStateErrorCopyWith(
          _$_SearchStateError value, $Res Function(_$_SearchStateError) then) =
      __$$_SearchStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SearchStateErrorCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements _$$_SearchStateErrorCopyWith<$Res> {
  __$$_SearchStateErrorCopyWithImpl(
      _$_SearchStateError _value, $Res Function(_$_SearchStateError) _then)
      : super(_value, (v) => _then(v as _$_SearchStateError));

  @override
  _$_SearchStateError get _value => super._value as _$_SearchStateError;
}

/// @nodoc

class _$_SearchStateError implements _SearchStateError {
  _$_SearchStateError();

  @override
  String toString() {
    return 'SearchState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SearchStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SearchResult result) result,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchResult result)? result,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchResult result)? result,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateResult value) result,
    required TResult Function(_SearchStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateResult value)? result,
    TResult Function(_SearchStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateResult value)? result,
    TResult Function(_SearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SearchStateError implements SearchState {
  factory _SearchStateError() = _$_SearchStateError;
}
