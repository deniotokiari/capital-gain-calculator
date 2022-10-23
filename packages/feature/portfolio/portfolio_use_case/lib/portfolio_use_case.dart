library portfolio_use_case;

export 'src/get_portfolio_instruments_use_case.dart';
export 'src/add_portfolio_symbol_use_case.dart';
export 'src/get_portfolio_instrument_positions_use_case.dart';

import 'package:common/common.dart';
import 'package:portfolio_use_case/src/add_portfolio_symbol_use_case.dart';
import 'package:portfolio_use_case/src/get_portfolio_instrument_positions_use_case.dart';
import 'package:portfolio_use_case/src/get_portfolio_instruments_use_case.dart';

class PortfolioUseCaseModule extends DependencyModule {
  @override
  void init() {
    registerFactory<GetPortfolioInstrumentsUseCase>(
      () => GetPortfolioInstrumentsUseCase(
        get(),
        get(),
        get(),
      ),
    );
    registerFactory<AddPortfolioSymbolUseCase>(
      () => AddPortfolioSymbolUseCase(
        get(),
        get(),
        get(),
      ),
    );
    registerFactory<GetPortfolioInstrumentPositionsUseCase>(
      () => GetPortfolioInstrumentPositionsUseCase(
        get(),
      ),
    );
  }
}
