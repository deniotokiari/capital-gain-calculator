library home;

import 'package:home/src/create_portfolio/bloc/create_portfolio_bloc.dart';
import 'package:home/src/portfolios_list/bloc/portfolios_list_bloc.dart';
import 'package:home_usecase/home_usecase.dart';
import 'package:utility/utility.dart';

export 'src/widget/home_page.dart';

class HomeModule extends DependencyModule {
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
        PortfoliosUpdatesUseCase(get()),
      ),
    );
  }
}
