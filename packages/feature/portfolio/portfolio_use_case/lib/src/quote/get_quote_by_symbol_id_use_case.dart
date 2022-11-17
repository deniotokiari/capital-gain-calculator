import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';

class GetQuoteBySymbolIdUseCase
    implements
        UseCase<GetQuoteBySymbolIdUseCaseArguments, Future<GetQuoteBySymbolIdUseCaseResult>> {
  final db.QuoteRepository _quoteRepository;
  final GetPhysicalCurrencyByIdUseCase _getPhysicalCurrencyByIdUseCase;

  GetQuoteBySymbolIdUseCase(
    this._quoteRepository,
    this._getPhysicalCurrencyByIdUseCase,
  );

  @override
  Future<GetQuoteBySymbolIdUseCaseResult> execute(GetQuoteBySymbolIdUseCaseArguments args) async {
    final quote = await _quoteRepository.where((map) => map['symbolId'] == args.symbolId);

    return GetQuoteBySymbolIdUseCaseResult(
      GetQuoteBySymbolIdUseCaseResultQuote(
        PhysicalCurrencyValue(
          value: quote.first.previousClose.value,
          currency: await _getPhysicalCurrencyByIdUseCase.execute(
            quote.first.previousClose.currencyId,
          ),
        ),
      ),
    );
  }
}

class GetQuoteBySymbolIdUseCaseArguments {
  final String symbolId;

  GetQuoteBySymbolIdUseCaseArguments({required this.symbolId});
}

class GetQuoteBySymbolIdUseCaseResult {
  final GetQuoteBySymbolIdUseCaseResultQuote quote;

  GetQuoteBySymbolIdUseCaseResult(this.quote);
}

class GetQuoteBySymbolIdUseCaseResultQuote {
  final PhysicalCurrencyValue previousClose;

  GetQuoteBySymbolIdUseCaseResultQuote(this.previousClose);
}
