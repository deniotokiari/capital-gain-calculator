import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:physical_currency/physical_currency.dart';

part 'portfolio_details_header_view_model.freezed.dart';

@freezed
class PortfolioDetailsHeaderViewModel with _$PortfolioDetailsHeaderViewModel {
  factory PortfolioDetailsHeaderViewModel.values({
    required String? portfolioName,
    required PhysicalCurrencyValue? marketValue,
    required PhysicalCurrencyValue? returnValue,
    required PercentValue? returnPercent,
    required bool refreshing,
    required bool loading,
  }) = PortfolioDetailsHeaderViewModelValues;

  factory PortfolioDetailsHeaderViewModel.empty() => PortfolioDetailsHeaderViewModel.values(
        portfolioName: null,
        marketValue: null,
        returnValue: null,
        returnPercent: null,
        refreshing: false,
        loading: true,
      );
}
