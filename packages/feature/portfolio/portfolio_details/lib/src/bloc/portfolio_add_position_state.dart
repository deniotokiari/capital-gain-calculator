import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_machine/time_machine.dart';

part 'portfolio_add_position_state.freezed.dart';

@freezed
class PortfolioAddPositionState with _$PortfolioAddPositionState {
  factory PortfolioAddPositionState.idle({
    required double? count,
    required double? price,
    required LocalDate date,
    required bool submitEnabled,
  }) = _PortfolioAddPositionStateIdle;

  factory PortfolioAddPositionState.initial() => PortfolioAddPositionState.idle(
        count: null,
        price: null,
        date: LocalDate.today(),
        submitEnabled: false,
      );
}
