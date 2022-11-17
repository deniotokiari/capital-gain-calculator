import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:physical_currency/physical_currency.dart';

part 'portfolio_details_header_view_model.freezed.dart';

@freezed
class PortfolioDetailsHeaderViewModel with _$PortfolioDetailsHeaderViewModel {
  factory PortfolioDetailsHeaderViewModel.model({
    required String portfolioName,
    required PhysicalCurrencyValue marketValue,
    required PhysicalCurrencyValue returnValue,
    required double returnPercent,
  }) = PortfolioDetailsHeaderViewModelModel;

  factory PortfolioDetailsHeaderViewModel.empty() = PortfolioDetailsHeaderViewModelEmpty;
}
