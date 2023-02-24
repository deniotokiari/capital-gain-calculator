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

  List<Widget> _getPositionWidgets(InstrumentStatePositions model) => [];
}
