import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:physical_currency/physical_currency.dart';

part 'portfolio_details_instrument_view_model.freezed.dart';

@freezed
class PortfolioDetailsInstrumentViewModel with _$PortfolioDetailsInstrumentViewModel {
  factory PortfolioDetailsInstrumentViewModel({
    required String ticker,
    required PhysicalCurrencyValue? marketValue,
    required PhysicalCurrencyValue? returnValue,
    required PercentValue? returnPercent,
  }) = _PortfolioDetailsInstrumentViewModel;

  factory PortfolioDetailsInstrumentViewModel.empty() = _PortfolioDetailsInstrumentViewModelEmpty;
}
