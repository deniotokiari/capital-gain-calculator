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
          builder: (ctx, state) => state.map(
            loading: (_) => const CircularProgressIndicator.adaptive(),
            idle: (idle) => ExpansionTile(
              expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
              title: _getTitleWidget(idle.title),
              children: [
                ..._getPositionWidgets(idle.positions, ctx),
                TextButton(
                  onPressed: () => showDialog(context: ctx, builder: (_) => AddPositionWidget(_instrumentId)),
                  child: const Text('+ Add Position'),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _getTitleWidget(InstrumentStateTitle model) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              model.title,
              style: const TextStyle(inherit: true, fontSize: 14),
            ),
          ),
          if (model.marketValue != null)
            Expanded(
              child: Text(
                model.marketValue!.formattedMarket,
                style: const TextStyle(
                  inherit: true,
                  fontSize: 14,
                ),
              ),
            ),
          if (model.marketValue != null)
            Expanded(
              child: Text(
                model.marketValue!.formattedInterest,
                style: TextStyle(
                  inherit: true,
                  fontSize: 14,
                  color: model.marketValue!.interest.value < 0 ? Colors.red : Colors.green,
                ),
              ),
            ),
          if (model.marketValue != null)
            Expanded(
              child: Text(
                model.marketValue!.formattedPercent,
                style: TextStyle(
                  inherit: true,
                  fontSize: 14,
                  color: model.marketValue!.percent < 0 ? Colors.red : Colors.green,
                ),
              ),
            ),
        ],
      );

  List<Widget> _getPositionWidgets(InstrumentStatePositions model, BuildContext context) => [
        ...model.items.map((e) => _getPositionWidget(e, context)),
      ];

  Widget _getPositionWidget(InstrumentStatePositionsItem item, BuildContext context) => InkWell(
        onTap: () {},
        onLongPress: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    content: const Text('Are you shure to delete position?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            context.read<InstrumentBloc>().add(InstrumentEvent.deletePosition(item.id));

                            Navigator.of(context).pop();
                          },
                          child: const Text('YES')),
                      TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('NO')),
                    ],
                  ));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.date,
                style: const TextStyle(inherit: true, fontSize: 13),
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
        ),
      );
}
