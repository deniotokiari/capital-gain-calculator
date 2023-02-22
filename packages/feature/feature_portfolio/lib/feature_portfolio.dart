library feature_portfolio;

import 'package:feature_portfolio/src/bloc/portfolio_details_bloc.dart';
import 'package:utility/utility.dart';

export 'src/widget/portfolio_details_page.dart';

class FeaturePortfoluiModule extends DependencyModule {
  @override
  Future<void> init() async {
    registerFactory(
      () => PortfolioDetailsBloc(
        get(),
      ),
    );
  }
}
