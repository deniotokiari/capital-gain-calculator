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
          create: (_) => get<PortfolioDetailsHeaderBloc>()
            ..add(PortfolioDetailsHeaderEvent.init(_portfolioId)),
          child: BlocBuilder<PortfolioDetailsHeaderBloc, PortfolioDetailsHeaderState>(
            builder: (context, state) {
              if (state.viewModel.loading) {
                return const CircularProgressIndicator.adaptive();
              } else {
                return _buildHeader(context, state);
              }
            },
          ),
        ),
      );

  Widget _buildHeader(BuildContext context, PortfolioDetailsHeaderState state) {
    final portfolioName = state.viewModel.portfolioName;
    final marketValue = state.viewModel.marketValue;
    final returnValue = state.viewModel.returnValue;
    final returnPercent = state.viewModel.returnPercent;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (portfolioName != null)
          Text(
            portfolioName,
            style: const TextStyle(inherit: true, color: Colors.white),
          ),
        if (marketValue != null && marketValue.value > 0)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              marketValue.market,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                inherit: true,
                color: Colors.white,
              ),
            ),
          ),
        if (returnValue != null && returnValue.value != 0)
          _getGainLossWidget(
            returnValue.value,
            returnValue.gainOrLoss,
          ),
        if (returnPercent != null && returnPercent.value != 0)
          _getGainLossWidget(
            returnPercent.value,
            returnPercent.formatted,
          ),
        if (state.viewModel.refreshing)
          const Padding(
            padding: EdgeInsets.only(left: 2),
            child: CircularProgressIndicator.adaptive(),
          )
        else if ([marketValue, returnValue, returnPercent].every((e) => e != null))
          IconButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            iconSize: 20,
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.only(left: 2),
            onPressed: () {
              context.read<PortfolioDetailsHeaderBloc>().add(PortfolioDetailsHeaderEvent.refresh());
            },
            tooltip: 'Refresh',
            icon: const Icon(Icons.refresh, color: Colors.white),
          ),
      ],
    );
  }

  Widget _getGainLossWidget(double value, String text) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Container(
          color: value > 0 ? Colors.green : Colors.red,
          padding: const EdgeInsets.all(2),
          child: Text(
            text,
            style: const TextStyle(
              inherit: true,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
}
