import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/portfolio_details_instrument/portfolio_details_instrument_bloc.dart';
import 'package:portfolio_details/src/portfolio_details_instrument/portfolio_details_instrument_event.dart';
import 'package:portfolio_details/src/portfolio_details_instrument/portfolio_details_instrument_state.dart';

class PortfolioDetailsInstrumentWidget extends StatelessWidget {
  final String _instrumentId;

  const PortfolioDetailsInstrumentWidget(
    this._instrumentId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<PortfolioDetailsInstrumentBloc>(
        create: (_) => get<PortfolioDetailsInstrumentBloc>()
          ..add(PortfolioDetailsInstrumentEvent.init(instrumentId: _instrumentId)),
        child: BlocBuilder<PortfolioDetailsInstrumentBloc, PortfolioDetailsInstrumentState>(
          builder: (context, state) => state.viewModel.map(
            (value) {
              final marketValue = value.marketValue;
              final returnValue = value.returnValue;
              final returnPercent = value.returnPercent;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      value.ticker,
                      style: const TextStyle(inherit: true, fontSize: 14),
                    ),
                  ),
                  if (marketValue != null)
                    Expanded(
                      child: Text(
                        marketValue.market,
                        style: const TextStyle(
                          inherit: true,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  if (returnValue != null)
                    _getGainLossWidget(
                      returnValue.value,
                      returnValue.gainOrLoss,
                    ),
                  if (returnPercent != null)
                    _getGainLossWidget(
                      returnPercent.value,
                      returnPercent.formatted,
                    ),
                ],
              );
            },
            empty: (empty) => const CircularProgressIndicator.adaptive(),
          ),
        ),
      );

  Widget _getGainLossWidget(double value, String text) => Expanded(
        child: Text(
          text,
          style: TextStyle(
            inherit: true,
            fontSize: 14,
            color: value < 0 ? Colors.red : Colors.green,
          ),
        ),
      );
}
