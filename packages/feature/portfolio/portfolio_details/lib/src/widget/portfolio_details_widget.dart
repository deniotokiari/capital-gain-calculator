import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_state.dart';
import 'package:symbol_api/symbol_api.dart';

class PortfolioDetailsWidget extends StatelessWidget {
  final String _portfolioId;

  const PortfolioDetailsWidget(this._portfolioId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Capital Gain Calculator'),
        ),
        body: BlocProvider<PortfolioDetailsBloc>(
          create: (_) => get<PortfolioDetailsBloc>()..add(PortfolioDetailsEvent.init(_portfolioId)),
          child: Column(
            children: [
              BlocBuilder<PortfolioDetailsBloc, PortfolioDetailsState>(
                  builder: ((context, state) => Text(state.model.portfolioName))),
              Builder(
                builder: ((context) => TextButton(
                      onPressed: () async {
                        await showModalBottomSheet<NavigationResult>(
                          context: context,
                          builder: (context) => SymbolSearchWidget(),
                        ).then((value) {
                          value?.map(
                            ok: (ok) {
                              context
                                  .read<PortfolioDetailsBloc>()
                                  .add(PortfolioDetailsEvent.addSymbol(ok.data));
                            },
                            cancel: (_) {},
                          );
                        });
                      },
                      child: const Text('+ Add Symbol'),
                    )),
              ),
              BlocBuilder<PortfolioDetailsBloc, PortfolioDetailsState>(
                builder: ((context, state) {
                  return Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.model.symbols.length,
                      itemBuilder: ((context, index) {
                        final item = state.model.symbols[index];

                        return ListTile(
                          title: Text(
                              '${item.name} - ${item.symbol} - ${item.region} - ${item.currency}'),
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
