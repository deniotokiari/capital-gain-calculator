import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/news_api.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_state.dart';
import 'package:portfolio_details/src/widget/portfolio_add_position_widget.dart';
import 'package:portfolio_details/src/widget/portfolio_instrument_positions_widget.dart';
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<PortfolioDetailsBloc, PortfolioDetailsState>(
                  builder: (context, state) => Container(
                    width: double.infinity,
                    color: Colors.blue,
                    padding: const EdgeInsets.all(4),
                    child: Center(
                        child: Text(
                      state.model.portfolioName,
                      style: const TextStyle(inherit: true, color: Colors.white),
                    )),
                  ),
                ),
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
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.model.symbols.length,
                      itemBuilder: ((context, index) {
                        final item = state.model.symbols[index];

                        return ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: ExpansionTile(
                            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                            title: Text(
                                style: const TextStyle(inherit: true, fontSize: 14),
                                '${item.name} - ${item.symbol} - ${item.region} - ${item.currency}'),
                            children: [
                              TextButton(
                                onPressed: () async {
                                  await showDialog(
                                      context: context,
                                      builder: (_) =>
                                          PortfolioAddPositionWidget(item.instrumentId));
                                },
                                child: const Text('+ Add Position'),
                              ),
                              PortfolioInstrumentPositionsWidget(item.instrumentId),
                            ],
                          ),
                        );
                      }),
                    );
                  }),
                ),
                BlocBuilder<PortfolioDetailsBloc, PortfolioDetailsState>(
                  builder: (_, state) {
                    if (state.model.tickers.isEmpty) {
                      return const SizedBox();
                    } else {
                      return NewsListWidget(state.model.tickers);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
