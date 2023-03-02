import 'package:data_portfolio/portfolio.dart';
import 'package:utility/utility.dart';

class DeletePortfolioByIdUseCase extends UseCase<DeletePortfolioByIdUseCaseArguments, Future<DeletePortfolioByIdUseCaseResult>> {
  final PortfolioRepository _portfolioRepository;

  DeletePortfolioByIdUseCase(this._portfolioRepository);

  @override
  Future<DeletePortfolioByIdUseCaseResult> execute(DeletePortfolioByIdUseCaseArguments arg) =>
      _portfolioRepository.delete(arg.id).then((value) => DeletePortfolioByIdUseCaseResult());
}

class DeletePortfolioByIdUseCaseArguments {
  final String id;

  DeletePortfolioByIdUseCaseArguments(this.id);
}

class DeletePortfolioByIdUseCaseResult {}
