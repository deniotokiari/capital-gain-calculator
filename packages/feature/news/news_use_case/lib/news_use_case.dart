library news_use_case;

export 'src/use_case/get_news_by_tickers_use_case.dart';

import 'package:common/common.dart';
import 'package:news_use_case/src/use_case/get_news_by_tickers_use_case.dart';

class NewsUseCase extends DependencyModule {
  @override
  void init() {
    registerFactory<GetNewsByTickersUseCase>(
      () => GetNewsByTickersUseCase(
        get(),
        get(),
      ),
    );
  }
}
