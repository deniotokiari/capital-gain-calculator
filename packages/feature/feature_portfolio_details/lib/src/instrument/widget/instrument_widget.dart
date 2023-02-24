import 'package:feature_portfolio_details/src/instrument/add_position/widget/add_position_widget.dart';
import 'package:feature_portfolio_details/src/instrument/bloc/instrument_bloc.dart';
import 'package:feature_portfolio_details/src/instrument/bloc/instrument_event.dart';
import 'package:feature_portfolio_details/src/instrument/bloc/instrument_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utility/utility.dart';

class InstrumentWidget extends StatelessWidget {
  final String _instrumentId;

  InstrumentWidget(this._instrumentId) : super(key: Key(_instrumentId));

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => get<InstrumentBloc>()..add(InstrumentEvent.init(_instrumentId)),
        child: BlocBuilder<InstrumentBloc, InstrumentState>(
          builder: (context, state) => state.map(
            loading: (_) => const CircularProgressIndicator.adaptive(),
            idle: (idle) => ExpansionTile(
              expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
              title: _getTitleWidget(idle.title),
              children: [
                ..._getPositionWidgets(idle.positions),
                TextButton(
                  onPressed: () => showDialog(context: context, builder: (_) => AddPositionWidget(_instrumentId)),
                  child: const Text('+ Add Position'),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _getTitleWidget(InstrumentStateTitle model) => Text(model.title);

  List<Widget> _getPositionWidgets(InstrumentStatePositions model) => [...model.items.map(_getPositionWidget)];

  Widget _getPositionWidget(InstrumentStatePositionsItem item) => Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                item.date,
                style: const TextStyle(inherit: true, fontSize: 13),
              ),
            ),
            if (item.marketValue != null)
              Expanded(
                child: Text(
                  item.marketValue!.count.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: const TextStyle(inherit: true, fontSize: 13),
                ),
              ),
            if (item.marketValue != null)
              Expanded(
                child: Text(
                  item.marketValue!.formattedMarket,
                  textAlign: TextAlign.end,
                  style: const TextStyle(inherit: true, fontSize: 13),
                ),
              ),
            if (item.marketValue != null)
              Expanded(
                child: Text(
                  item.marketValue!.formattedInterest,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    inherit: true,
                    fontSize: 14,
                    color: item.marketValue!.interest.value > 0 ? Colors.green : Colors.red,
                  ),
                ),
              ),
            if (item.marketValue != null)
              Expanded(
                child: Text(
                  item.marketValue!.formattedPercent,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    inherit: true,
                    fontSize: 13,
                    color: item.marketValue!.percent > 0 ? Colors.green : Colors.red,
                  ),
                ),
              ),
          ],
        ),
      );
}
