import 'dart:async';

import 'package:data_market_value/data_market_value.dart';
import 'package:feature_home/src/portfolios_list/bloc/portfolios_list_event.dart';
import 'package:feature_home/src/portfolios_list/bloc/portfolios_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usecase_home/home_usecase.dart';

class PortfoliosListBloc extends Bloc<PortfoliosListEvent, PortfoliosListState> {
  final GetAllPortfoliosUseCase _getAllPortfoliosUseCase;
  final PortfoliosUpdatesUseCase _portfoliosUpdatesUseCase;
  final DeletePortfolioByIdUseCase _deletePortfolioByIdUseCase;
  final MarketValueRepository _marketValueRepository;

  StreamSubscription? _streamSubscription;

  PortfoliosListBloc(
    this._getAllPortfoliosUseCase,
    this._portfoliosUpdatesUseCase,
    this._deletePortfolioByIdUseCase,
    this._marketValueRepository,
  ) : super(PortfoliosListState.initial()) {
    on<PortfoliosListEventInit>((event, emit) async {
      await _streamSubscription?.cancel();
      _streamSubscription = _portfoliosUpdatesUseCase.execute(PortfoliosUpdatesUseCaseArguments()).listen((event) {
        add(PortfoliosListEvent.update());
      });
    });
    on<PortfoliosListEventUpdate>((event, emit) async {
      await _update(emit);
    });
    on<PortfoliosListEventDelete>((event, emit) async {
      await _onDelete(event.id);
    });
  }

  Future<void> _update(dynamic emit) async {
    final model = await _getAllPortfoliosUseCase.execute(GetAllPortfoliosUseCaseArguments());

    emit(state.copyWith(portfolios: [
      ...model.portfolios.map((e) => PortfolioViewModel(
            id: e.id,
            name: e.name,
            marketValue: null,
          ))
    ]));

    emit(
      state.copyWith(
        portfolios: [
          ...await Future.wait(
            model.portfolios.map(
              (e) async => PortfolioViewModel(
                id: e.id,
                name: e.name,
                marketValue: await _marketValueRepository.getPortfolioMarketValue(e.id),
              ),
            ),
          )
        ],
      ),
    );

    emit(state.copyWith(marketValue: await _marketValueRepository.getProfileMarketValue()));
  }

  Future<void> _onDelete(String id) async {
    await _deletePortfolioByIdUseCase.execute(DeletePortfolioByIdUseCaseArguments(id));
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();

    return super.close();
  }
}
