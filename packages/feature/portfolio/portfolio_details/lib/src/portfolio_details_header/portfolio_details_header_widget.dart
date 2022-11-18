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
            builder: (context, state) => state.maybeMap(
              orElse: () => _buildHeader(context, state),
              loading: (_) => const CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      );

  Widget _buildHeader(BuildContext context, PortfolioDetailsHeaderState state) {
    final model = state.viewModel.mapOrNull(model: (model) => model);

    if (model != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            model.portfolioName,
            style: const TextStyle(inherit: true, color: Colors.white),
          ),
          if (model.marketValue.value > 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                model.marketValue.market,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  inherit: true,
                  color: Colors.white,
                ),
              ),
            ),
          if (model.marketValue.value > 0)
            _getGainLossWidget(
              model.returnValue.value,
              model.returnValue.gainOrLoss,
            ),
          if (model.marketValue.value > 0)
            _getGainLossWidget(
              model.returnPercent,
              '${model.returnPercent > 0 ? '+' : '-'}${model.returnPercent.abs()}%',
            ),
          state.maybeMap(
            refreshing: (_) => const Padding(
              padding: EdgeInsets.only(left: 2),
              child: CircularProgressIndicator.adaptive(),
            ),
            orElse: () => IconButton(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              iconSize: 20,
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.only(left: 2),
              onPressed: () {
                context
                    .read<PortfolioDetailsHeaderBloc>()
                    .add(PortfolioDetailsHeaderEvent.refresh());
              },
              tooltip: 'Refresh',
              icon: const Icon(Icons.refresh, color: Colors.white),
            ),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
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
