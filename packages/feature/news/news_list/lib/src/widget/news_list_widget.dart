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
              _getNewsHeader(context, state),
              _getNewsListOrEmpty(state),
            ],
          ),
        ),
      );

  Widget _getNewsHeader(BuildContext context, NewsListState state) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      padding: const EdgeInsets.all(4),
      child: Center(
        child: state.model.loading
            ? Text(
                state.model.newsHeader,
                style: const TextStyle(
                  inherit: true,
                  color: Colors.white,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.model.newsHeader,
                    style: const TextStyle(
                      inherit: true,
                      color: Colors.white,
                    ),
                  ),
                  state.model.refreshing
                      ? const Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : IconButton(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          iconSize: 20,
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.only(left: 4),
                          onPressed: () {
                            context.read<NewsListBloc>().add(NewsListEvent.refresh());
                          },
                          tooltip: 'Refresh',
                          icon: const Icon(Icons.refresh, color: Colors.white),
                        ),
                ],
              ),
      ),
    );
  }

  Widget _getNewsListOrEmpty(NewsListState state) {
    if (state.model.loading) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: CircularProgressIndicator.adaptive(),
      );
    } else if (state.model.news.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('No news for ${_tickers.join(', ')}'),
      );
    } else {
      return ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.model.news.length,
        itemBuilder: (_, index) => _getNewsItem(
          state,
          index,
          state.model.news[index],
        ),
      );
    }
  }

  Widget _getNewsItem(NewsListState state, int index, dynamic item) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      onTap: () {},
      title: Flexible(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getHeader(state, index),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      inherit: true,
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    item.summary,
                    style: const TextStyle(inherit: true, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getHeader(NewsListState state, int index) {
    final previous = (index - 1 < 0) ? null : state.model.news[index - 1];
    final current = state.model.news[index];
    final showHeader = previous?.ticker != current.ticker;

    if (showHeader) {
      return Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 113, 55, 70),
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(bottom: 2),
        child: Center(
          child: Text(
            current.ticker,
            style: const TextStyle(
              inherit: true,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
