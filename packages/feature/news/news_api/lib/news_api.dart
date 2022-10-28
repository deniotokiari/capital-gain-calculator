library news_api;

export 'package:news_list/src/widget/news_list_widget.dart';

import 'package:common/common.dart';
import 'package:news_list/news_list.dart';
import 'package:news_use_case/news_use_case.dart';

class NewsApiModule extends DependencyModule {
  @override
  void init() {
    for (var module in [
      NewListModule(),
      NewsUseCaseModule(),
    ]) {
      module.init();
    }
  }
}
