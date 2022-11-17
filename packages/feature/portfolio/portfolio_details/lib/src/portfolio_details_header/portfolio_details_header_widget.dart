import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/portfolio_details_header/portfolio_details_header_bloc.dart';
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
          create: (_) => get<PortfolioDetailsHeaderBloc>(),
          child: BlocBuilder<PortfolioDetailsHeaderBloc, PortfolioDetailsHeaderState>(
            buildWhen: (previous, current) {
              print('LOG_: $previous => $current');
              return previous.mapOrNull(loading: (_) => true) ?? false;
            },
            builder: (context, state) => state.map(
              idle: (idle) => _buildHeader(idle),
              refreshing: (refreshing) => _buildHeader(refreshing),
              loading: (_) => const CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      );

  Widget _buildHeader(PortfolioDetailsHeaderStateViewModel viewModel) {
    return SizedBox();
  }
}
