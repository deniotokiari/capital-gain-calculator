import 'package:capital_gain_calculator/portfolio/portfolio_event.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc() : super(PortfolioState.idle(null, [])) {
    on<PortfolioEventInit>(((event, emit) {}));
  }
}
