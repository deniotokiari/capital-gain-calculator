import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_instrument_positions_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_instrument_positions_state.dart';

import '../bloc/portfolio_instrument_positions_bloc.dart';

class PortfolioInstrumentPositionsWidget extends StatelessWidget {
  final String _instrumentId;

  const PortfolioInstrumentPositionsWidget(
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
                '${item.currency}${item.marketValue.toStringAsFixed(2)}',
                textAlign: TextAlign.end,
                style: const TextStyle(inherit: true, fontSize: 13),
              ),
            ),
            Expanded(
              child: Text(
                item.returnValue > 0
                    ? '+${item.currency}${item.returnValue.toStringAsFixed(2)}'
                    : '-${item.currency}${item.returnValue.abs().toStringAsFixed(2)}',
                textAlign: TextAlign.end,
                style: TextStyle(
                  inherit: true,
                  fontSize: 14,
                  color: item.returnValue > 0 ? Colors.green : Colors.red,
                ),
              ),
            ),
            Expanded(
              child: Text(
                item.returnPercent > 0
                    ? '+${(item.returnPercent * 100).toStringAsFixed(2)}%'
                    : '${(item.returnPercent * 100).toStringAsFixed(2)}%',
                textAlign: TextAlign.end,
                style: TextStyle(
                  inherit: true,
                  fontSize: 13,
                  color: item.returnPercent > 0 ? Colors.green : Colors.red,
                ),
              ),
            ),
          ],
        ),
      );
}
