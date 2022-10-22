import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/src/bloc/news_list_bloc.dart';
import 'package:news_list/src/bloc/news_list_event.dart';
import 'package:news_list/src/bloc/news_list_state.dart';

class NewsListWidget extends StatelessWidget {
  final List<String> _tickers;

  const NewsListWidget(
    this._tickers, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => get<NewsListBloc>()..add(NewsListEvent.init(_tickers)),
        child: BlocBuilder<NewsListBloc, NewsListState>(
          builder: (context, state) => Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.blue,
                padding: const EdgeInsets.all(4),
                child: const Center(
                    child: Text(
                  'News',
                  style: TextStyle(inherit: true, color: Colors.white),
                )),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.model.news.length,
                itemBuilder: (_, index) {
                  final item = state.model.news[index];

                  return ListTile(
                    onTap: () {},
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                              inherit: true, fontWeight: FontWeight.w900, fontSize: 13),
                        ),
                        Text(
                          item.summary,
                          style: const TextStyle(inherit: true, fontSize: 13),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
}
