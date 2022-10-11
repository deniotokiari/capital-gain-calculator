import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:physical_currency/physical_currency.dart';

part 'create_portfolio_event.freezed.dart';

@freezed
class CreatePortfolioEvent with _$CreatePortfolioEvent {
  factory CreatePortfolioEvent.init() = CreatePortfolioEventInit;

  factory CreatePortfolioEvent.submit() = CreatePortfolioEventSubmit;

  factory CreatePortfolioEvent.currencySelected(PhysicalCurrency currency) =
      CreatePortfolioEventCurrencySelected;

  factory CreatePortfolioEvent.portfolioNameChanged(String portfolioName) =
      CreatePortfolioEventPortfolioNameChanged;
}
