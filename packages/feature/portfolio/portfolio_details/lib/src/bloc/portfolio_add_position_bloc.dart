import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_add_position_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_add_position_state.dart';
import 'package:portfolio_use_case/portfolio_use_case.dart';

class PortfolioAddPositionBloc extends Bloc<PortfolioAddPositionEvent, PortfolioAddPositionState> {
  final AddPositionUseCase _addPositionUseCase;

  late String _instrumentId;

  void _validateState(Emitter<PortfolioAddPositionState> emit) {
    final count = state.count;
    final price = state.price;

    final submitEnabled = count != null && count > 0 && price != null && price > 0;

    emit(state.copyWith(submitEnabled: submitEnabled));
  }

  PortfolioAddPositionBloc(
    this._addPositionUseCase,
  ) : super(PortfolioAddPositionState.initial()) {
    on<PortfolioAddPositionEventInit>((event, emit) {
      _instrumentId = event.instrumentId;
    });
    on<PortfolioAddPositionEventSubmit>((event, emit) async {
      await _addPositionUseCase.execute(AddPositionUseCaseArguments(
        instrumentId: _instrumentId,
        count: state.count.require,
        price: state.price.require,
        date: state.date,
      ));
    });
    on<PortfolioAddPositionEventCountChanged>((event, emit) {
      emit(state.copyWith(count: event.count));

      _validateState(emit);
    });
    on<PortfolioAddPositionEventDateChanged>((event, emit) {
      emit(state.copyWith(date: event.date));
    });
    on<PortfolioAddPositionEventPriceChanged>((event, emit) {
      emit(state.copyWith(price: event.price));

      _validateState(emit);
    });
  }
}
