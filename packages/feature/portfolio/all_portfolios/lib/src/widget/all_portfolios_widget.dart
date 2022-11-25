import 'package:all_portfolios/src/bloc/all_portfolios_bloc.dart';
import 'package:all_portfolios/src/bloc/all_portfolios_event.dart';
import 'package:all_portfolios/src/bloc/all_portfolios_state.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';
import 'package:physical_currency/physical_currency.dart';

class AllPortfoliosWidget extends StatelessWidget {
  const AllPortfoliosWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: ((_) => get<AllPortfoliosBloc>()..add(AllPortfoliosEvent.init())),
        child: BlocBuilder<AllPortfoliosBloc, AllPortfoliosState>(
          builder: ((_, state) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        if (state.model.marketValue != null)
                          Text(
                            state.model.marketValue.require.market,
                            style: const TextStyle(fontSize: 18),
                          ),
                        if (state.model.returnValue != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: PhysicalCurrencyValueWidget(
                              currency: state.model.returnValue.require,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        if (state.model.returnPercent != null)
                          const Text(
                            '(',
                            style: TextStyle(fontSize: 18),
                          ),
                        if (state.model.returnPercent != null)
                          PercentValueWidget(
                            value: state.model.returnPercent.require,
                            style: const TextStyle(fontSize: 18),
                          ),
                        if (state.model.returnPercent != null)
                          const Text(
                            ')',
                            style: TextStyle(fontSize: 18),
                          ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.model.portfolios.length,
                    itemBuilder: (_, index) {
                      final item = state.model.portfolios[index];

                      return ListTile(
                          onTap: () {
                            NavigationRoute.portfolio(item.portfolioId).push(context);
                          },
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text(item.name)),
                              if (item.marketValue != null)
                                Expanded(
                                  child: Text(
                                    item.marketValue.require.market,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              if (item.returnValue != null)
                                Expanded(
                                  child: PhysicalCurrencyValueWidget(
                                    currency: item.returnValue.require,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              if (item.returnPercent != null)
                                Expanded(
                                  child: PercentValueWidget(
                                    value: item.returnPercent.require,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                            ],
                          ));
                    },
                  ),
                ],
              )),
        ),
      );
}
