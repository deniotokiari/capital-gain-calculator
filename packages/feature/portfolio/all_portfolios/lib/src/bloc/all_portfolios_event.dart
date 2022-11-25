import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_portfolios_event.freezed.dart';

@freezed
class AllPortfoliosEvent with _$AllPortfoliosEvent {
  factory AllPortfoliosEvent.init() = AllPortfoliosEventInit;

  factory AllPortfoliosEvent.refresh() = AllPortfoliosEventRefresh;
}
