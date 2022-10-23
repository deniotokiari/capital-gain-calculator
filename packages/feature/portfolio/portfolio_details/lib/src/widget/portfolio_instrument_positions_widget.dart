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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...state.model.positions
                      .map((e) => Text('${e.date} - ${e.count} - ${e.price}')),
                ],
              );
            }
          },
        ),
      );
}
