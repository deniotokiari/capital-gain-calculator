import 'package:feature_symbol_search/src/bloc/symbol_search_bloc.dart';
import 'package:feature_symbol_search/src/bloc/symbol_search_event.dart';
import 'package:feature_symbol_search/src/bloc/symbol_search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utility/utility.dart';

class SymbolSearchWidget extends StatelessWidget {
  SymbolSearchWidget({super.key});

  final Debouncer _debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => get<SymbolSearchBloc>(),
        child: Column(
          children: [
            Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (text) {
                    _debouncer.run(
                      () => context.read<SymbolSearchBloc>().add(SymbolSearchEvent.search(text)),
                    );
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your query',
                  ),
                ),
              );
            }),
            BlocBuilder<SymbolSearchBloc, SymbolSearchState>(
              builder: (context, state) {
                return state.map(
                  loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
                  result: (data) => Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.model.length,
                      itemBuilder: (context, index) {
                        final item = data.model[index];
                        
                        return ListTile(
                            onTap: () => Navigator.of(context).pop(item),
                            title: Text('${item.ticker} - ${item.name} - ${item.region} - ${item.currency.code}'));
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
}
