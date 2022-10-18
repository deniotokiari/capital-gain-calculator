import 'package:navigation/navigation.dart';
import 'package:portfolio_details/src/widget/portfolio_details_widget.dart';

class PortfolioDetailsNavigationWidgetBuilder extends NavigationWidgetBuilder {
  PortfolioDetailsNavigationWidgetBuilder()
      : super((_, arguments) => PortfolioDetailsWidget(arguments['id']));
}
