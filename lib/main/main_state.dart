
import 'package:capital_gain_calculator/portfolio/portfolio_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  factory MainState.idle(List<Portfolio> portfolios) = _MainStateIdle;
	
}
