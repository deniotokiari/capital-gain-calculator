import 'package:data_portfolio/portfolio.dart';
import 'package:utility/utility.dart';

class GetAllPortfoliosUseCase extends UseCase<GetAllPortfoliosUseCaseArguments, Future<GetAllPortfoliosUseCaseResult>> {
  final PortfolioRepository _portfolioRepository;

  GetAllPortfoliosUseCase(
    this._portfolioRepository,
  );

  @override
  Future<GetAllPortfoliosUseCaseResult> execute(GetAllPortfoliosUseCaseArguments arg) async {
    final portfolios = await _portfolioRepository.all();

    return GetAllPortfoliosUseCaseResult([
      ...portfolios.map(
        (e) => GetAllPortfoliosUseCaseResultPortfolio(
          id: e.id,
          name: e.name,
        ),
      )
    ]);
  }
}

class GetAllPortfoliosUseCaseArguments {}

class GetAllPortfoliosUseCaseResult {
  final List<GetAllPortfoliosUseCaseResultPortfolio> portfolios;

  GetAllPortfoliosUseCaseResult(this.portfolios);
}

class GetAllPortfoliosUseCaseResultPortfolio {
  final String id;
  final String name;

  GetAllPortfoliosUseCaseResultPortfolio({
    required this.id,
    required this.name,
  });
}
