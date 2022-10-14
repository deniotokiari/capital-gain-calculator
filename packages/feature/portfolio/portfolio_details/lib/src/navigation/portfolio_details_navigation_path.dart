import 'package:common/common.dart';
import 'package:portfolio_details/src/widget/portfolio_details_widget.dart';

class PortfolioDetailsNavigationPath extends NavigationPath {
  PortfolioDetailsNavigationPath()
      : super(
          (_, settings) {
            final portfolioId = (settings as Map)['id'] as String;

            return PortfolioDetailsWidget(portfolioId);
          },
        );
}
