import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/portfolio_details_header/portfolio_details_header_bloc.dart';
import 'package:portfolio_details/src/portfolio_details_header/portfolio_details_header_event.dart';
import 'package:portfolio_details/src/portfolio_details_header/portfolio_details_header_state.dart';

class PortfolioDetailsHeaderWidget extends StatelessWidget {
  final String _portfolioId;

  const PortfolioDetailsHeaderWidget(
    this._portfolioId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        color: Colors.blue,
        padding: const EdgeInsets.all(8),
        child: BlocProvider<PortfolioDetailsHeaderBloc>(
          create: (_) => get<PortfolioDetailsHeaderBloc>()..add(PortfolioDetailsHeaderEvent.init(_portfolioId)),
          child: BlocBuilder<PortfolioDetailsHeaderBloc, PortfolioDetailsHeaderState>(
            builder: (context, state) => state.map(
              idle: (idle) => _buildHeader(idle),
              refreshing: (refreshing) => _buildHeader(refreshing),
              loading: (_) => const CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      );

  Widget _buildHeader(PortfolioDetailsHeaderStateViewModel state) {
    final model = state.viewModel.mapOrNull(model: (model) => model);

    if (model != null) {
      return Text('${model.portfolioName} => ${model.marketValue.market}');
    } else {
      return const SizedBox();
    }
  }
}
