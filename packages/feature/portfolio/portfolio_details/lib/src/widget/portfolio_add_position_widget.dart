import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_add_position_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_add_position_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_add_position_state.dart';

class PortfolioAddPositionWidget extends StatelessWidget {
  final String _instrumentId;
  

  const PortfolioAddPositionWidget(
    this._instrumentId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) =>
            get<PortfolioAddPositionBloc>()..add(PortfolioAddPositionEvent.init(_instrumentId)),
        child: AlertDialog(
          title: const Text('Add Position'),
          content: Column(),
          actions: [
            BlocBuilder<PortfolioAddPositionBloc, PortfolioAddPositionState>(
                builder: (context, state) {
              return TextButton(
                onPressed: state.map(
                  idle: (idle) => idle.submitEnabled
                      ? () {
                          context.read<PortfolioAddPositionBloc>().add(
                                PortfolioAddPositionEvent.submit(),
                              );

                          Navigator.of(context).pop(const NavigationResult.ok());
                        }
                      : null,
                ),
                child: const Text('Submit'),
              );
            }),
            TextButton(
              onPressed: () => Navigator.of(context).pop(const NavigationResult.cancel()),
              child: const Text('Cancel'),
            ),
          ],
        ),
      );
}
