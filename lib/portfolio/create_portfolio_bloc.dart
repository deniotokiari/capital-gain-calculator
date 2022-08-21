import 'package:capital_gain_calculator/portfolio/create_portfolio_event.dart';
import 'package:capital_gain_calculator/portfolio/create_portfolio_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePortfolioBloc extends Bloc<CreatePortfolioEvent, CreatePortfolioState> {
  CreatePortfolioBloc()
      : super(
          CreatePortfolioState.idle(
            submitEnabled: false,
            listOfCurrency: [],
          ),
        ) {
    on<CreatePortfolioEventInit>((event, emit) {});
    on<CreatePortfolioEventCancel>((event, emit) {});
    on<CreatePortfolioEventCurrencySelected>((event, emit) {});
    on<CreatePortfolioEventPortfolioNameChanged>((event, emit) {});
    on<CreatePortfolioEventSubmit>((event, emit) {});
  }
}
