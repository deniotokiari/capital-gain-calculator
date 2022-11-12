import 'package:common/common.dart';
import 'package:db/db.dart' as db;
import 'package:physical_currency/physical_currency.dart';
import 'package:portfolio_data/portfolio_data.dart';
import 'package:portfolio_use_case/src/instrument/get_instruments_by_portfolio_id.dart';
import 'package:stock_service/stock_service.dart';

class GetQuotesByPortfolioIdUseCase
    implements
        UseCase<GetQuotesByPortfolioIdUseCaseArguments,
            Future<GetQuotesByPortfolioIdUseCaseResult>> {
  final db.QuoteRepository _quoteRepository;
  final StockServiceApi _stockServiceApi;
  final GetInstrumentsByPortfolioId _getInstrumentsByPortfolioId;
  final GetPhysicalCurrencyByIdUseCase _getPhysicalCurrencyByIdUseCase;

  GetQuotesByPortfolioIdUseCase(
    this._quoteRepository,
    this._stockServiceApi,
    this._getInstrumentsByPortfolioId,
    this._getPhysicalCurrencyByIdUseCase,
  );

  @override
  Future<GetQuotesByPortfolioIdUseCaseResult> execute(
      GetQuotesByPortfolioIdUseCaseArguments args) async {
    final instruments = await _getInstrumentsByPortfolioId
        .execute(args.portfolioId)
        .then((value) => value.where((element) => element.symbol != null));

    final List<Quote> items = [];

    for (final item in instruments) {
      final result = await _getQuoteForSymbol(
        symbol: item.symbol.require,
        force: args.force,
      ).runCatching();

      result.map(
        success: (success) => items.add(success.data),
        failed: (_) {},
      );
    }

    return GetQuotesByPortfolioIdUseCaseResult(items);
  }

  DateTime _parseDateTime(String value) {
    final items = value.split('-');

    return DateTime(
      int.parse(items[0]),
      int.parse(items[1]),
      int.parse(items[2]),
    );
  }

  Future<Quote> _getQuoteForSymbol({
    required Symbol symbol,
    required bool force,
  }) async {
    var fromCache = await _quoteRepository.where((map) => map['symbolId'] == symbol.id);

    if (fromCache.isEmpty || force) {
      final result = await _stockServiceApi.globalQuote(symbol.ticker).runCatching();

      final List<db.Quote> fromRemote = result.map(
        success: (success) => [
          db.Quote(
            symbolId: symbol.id,
            latestTradingDay: _parseDateTime(
              success.data.globalQuote.latestTradingDay,
            ),
            previousClose: db.PhysicalCurrencyValue(
              currencyId: symbol.physicalCurrency.id,
              value: double.parse(success.data.globalQuote.price),
            ),
          )
        ],
        failed: (_) => [],
      );

      if (fromRemote.isNotEmpty) {
        await _quoteRepository.delete(fromCache);
        await _quoteRepository.addAll(fromRemote);

        fromCache = fromRemote;
      }
    }

    return Quote(
      PhysicalCurrencyValue(
        currency: await _getPhysicalCurrencyByIdUseCase.execute(
          fromCache.first.previousClose.currencyId,
        ),
        value: fromCache.first.previousClose.value,
      ),
      symbol,
    );
  }
}

class GetQuotesByPortfolioIdUseCaseArguments {
  final String portfolioId;
  final bool force;

  GetQuotesByPortfolioIdUseCaseArguments({
    required this.portfolioId,
    required this.force,
  });
}

class GetQuotesByPortfolioIdUseCaseResult {
  final List<Quote> quotes;

  GetQuotesByPortfolioIdUseCaseResult(this.quotes);
}

class Quote {
  final Symbol symbol;
  final PhysicalCurrencyValue previousClose;

  Quote(
    this.previousClose,
    this.symbol,
  );
}
