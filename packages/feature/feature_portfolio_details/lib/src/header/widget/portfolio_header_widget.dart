import 'package:feature_portfolio_details/src/header/bloc/portfolio_header_bloc.dart';
import 'package:feature_portfolio_details/src/header/bloc/portfolio_header_event.dart';
import 'package:feature_portfolio_details/src/header/bloc/portfolio_header_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utility/utility.dart';

class PortfolioHeaderWidget extends StatelessWidget {
  final String _portfolioId;

  const PortfolioHeaderWidget(
    this._portfolioId, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => get<PortfolioHeaderBloc>()..add(PortfolioHeaderEvent.init(_portfolioId)),
        child: BlocBuilder<PortfolioHeaderBloc, PortfolioHeaderState>(
          builder: (context, state) {
            if (state.title == null) {
              return const SizedBox();
            } else {
              return Container(
                width: double.infinity,
                color: Colors.blue,
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.title!, style: const TextStyle(inherit: true, color: Colors.white)),
                    if (state.marketValue != null)
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
                    if (state.marketValue != null)
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
                    if (state.marketValue != null)
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
              );
            }
          },
        ),
      );
}
