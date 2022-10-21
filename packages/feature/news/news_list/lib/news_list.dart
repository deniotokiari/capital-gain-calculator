library news_list;

export 'src/widget/news_list_widget.dart';

import 'package:common/common.dart';
import 'package:news_list/src/bloc/news_list_bloc.dart';

class NewListModule extends DependencyModule {
  @override
  void init() {
    registerFactory<NewsListBloc>(
      () => NewsListBloc(
        get(),
      ),
    );
  }
}
