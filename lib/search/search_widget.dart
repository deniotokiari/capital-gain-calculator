import 'package:capital_gain_calculator/search/search_bloc.dart';
import 'package:capital_gain_calculator/search/search_event.dart';
import 'package:capital_gain_calculator/search/search_state.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatelessWidget {
  final Debouncer _debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => get<SearchBloc>(),
        child: Column(
          children: [
            Builder(builder: (context) {
              return TextFormField(
                onChanged: (text) {
                  _debouncer.run(
                    () => context.read<SearchBloc>().add(SearchEvent.search(text)),
                  );
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your query',
                ),
              );
            }),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return state.map(
                  initial: (_) => const Text('initial'),
                  loading: (_) => const Text('initial'),
                  result: (data) => Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.result.items.length,
                      itemBuilder: (context, index) {
                        final item = data.result.items[index];
                        return ListTile(
                            onTap: () {
                              Navigator.of(context).pop(item);
                            },
                            title: Text(
                                '${item.symbol} - ${item.name} - ${item.region} - ${item.currency}'));
                      },
                    ),
                  ),
                  error: (_) => const Text('error'),
                );
              },
            )
          ],
        ),
      );
}
