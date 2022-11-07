abstract class GlobalQuoteContainerResponse {
  abstract final GlobalQuote globalQuote;
}

abstract class GlobalQuote {
  abstract final String symbol;
  abstract final String open;
  abstract final String high;
  abstract final String low;
  abstract final String price;
  abstract final String volume;
  abstract final String latestTradingDay;
  abstract final String previousClose;
  abstract final String change;
  abstract final String changePercent;
}
