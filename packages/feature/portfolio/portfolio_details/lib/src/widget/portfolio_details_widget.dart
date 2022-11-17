import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/news_api.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_state.dart';
import 'package:portfolio_details/src/portfolio_details_header/portfolio_details_header_widget.dart';
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
                  builder: (context, state) => PortfolioDetailsHeaderWidget(_portfolioId)/*Container(
                    width: double.infinity,
                    color: Colors.blue,
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.model.portfolioName,
                          style: const TextStyle(inherit: true, color: Colors.white),
                        ),
                        state.model.marketPrice != 0
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Row(
                                  children: [
                                    Text(
                                      '${state.model.currency}${state.model.marketPrice.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        inherit: true,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        color:
                                            state.model.returnValue > 0 ? Colors.green : Colors.red,
                                        child: Text(
                                          '${state.model.returnValue > 0 ? '+' : '-'}${state.model.currency}${state.model.returnValue.abs().toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            inherit: true,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        color: state.model.returnPercent > 0
                                            ? Colors.green
                                            : Colors.red,
                                        child: Text(
                                          '${state.model.returnPercent > 0 ? '+' : ''}${(state.model.returnPercent * 100).toStringAsFixed(2)}%',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            inherit: true,
                                            color: Colors.white,
                                          ),
                                        ),
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
                                              context
                                                  .read<PortfolioDetailsBloc>()
                                                  .add(PortfolioDetailsEvent.refresh());
                                            },
                                            tooltip: 'Refresh',
                                            icon: const Icon(Icons.refresh, color: Colors.white),
                                          ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )*/,
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
                            title: _getInstrumentText(
                              ticker: item.ticker,
                              currency: item.currency,
                              marketValue: item.marketValue,
                              returnValue: item.returnValue,
                              returnPercent: item.returnPercent,
                            ),
                            children: [
                              PortfolioInstrumentPositionsWidget(item.instrumentId),
                              TextButton(
                                onPressed: () async {
                                  await showDialog(
                                      context: context,
                                      builder: (_) =>
                                          PortfolioAddPositionWidget(item.instrumentId));
                                },
                                child: const Text('+ Add Position'),
                              ),
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

  Widget _getInstrumentText({
    required String ticker,
    required String currency,
    required double marketValue,
    required double returnValue,
    required double returnPercent,
  }) {
    final tickerWidget = Expanded(
        child: Text(
      ticker,
      style: const TextStyle(inherit: true, fontSize: 14),
    ));

    if (returnValue != 0 && returnPercent != 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tickerWidget,
          Expanded(
            child: Text(
              '$currency${marketValue.toStringAsFixed(2)}',
              style: const TextStyle(
                inherit: true,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: CurrencyValueWidget(
              currency: currency,
              value: returnValue,
              percent: false,
              style: const TextStyle(
                inherit: true,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: CurrencyValueWidget(
              currency: '',
              value: returnPercent,
              percent: true,
              style: const TextStyle(
                inherit: true,
                fontSize: 14,
              ),
            ),
          ),
        ],
      );
    } else {
      return tickerWidget;
    }
  }
}
