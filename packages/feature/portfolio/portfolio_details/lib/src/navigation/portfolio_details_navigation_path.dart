import 'package:common/common.dart';
import 'package:portfolio_details/src/widget/portfolio_details_widget.dart';

class PortfolioDetailsNavigationPath extends NavigationPath {
  PortfolioDetailsNavigationPath()
      : super(
          r'^/portfolio/d+',
          (_, match) => PortfolioDetailsWidget(match ?? ''),
        );
}
