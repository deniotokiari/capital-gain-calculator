/*import 'package:capital_gain_calculator/portfolio/portfolio_bloc.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_event.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_repository.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_state.dart';
import 'package:capital_gain_calculator/search/search_state.dart';
import 'package:capital_gain_calculator/search/search_widget.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Capital Gain Calculator'),
        ),
        body: BlocProvider<PortfolioBloc>(
          create: (_) => get<PortfolioBloc>(
            param1: ModalRoute.of(context)?.settings.arguments as Portfolio,
          )..add(PortfolioEvent.init()),
          child: Column(
            children: [
              BlocBuilder<PortfolioBloc, PortfolioState>(
                  builder: ((context, state) => Text(state.portfolio.title))),
              Builder(
                builder: ((context) => TextButton(
                      onPressed: () async {
                        await showModalBottomSheet<SearchResultItem?>(
                          context: context,
                          builder: (context) => SearchWidget(),
                        ).then((value) {
                          if (value != null) {
                            context.read<PortfolioBloc>().add(PortfolioEvent.addSymbol(value));
                          }
                        });
                      },
                      child: const Text('+ Add Symbol'),
                    )),
              ),
              BlocBuilder<PortfolioBloc, PortfolioState>(
                builder: ((context, state) {
                  return Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.symbols.length,
                      itemBuilder: ((context, index) {
                        final item = state.symbols[index];

                        return ListTile(
                          title: Text('${item.symbol} - ${item.name} - ${item.type} - ${item.region} - ${item.currency}'),
                        );
                      }),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      );
}
*/
