library feature_portfolio_details;

import 'package:feature_portfolio_details/src/bloc/portfolio_details_bloc.dart';
import 'package:feature_portfolio_details/src/instrument/add_position/bloc/add_position_bloc.dart';
import 'package:feature_portfolio_details/src/instrument/bloc/instrument_bloc.dart';
import 'package:usecase_portfolio_details/usecase_portfolio_details.dart';
import 'package:utility/utility.dart';

export 'src/widget/portfolio_details_page.dart';

class FeaturePortfoluiModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerFactory(
      () => PortfolioDetailsBloc(
        get(),
        get(),
        AddSymbolToPortfolioUseCase(get(), get()),
        InstrumentsUpdatesUseCase(get()),
      ),
    );
    registerFactory(
      () => InstrumentBloc(
        GetSymbolByInstrumentIdUseCase(get(), get()),
        get(),
        get(),
      ),
    );
    registerFactory(
      () => AddPositionBloc(
        get(),
        get(),
        GetSymbolByInstrumentIdUseCase(get(), get()),
      ),
    );
  }
}
