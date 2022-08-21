import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stock_service/stock_service.dart';

part 'create_portfolio_state.freezed.dart';

@freezed
class CreatePortfolioState with _$CreatePortfolioState {
  factory CreatePortfolioState.idle({
    required bool submitEnabled,
    required List<PhysicalCurrency> listOfCurrency,
    required String portfolioName,
    required PhysicalCurrency? selectedCurrency,
  }) = _CreatePortfolioStateIdle;
}
