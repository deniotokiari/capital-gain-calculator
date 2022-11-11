library portfolio_use_case;

export 'src/portfolio/get_all_portfolios_use_case.dart';
export 'src/portfolio/portfolios_updates_use_case.dart';
export 'src/portfolio/create_portfolio_use_case.dart';
export 'src/position/add_position_use_case.dart';
export 'src/position/get_positions_by_instrument_id_use_case.dart';
export 'src/position/instrument_positions_updates_use_case.dart';
export 'src/portfolio/get_portfolio_name_by_id_use_case.dart';
export 'src/instrument/add_symbol_instrument_use_case.dart';
export 'src/instrument/get_instruments_by_portfolio_id.dart';
export 'src/instrument/get_instrument_total_shares_use_case.dart';
export 'src/instrument/get_instrument_average_price_use_case.dart';
export 'src/quote/get_quotes_by_portfolio_id_use_case.dart';

import 'package:common/common.dart';
import 'package:portfolio_use_case/src/instrument/add_symbol_instrument_use_case.dart';
import 'package:portfolio_use_case/src/instrument/get_instrument_average_price_use_case.dart';
import 'package:portfolio_use_case/src/instrument/get_instrument_total_shares_use_case.dart';
import 'package:portfolio_use_case/src/instrument/get_instruments_by_portfolio_id.dart';
import 'package:portfolio_use_case/src/portfolio/create_portfolio_use_case.dart';
import 'package:portfolio_use_case/src/portfolio/get_all_portfolios_use_case.dart';
import 'package:portfolio_use_case/src/portfolio/get_portfolio_name_by_id_use_case.dart';
import 'package:portfolio_use_case/src/portfolio/portfolios_updates_use_case.dart';
import 'package:portfolio_use_case/src/position/add_position_use_case.dart';
import 'package:portfolio_use_case/src/position/get_positions_by_instrument_id_use_case.dart';
import 'package:portfolio_use_case/src/position/instrument_positions_updates_use_case.dart';
import 'package:portfolio_use_case/src/quote/get_quotes_by_portfolio_id_use_case.dart';
import 'package:portfolio_use_case/src/symbol/get_symbol_by_id_use_case.dart';

class PortfolioUseCaseModule extends DependencyModule {
  @override
  void init() {
    registerFactory<GetAllPortfoliosUseCase>(
      () => GetAllPortfoliosUseCase(
        get(),
        get(),
      ),
    );
    registerFactory<PortfoliosUpdatesUseCase>(
      () => PortfoliosUpdatesUseCase(
        get(),
        get(),
      ),
    );
    registerFactory<CreatePortfolioUseCase>(
      () => CreatePortfolioUseCase(
        get(),
      ),
    );
    registerFactory<GetPortfolioNameByIdUseCase>(
      () => GetPortfolioNameByIdUseCase(
        get(),
      ),
    );
    registerFactory<AddPositionUseCase>(
      () => AddPositionUseCase(
        get(),
      ),
    );
    registerFactory<GetPositionsByInstrumentIdUseCase>(
      () => GetPositionsByInstrumentIdUseCase(
        get(),
        get(),
      ),
    );
    registerFactory<InstrumentPositionsUpdatesUseCase>(
      () => InstrumentPositionsUpdatesUseCase(
        get(),
        get(),
      ),
    );
    registerFactory<AddSymbolInstrumentUseCase>(
      () => AddSymbolInstrumentUseCase(
        get(),
        get(),
        get(),
      ),
    );
    registerFactory<GetSymbolByIdUseCase>(
      () => GetSymbolByIdUseCase(
        get(),
        get(),
      ),
    );
    registerFactory<GetInstrumentsByPortfolioId>(
      () => GetInstrumentsByPortfolioId(
        get(),
        get(),
        get(),
        get(),
      ),
    );
    registerFactory<GetInstrumentTotalSharesUseCase>(
      () => GetInstrumentTotalSharesUseCase(
        get(),
      ),
    );
    registerFactory<GetInstrumentAveragePriceUseCase>(
      () => GetInstrumentAveragePriceUseCase(
        get(),
      ),
    );
    registerFactory<GetQuotesByPortfolioIdUseCase>(
      () => GetQuotesByPortfolioIdUseCase(
        get(),
        get(),
        get(),
        get(),
      ),
    );
  }
}
