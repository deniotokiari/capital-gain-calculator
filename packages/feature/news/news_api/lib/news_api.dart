library news_api;

import 'package:common/common.dart';
import 'package:news_data/news_data.dart';

class NewsApiModule extends DependencyModule {
  @override
  void init() {
    for (var module in [NewsDataModule()]) {
      module.init();
    }
  }
}
