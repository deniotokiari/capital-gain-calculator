// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'portfolio_details_header_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PortfolioDetailsHeaderViewModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String portfolioName,
            PhysicalCurrencyValue marketValue,
            PhysicalCurrencyValue returnValue,
            double returnPercent)
        model,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String portfolioName, PhysicalCurrencyValue marketValue,
            PhysicalCurrencyValue returnValue, double returnPercent)?
        model,
    TResult Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String portfolioName, PhysicalCurrencyValue marketValue,
            PhysicalCurrencyValue returnValue, double returnPercent)?
        model,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioDetailsHeaderViewModelModel value) model,
    required TResult Function(PortfolioDetailsHeaderViewModelEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderViewModelModel value)? model,
    TResult Function(PortfolioDetailsHeaderViewModelEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderViewModelModel value)? model,
    TResult Function(PortfolioDetailsHeaderViewModelEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioDetailsHeaderViewModelCopyWith<$Res> {
  factory $PortfolioDetailsHeaderViewModelCopyWith(
          PortfolioDetailsHeaderViewModel value,
          $Res Function(PortfolioDetailsHeaderViewModel) then) =
      _$PortfolioDetailsHeaderViewModelCopyWithImpl<$Res>;
}

/// @nodoc
class _$PortfolioDetailsHeaderViewModelCopyWithImpl<$Res>
    implements $PortfolioDetailsHeaderViewModelCopyWith<$Res> {
  _$PortfolioDetailsHeaderViewModelCopyWithImpl(this._value, this._then);

  final PortfolioDetailsHeaderViewModel _value;
  // ignore: unused_field
  final $Res Function(PortfolioDetailsHeaderViewModel) _then;
}

/// @nodoc
abstract class _$$PortfolioDetailsHeaderViewModelModelCopyWith<$Res> {
  factory _$$PortfolioDetailsHeaderViewModelModelCopyWith(
          _$PortfolioDetailsHeaderViewModelModel value,
          $Res Function(_$PortfolioDetailsHeaderViewModelModel) then) =
      __$$PortfolioDetailsHeaderViewModelModelCopyWithImpl<$Res>;
  $Res call(
      {String portfolioName,
      PhysicalCurrencyValue marketValue,
      PhysicalCurrencyValue returnValue,
      double returnPercent});
}

/// @nodoc
class __$$PortfolioDetailsHeaderViewModelModelCopyWithImpl<$Res>
    extends _$PortfolioDetailsHeaderViewModelCopyWithImpl<$Res>
    implements _$$PortfolioDetailsHeaderViewModelModelCopyWith<$Res> {
  __$$PortfolioDetailsHeaderViewModelModelCopyWithImpl(
      _$PortfolioDetailsHeaderViewModelModel _value,
      $Res Function(_$PortfolioDetailsHeaderViewModelModel) _then)
      : super(
            _value, (v) => _then(v as _$PortfolioDetailsHeaderViewModelModel));

  @override
  _$PortfolioDetailsHeaderViewModelModel get _value =>
      super._value as _$PortfolioDetailsHeaderViewModelModel;

  @override
  $Res call({
    Object? portfolioName = freezed,
    Object? marketValue = freezed,
    Object? returnValue = freezed,
    Object? returnPercent = freezed,
  }) {
    return _then(_$PortfolioDetailsHeaderViewModelModel(
      portfolioName: portfolioName == freezed
          ? _value.portfolioName
          : portfolioName // ignore: cast_nullable_to_non_nullable
              as String,
      marketValue: marketValue == freezed
          ? _value.marketValue
          : marketValue // ignore: cast_nullable_to_non_nullable
              as PhysicalCurrencyValue,
      returnValue: returnValue == freezed
          ? _value.returnValue
          : returnValue // ignore: cast_nullable_to_non_nullable
              as PhysicalCurrencyValue,
      returnPercent: returnPercent == freezed
          ? _value.returnPercent
          : returnPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PortfolioDetailsHeaderViewModelModel
    implements PortfolioDetailsHeaderViewModelModel {
  _$PortfolioDetailsHeaderViewModelModel(
      {required this.portfolioName,
      required this.marketValue,
      required this.returnValue,
      required this.returnPercent});

  @override
  final String portfolioName;
  @override
  final PhysicalCurrencyValue marketValue;
  @override
  final PhysicalCurrencyValue returnValue;
  @override
  final double returnPercent;

  @override
  String toString() {
    return 'PortfolioDetailsHeaderViewModel.model(portfolioName: $portfolioName, marketValue: $marketValue, returnValue: $returnValue, returnPercent: $returnPercent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioDetailsHeaderViewModelModel &&
            const DeepCollectionEquality()
                .equals(other.portfolioName, portfolioName) &&
            const DeepCollectionEquality()
                .equals(other.marketValue, marketValue) &&
            const DeepCollectionEquality()
                .equals(other.returnValue, returnValue) &&
            const DeepCollectionEquality()
                .equals(other.returnPercent, returnPercent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(portfolioName),
      const DeepCollectionEquality().hash(marketValue),
      const DeepCollectionEquality().hash(returnValue),
      const DeepCollectionEquality().hash(returnPercent));

  @JsonKey(ignore: true)
  @override
  _$$PortfolioDetailsHeaderViewModelModelCopyWith<
          _$PortfolioDetailsHeaderViewModelModel>
      get copyWith => __$$PortfolioDetailsHeaderViewModelModelCopyWithImpl<
          _$PortfolioDetailsHeaderViewModelModel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String portfolioName,
            PhysicalCurrencyValue marketValue,
            PhysicalCurrencyValue returnValue,
            double returnPercent)
        model,
    required TResult Function() empty,
  }) {
    return model(portfolioName, marketValue, returnValue, returnPercent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String portfolioName, PhysicalCurrencyValue marketValue,
            PhysicalCurrencyValue returnValue, double returnPercent)?
        model,
    TResult Function()? empty,
  }) {
    return model?.call(portfolioName, marketValue, returnValue, returnPercent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String portfolioName, PhysicalCurrencyValue marketValue,
            PhysicalCurrencyValue returnValue, double returnPercent)?
        model,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(portfolioName, marketValue, returnValue, returnPercent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioDetailsHeaderViewModelModel value) model,
    required TResult Function(PortfolioDetailsHeaderViewModelEmpty value) empty,
  }) {
    return model(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderViewModelModel value)? model,
    TResult Function(PortfolioDetailsHeaderViewModelEmpty value)? empty,
  }) {
    return model?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderViewModelModel value)? model,
    TResult Function(PortfolioDetailsHeaderViewModelEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(this);
    }
    return orElse();
  }
}

abstract class PortfolioDetailsHeaderViewModelModel
    implements PortfolioDetailsHeaderViewModel {
  factory PortfolioDetailsHeaderViewModelModel(
          {required final String portfolioName,
          required final PhysicalCurrencyValue marketValue,
          required final PhysicalCurrencyValue returnValue,
          required final double returnPercent}) =
      _$PortfolioDetailsHeaderViewModelModel;

  String get portfolioName;
  PhysicalCurrencyValue get marketValue;
  PhysicalCurrencyValue get returnValue;
  double get returnPercent;
  @JsonKey(ignore: true)
  _$$PortfolioDetailsHeaderViewModelModelCopyWith<
          _$PortfolioDetailsHeaderViewModelModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PortfolioDetailsHeaderViewModelEmptyCopyWith<$Res> {
  factory _$$PortfolioDetailsHeaderViewModelEmptyCopyWith(
          _$PortfolioDetailsHeaderViewModelEmpty value,
          $Res Function(_$PortfolioDetailsHeaderViewModelEmpty) then) =
      __$$PortfolioDetailsHeaderViewModelEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PortfolioDetailsHeaderViewModelEmptyCopyWithImpl<$Res>
    extends _$PortfolioDetailsHeaderViewModelCopyWithImpl<$Res>
    implements _$$PortfolioDetailsHeaderViewModelEmptyCopyWith<$Res> {
  __$$PortfolioDetailsHeaderViewModelEmptyCopyWithImpl(
      _$PortfolioDetailsHeaderViewModelEmpty _value,
      $Res Function(_$PortfolioDetailsHeaderViewModelEmpty) _then)
      : super(
            _value, (v) => _then(v as _$PortfolioDetailsHeaderViewModelEmpty));

  @override
  _$PortfolioDetailsHeaderViewModelEmpty get _value =>
      super._value as _$PortfolioDetailsHeaderViewModelEmpty;
}

/// @nodoc

class _$PortfolioDetailsHeaderViewModelEmpty
    implements PortfolioDetailsHeaderViewModelEmpty {
  _$PortfolioDetailsHeaderViewModelEmpty();

  @override
  String toString() {
    return 'PortfolioDetailsHeaderViewModel.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioDetailsHeaderViewModelEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String portfolioName,
            PhysicalCurrencyValue marketValue,
            PhysicalCurrencyValue returnValue,
            double returnPercent)
        model,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String portfolioName, PhysicalCurrencyValue marketValue,
            PhysicalCurrencyValue returnValue, double returnPercent)?
        model,
    TResult Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String portfolioName, PhysicalCurrencyValue marketValue,
            PhysicalCurrencyValue returnValue, double returnPercent)?
        model,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioDetailsHeaderViewModelModel value) model,
    required TResult Function(PortfolioDetailsHeaderViewModelEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderViewModelModel value)? model,
    TResult Function(PortfolioDetailsHeaderViewModelEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioDetailsHeaderViewModelModel value)? model,
    TResult Function(PortfolioDetailsHeaderViewModelEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class PortfolioDetailsHeaderViewModelEmpty
    implements PortfolioDetailsHeaderViewModel {
  factory PortfolioDetailsHeaderViewModelEmpty() =
      _$PortfolioDetailsHeaderViewModelEmpty;
}
