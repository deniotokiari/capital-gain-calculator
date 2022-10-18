import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symbol_search/src/bloc/symbol_search_bloc.dart';
import 'package:symbol_search/src/bloc/symbol_search_event.dart';
import 'package:symbol_search/src/bloc/symbol_search_state.dart';
import 'package:symbol_search/src/model/symbol_search_view_model.dart';

class SymbolSearchWidget extends StatelessWidget {
  final Debouncer _debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  SymbolSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => get<SymbolSearchBloc>(),
        child: Column(
          children: [
            Builder(builder: (context) {
              return TextFormField(
                onChanged: (text) {
                  _debouncer.run(
                    () => context.read<SymbolSearchBloc>().add(SymbolSearchEvent.search(text)),
                  );
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your query',
                ),
              );
            }),
            BlocBuilder<SymbolSearchBloc, SymbolSearchState>(
              builder: (context, state) {
                return state.map(
                  initial: (_) => const Text('initial'),
                  loading: (_) => const Text('loading'),
                  result: (data) => Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.result.symbols.length,
                      itemBuilder: (context, index) {
                        final item = data.result.symbols[index];
                        return ListTile(
                            onTap: () {
                              Navigator.of(context).pop(
                                NavigationResult.ok(
                                  data: SymbolSearchWidgetNavigationResult
                                      .fromSymbolSearchViewModelItem(item),
                                ),
                              );
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

class SymbolSearchWidgetNavigationResult {
  final String name;
  final String symbol;
  final String region;
  final String currency;

  SymbolSearchWidgetNavigationResult(
    this.name,
    this.symbol,
    this.region,
    this.currency,
  );

  factory SymbolSearchWidgetNavigationResult.fromSymbolSearchViewModelItem(
          SymbolSearchViewModelItem item) =>
      SymbolSearchWidgetNavigationResult(
        item.name,
        item.symbol,
        item.region,
        item.currency,
      );
}
