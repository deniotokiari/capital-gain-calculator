import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_details/src/portfolio_details_instrument/portfolio_details_instrument_view_model.dart';

part 'portfolio_details_instrument_state.freezed.dart';

@freezed
class PortfolioDetailsInstrumentState with _$PortfolioDetailsInstrumentState {
  factory PortfolioDetailsInstrumentState.idle(PortfolioDetailsInstrumentViewModel viewModel) =
      _PortfolioDetailsInstrumentStateIdle;
}
