import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_add_position_state.freezed.dart';

@freezed
class PortfolioAddPositionState with _$PortfolioAddPositionState {
  factory PortfolioAddPositionState.idle({
    required double? count,
    required double? price,
    required DateTime date,
    required bool submitEnabled,
  }) = _PortfolioAddPositionStateIdle;

  factory PortfolioAddPositionState.initial() => PortfolioAddPositionState.idle(
        count: null,
        price: null,
        date: DateTime.now(),
        submitEnabled: false,
      );
}
