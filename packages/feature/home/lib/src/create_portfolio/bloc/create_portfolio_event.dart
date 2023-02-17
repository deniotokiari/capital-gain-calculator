import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_portfolio_event.freezed.dart';

@freezed
class CreatePortfolioEvent with _$CreatePortfolioEvent {
  factory CreatePortfolioEvent.init() = CreatePortfolioEventInit;

  factory CreatePortfolioEvent.onPortfolioNameChanged(String name) = CreatePortfolioEventOnPortfolioNameChanged;

  factory CreatePortfolioEvent.onPortfolioCurrencyChanged(String currency) = CreatePortfolioEventOnPortfolioCurrencyChanged;

  factory CreatePortfolioEvent.onSubmit() = CreatePortfolioEventOnSubmit;
}
