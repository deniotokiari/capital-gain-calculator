import 'package:feature_home/src/portfolios_list/bloc/portfolios_list_bloc.dart';
import 'package:feature_home/src/portfolios_list/bloc/portfolios_list_event.dart';
import 'package:feature_home/src/portfolios_list/bloc/portfolios_list_state.dart';
import 'package:feature_home/src/portfolios_list/portfolio_item/portfolio_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utility/utility.dart';

class PortfoliosListWidget extends StatelessWidget {
  const PortfoliosListWidget({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => get<PortfoliosListBloc>()..add(PortfoliosListEvent.init()),
        child: BlocBuilder<PortfoliosListBloc, PortfoliosListState>(
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => PortfolioItemWidget(
                state.portfolios[index],
                (id) => context.read<PortfoliosListBloc>().add(PortfoliosListEvent.delete(id)),
              ),
              itemCount: state.portfolios.length,
            );
          },
        ),
      );
}
