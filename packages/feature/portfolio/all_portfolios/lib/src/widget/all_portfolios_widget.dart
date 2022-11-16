import 'package:all_portfolios/src/bloc/all_portfolios_bloc.dart';
import 'package:all_portfolios/src/bloc/all_portfolios_event.dart';
import 'package:all_portfolios/src/bloc/all_portfolios_state.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';

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
                        Text(
                          '\$${state.model.marketValue.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CurrencyValueWidget(
                            value: state.model.returnValue,
                            currency: '\$',
                            percent: false,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        const Text(
                          '(',
                          style: TextStyle(fontSize: 18),
                        ),
                        CurrencyValueWidget(
                          value: state.model.returnPercent,
                          currency: '',
                          percent: true,
                          style: const TextStyle(fontSize: 18),
                        ),
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
                        title: item.marketValue > 0
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Text(item.name)),
                                  Expanded(
                                    child: Text(
                                      '${item.currency}${item.marketValue.toStringAsFixed(2)}',
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Expanded(
                                    child: CurrencyValueWidget(
                                      value: item.returnValue,
                                      currency: item.currency,
                                      percent: false,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Expanded(
                                    child: CurrencyValueWidget(
                                      value: item.returnPercent,
                                      currency: '',
                                      percent: true,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              )
                            : Text(item.name),
                      );
                    },
                  ),
                ],
              )),
        ),
      );
}
