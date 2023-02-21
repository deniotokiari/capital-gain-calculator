import 'package:portfolio/portfolio.dart';
import 'package:utility/utility.dart';

class PortfoliosUpdatesUseCase extends UseCase<PortfoliosUpdatesUseCaseArguments, Stream<PortfoliosUpdatesUseCaseResult>> {
  final PortfolioRepository _portfolioRepository;

  PortfoliosUpdatesUseCase(this._portfolioRepository);

  @override
  Stream<PortfoliosUpdatesUseCaseResult> execute(PortfoliosUpdatesUseCaseArguments arg) =>
      _portfolioRepository.updates().map((event) => PortfoliosUpdatesUseCaseResult([...event.map((e) => e.name)]));
}

class PortfoliosUpdatesUseCaseArguments {}

class PortfoliosUpdatesUseCaseResult {
  List<String> portfolios;

  PortfoliosUpdatesUseCaseResult(this.portfolios);
}
