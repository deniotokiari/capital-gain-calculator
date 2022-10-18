import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_state.dart';

class PortfolioDetailsBloc extends Bloc<PortfolioDetailsEvent, PortfolioDetailsState> {
  PortfolioDetailsBloc() : super(PortfolioDetailsState.idle()) {
    on<PortfolioDetailsEventInit>((event, emit) {});
  }
}
