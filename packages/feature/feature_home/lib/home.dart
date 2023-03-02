library feature_home;

import 'package:feature_home/src/create_portfolio/bloc/create_portfolio_bloc.dart';
import 'package:feature_home/src/portfolios_list/bloc/portfolios_list_bloc.dart';
import 'package:usecase_home/home_usecase.dart';
import 'package:utility/utility.dart';

export 'src/widget/home_page.dart';

class FeatureHomeModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerFactory(
      () => CreatePortfolioBloc(
        get(),
        get(),
      ),
    );
    registerFactory(
      () => PortfoliosListBloc(
        GetAllPortfoliosUseCase(get()),
        PortfoliosUpdatesUseCase(get(), get(), get()),
        DeletePortfolioByIdUseCase(get()),
        get(),
      ),
    );
  }
}
