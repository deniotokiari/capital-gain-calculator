library news_api;

export 'package:news_list/src/widget/news_list_widget.dart';

import 'package:common/common.dart';
import 'package:news_data/news_data.dart';
import 'package:news_list/news_list.dart';

class NewsApiModule extends DependencyModule {
  @override
  void init() {
    for (var module in [
      NewsDataModule(),
      NewListModule(),
    ]) {
      module.init();
    }
  }
}
