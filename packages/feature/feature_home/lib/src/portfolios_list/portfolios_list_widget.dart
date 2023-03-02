import 'package:feature_home/src/portfolios_list/bloc/portfolios_list_bloc.dart';
import 'package:feature_home/src/portfolios_list/bloc/portfolios_list_event.dart';
import 'package:feature_home/src/portfolios_list/bloc/portfolios_list_state.dart';
import 'package:feature_home/src/portfolios_list/portfolio_item/portfolio_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utility/utility.dart';

class PortfoliosListWidget extends StatelessWidget {
  const PortfoliosListWidget({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => get<PortfoliosListBloc>()..add(PortfoliosListEvent.init()),
        child: BlocBuilder<PortfoliosListBloc, PortfoliosListState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (state.marketValue != null)
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            state.marketValue!.formattedMarket,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              inherit: true,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Container(
                            color: state.marketValue!.interest.value > 0 ? Colors.green : Colors.red,
                            padding: const EdgeInsets.all(2),
                            child: Text(
                              state.marketValue!.formattedInterest,
                              style: const TextStyle(
                                inherit: true,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Container(
                            color: state.marketValue!.percent > 0 ? Colors.green : Colors.red,
                            padding: const EdgeInsets.all(2),
                            child: Text(
                              state.marketValue!.formattedPercent,
                              style: const TextStyle(
                                inherit: true,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => PortfolioItemWidget(
                    state.portfolios[index],
                    (id) => context.read<PortfoliosListBloc>().add(PortfoliosListEvent.delete(id)),
                  ),
                  itemCount: state.portfolios.length,
                ),
              ],
            );
          },
        ),
      );
}
