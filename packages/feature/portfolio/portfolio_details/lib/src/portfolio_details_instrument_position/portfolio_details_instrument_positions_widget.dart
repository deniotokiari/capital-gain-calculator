import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/portfolio_details_instrument_position/portfolio_instrument_positions_event.dart';
import 'package:portfolio_details/src/portfolio_details_instrument_position/portfolio_instrument_positions_state.dart';

import 'portfolio_details_instrument_positions_bloc.dart';

class PortfolioDetailsInstrumentPositionsWidget extends StatelessWidget {
  final String _instrumentId;

  const PortfolioDetailsInstrumentPositionsWidget(
    this._instrumentId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => get<PortfolioInstrumentPositionsBloc>()
          ..add(PortfolioInstrumentPositionsEvent.init(_instrumentId)),
        child: BlocBuilder<PortfolioInstrumentPositionsBloc, PortfolioInstrumentPositionsState>(
          builder: (_, state) {
            if (state.model.positions.isEmpty) {
              return const SizedBox();
            } else {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...state.model.positions.map((e) => _getPosition(e)),
                  ],
                ),
              );
            }
          },
        ),
      );

  Widget _getPosition(PortfolioInstrumentPositionViewModel item) => Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                item.date,
                style: const TextStyle(inherit: true, fontSize: 13),
              ),
            ),
            Expanded(
              child: Text(
                item.count,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
                style: const TextStyle(inherit: true, fontSize: 13),
              ),
            ),
            Expanded(
              child: Text(
                item.marketValue.market,
                textAlign: TextAlign.end,
                style: const TextStyle(inherit: true, fontSize: 13),
              ),
            ),
            Expanded(
              child: Text(
                item.returnValue.gainOrLoss,
                textAlign: TextAlign.end,
                style: TextStyle(
                  inherit: true,
                  fontSize: 14,
                  color: item.returnValue.value > 0 ? Colors.green : Colors.red,
                ),
              ),
            ),
            Expanded(
              child: Text(
                item.returnPercent.formatted,
                textAlign: TextAlign.end,
                style: TextStyle(
                  inherit: true,
                  fontSize: 13,
                  color: item.returnPercent.value > 0 ? Colors.green : Colors.red,
                ),
              ),
            ),
          ],
        ),
      );
}
