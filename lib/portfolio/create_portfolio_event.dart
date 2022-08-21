import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_portfolio_event.freezed.dart';

@freezed
class CreatePortfolioEvent with _$CreatePortfolioEvent {
  factory CreatePortfolioEvent.init() = CreatePortfolioEventInit;

  factory CreatePortfolioEvent.cancel() = CreatePortfolioEventCancel;

  factory CreatePortfolioEvent.submit() = CreatePortfolioEventSubmit;

  factory CreatePortfolioEvent.currencySelected(Currency currency) =
      CreatePortfolioEventCurrencySelected;

  factory CreatePortfolioEvent.portfolioNameChanged(String portfolioName) =
      CreatePortfolioEventPortfolioNameChanged;
}

class Currency {
  final String title;

  Currency(this.title);
}
