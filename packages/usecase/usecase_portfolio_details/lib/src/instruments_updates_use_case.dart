import 'package:data_instrument/data_instrument.dart';
import 'package:store/common/query.dart';
import 'package:utility/utility.dart';

class InstrumentsUpdatesUseCase extends UseCase<InstrumentsUpdatesUseCaseArguments, Stream<InstrumentsUpdatesUseCaseResult>> {
  final InstrumentRepository _instrumentRepository;

  InstrumentsUpdatesUseCase(this._instrumentRepository);

  @override
  Stream<InstrumentsUpdatesUseCaseResult> execute(InstrumentsUpdatesUseCaseArguments arg) => _instrumentRepository.updates([
        Query('portfolio_id', isEqualTo: arg.portfolioId),
      ]).map(
        (event) => InstrumentsUpdatesUseCaseResult(),
      );
}

class InstrumentsUpdatesUseCaseArguments {
  final String portfolioId;

  InstrumentsUpdatesUseCaseArguments({required this.portfolioId});
}

class InstrumentsUpdatesUseCaseResult {}
