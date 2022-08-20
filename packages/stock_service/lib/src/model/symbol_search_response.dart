abstract class SymbolSearchResponse {
  abstract final List<SymbolSearchMatch> bestMatches;
}

abstract class SymbolSearchMatch {
  abstract final String symbol;
  abstract final String name;
  abstract final String type;
  abstract final String region;
  abstract final String marketOpen;
  abstract final String marketClose;
  abstract final String currency;
  abstract final String matchScore;
}
