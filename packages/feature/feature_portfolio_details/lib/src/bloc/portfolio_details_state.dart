import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_details_state.freezed.dart';

@freezed
class PortfolioDetailsState with _$PortfolioDetailsState {
  factory PortfolioDetailsState.loading() = _PortfolioDetailsStateLoading;

  factory PortfolioDetailsState.error(String message) = _PortfolioDetailsStateError;

  factory PortfolioDetailsState.idle(PortfolioDetailsViewModel model) = _PortfolioDetailsStateIdle;
}

class PortfolioDetailsViewModel {
  final List<PortfolioDetailsViewModelItem> items;

  PortfolioDetailsViewModel({
    required this.items,
  });
}

@freezed
class PortfolioDetailsViewModelItem with _$PortfolioDetailsViewModelItem {
  factory PortfolioDetailsViewModelItem.instrument(String instrumentId) = PortfolioDetailsViewModelItemInstrument;

  factory PortfolioDetailsViewModelItem.news(List<PortfolioDetailsViewModelItemNewsItem> news) = PortfolioDetailsViewModelItemNews;

  factory PortfolioDetailsViewModelItem.newsHeader() = PortfolioDetailsViewModelItemNewsHeader;

  factory PortfolioDetailsViewModelItem.addSymbol() = PortfolioDetailsViewModelItemAddSymbol;
}

class PortfolioDetailsViewModelItemNewsItem {}
