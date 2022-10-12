import 'package:all_portfolios/src/model/all_portfolios_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_portfolios_state.freezed.dart';

@freezed
class AllPortfoliosState with _$AllPortfoliosState {
  factory AllPortfoliosState.idle(AllPortfoliosViewModel model) = _AllPortfoliosStateIdle;
}
