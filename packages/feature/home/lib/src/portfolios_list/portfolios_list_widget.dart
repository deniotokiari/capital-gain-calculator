import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/portfolios_list/bloc/portfolios_list_bloc.dart';
import 'package:home/src/portfolios_list/bloc/portfolios_list_event.dart';
import 'package:home/src/portfolios_list/bloc/portfolios_list_state.dart';
import 'package:utility/utility.dart';

class PortfoliosListWidget extends StatelessWidget {
  const PortfoliosListWidget({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => get<PortfoliosListBloc>()..add(PortfoliosListEvent.init()),
        child: BlocBuilder<PortfoliosListBloc, PortfoliosListState>(
          builder: (context, state) {
            if (state.portfolios.isEmpty) {
              return const CircularProgressIndicator.adaptive();
            } else {
              return Text('Count => ${state.portfolios.length}');
            }
          },
        ),
      );
}
