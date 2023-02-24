import 'package:data_currency/currency.dart';
import 'package:data_position/data_position.dart';
import 'package:feature_portfolio_details/src/instrument/add_position/bloc/add_position_event.dart';
import 'package:feature_portfolio_details/src/instrument/add_position/bloc/add_position_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usecase_portfolio_details/usecase_portfolio_details.dart';

class AddPositionBloc extends Bloc<AddPositionEvent, AddPositionState> {
  final CurrencyListRepository _currencyListRepository;
  final PositionRepository _positionRepository;
  final GetSymbolByInstrumentIdUseCase _getSymbolByInstrumentIdUseCase;

  late String _instrumentId;
  final List<Currency> _currencyList = [];

  AddPositionBloc(
    this._currencyListRepository,
    this._positionRepository,
    this._getSymbolByInstrumentIdUseCase,
  ) : super(AddPositionState.idle(
          price: null,
          currency: null,
          count: null,
          date: DateTime.now(),
          currencyList: [],
          submitEnabled: false,
        )) {
    on<AddPositionEventInit>((event, emit) async {
      _instrumentId = event.instrumentId;

      _currencyList.addAll(await _currencyListRepository.getCurrencyList());

      final symbol = await _getSymbolByInstrumentIdUseCase
          .execute(GetSymbolByInstrumentIdUseCaseArguments(instrumentId: _instrumentId))
          .then((value) => value.symbol);

      emit(state.copyWith(
        currencyList: _currencyList.formatted,
        currency: _currencyList.firstWhere((element) => symbol.currency == element).formatted,
      ));
    });
    on<AddPositionEventSubmit>((event, emit) async {
      final count = double.parse(state.count!);
      final currency = _currencyList.firstWhere((element) => state.currency!.contains(element.code));

      await _positionRepository.add(Position(
        instrumentId: _instrumentId,
        count: count,
        price: CurrencyValue(value: double.parse(state.price!), currency: currency),
        date: state.date,
      ));
    });
    on<AddPositionEventCurrencyChanged>((event, emit) {
      emit(state.copyWith(
        submitEnabled: _isSubmitEnabled(count: state.count, price: state.price, currency: event.currency),
        currency: event.currency,
      ));
    });
    on<AddPositionEventPriceChanged>((event, emit) {
      emit(state.copyWith(
        submitEnabled: _isSubmitEnabled(count: state.count, price: event.price, currency: state.currency),
        price: event.price,
      ));
    });
    on<AddPositionEventCountChanged>((event, emit) {
      emit(state.copyWith(
        submitEnabled: _isSubmitEnabled(count: event.count, price: state.price, currency: state.currency),
        count: event.count,
      ));
    });
    on<AddPositionEventDateChanged>((event, emit) {
      emit(state.copyWith(date: event.date));
    });
  }

  bool _isSubmitEnabled({
    required String? count,
    required String? price,
    required String? currency,
  }) {
    return count != null && double.tryParse(count) != null && price != null && double.tryParse(price) != null && currency != null;
  }
}
