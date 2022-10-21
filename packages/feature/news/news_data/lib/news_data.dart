library news_data;

export 'src/model/news_feed.dart';
export 'src/repository/news_repository.dart';

import 'package:common/common.dart';
import 'package:news_data/src/repository/news_repository.dart';

class NewsDataModule extends DependencyModule {
  @override
  void init() {
    registerLazySingleton<NewsRepository>(
      () => NewsRepository(
        get(),
      ),
    );
  }
}
