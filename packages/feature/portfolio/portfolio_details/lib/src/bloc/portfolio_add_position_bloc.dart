import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_add_position_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_add_position_state.dart';

class PortfolioAddPositionBloc extends Bloc<PortfolioAddPositionEvent, PortfolioAddPositionState> {
  late String _instrumentId;

  PortfolioAddPositionBloc() : super(PortfolioAddPositionState.initial()) {
    on<PortfolioAddPositionEventInit>((event, emit) {
      _instrumentId = event.instrumentId;
    });
    on<PortfolioAddPositionEventSubmit>((event, emit) {});
    on<PortfolioAddPositionEventCountChanged>((event, emit) {});
    on<PortfolioAddPositionEventDateChanged>((event, emit) {});
    on<PortfolioAddPositionEventPriceChanged>((event, emit) {});
  }
}
