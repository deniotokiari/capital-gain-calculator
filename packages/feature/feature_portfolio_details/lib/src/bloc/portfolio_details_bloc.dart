import 'dart:async';

import 'package:data_instrument/data_instrument.dart';
import 'package:data_portfolio/portfolio.dart';
import 'package:feature_portfolio_details/src/bloc/portfolio_details_event.dart';
import 'package:feature_portfolio_details/src/bloc/portfolio_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/store.dart';
import 'package:usecase_portfolio_details/usecase_portfolio_details.dart';

class PortfolioDetailsBloc extends Bloc<PortfolioDetailsEvent, PortfolioDetailsState> {
  final PortfolioRepository _portfolioRepository;
  final InstrumentRepository _instrumentRepository;
  final AddSymbolToPortfolioUseCase _addSymbolToPortfolioUseCase;
  final InstrumentsUpdatesUseCase _instrumentsUpdatesUseCase;

  late Portfolio _portfolio;

  StreamSubscription? _streamSubscription;

  PortfolioDetailsBloc(
    this._portfolioRepository,
    this._instrumentRepository,
    this._addSymbolToPortfolioUseCase,
    this._instrumentsUpdatesUseCase,
  ) : super(PortfolioDetailsState.loading()) {
    on<PortfolioDetailsEventInit>((event, emit) async {
      Portfolio? portfolio;

      try {
        portfolio = await _portfolioRepository.get(event.id);
      } catch (_) {
        // NOP
      }

      if (portfolio == null) {
        emit(PortfolioDetailsState.error('Portfolio with id "${event.id}" not found'));
      } else {
        _portfolio = portfolio;
        await _update(portfolio, emit);

        await _streamSubscription?.cancel();
        _streamSubscription = _instrumentsUpdatesUseCase
            .execute(InstrumentsUpdatesUseCaseArguments(
          portfolioId: portfolio.id,
        ))
            .listen((event) {
          add(PortfolioDetailsEvent.updateInatruments());
        });
      }
    });
    on<PortfolioDetailsEventAddSymbol>((event, emit) async {
      await _addSymbolToPortfolioUseCase.execute(AddSymbolToPortfolioUseCaseArguments(
        portfolioId: _portfolio.id,
        symbol: event.symbol,
      ));
    });
    on<PortfolioDetailsEventUpdateInatruments>((event, emit) async {
      await _update(_portfolio, emit);
    });
  }

  Future<void> _update(Portfolio portfolio, dynamic emit) async {
    final instruments = await _instrumentRepository.all([
      Query('portfolio_id', isEqualTo: portfolio.id),
    ]).then(
      (value) => value.map((e) => PortfolioDetailsViewModelItem.instrument(e.id)),
    );
    emit(
      PortfolioDetailsState.idle(
        PortfolioDetailsViewModel(
          portfolioName: portfolio.name,
          items: [
            ...instruments,
          ],
        ),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();

    return super.close();
  }
}
