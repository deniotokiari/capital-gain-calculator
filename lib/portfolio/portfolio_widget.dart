import 'package:capital_gain_calculator/portfolio/portfolio_bloc.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_event.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_state.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioWidget extends StatelessWidget {
  final int _portfolioId;

  const PortfolioWidget(
    this._portfolioId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Capital Gain Calculator'),
        ),
        body: BlocProvider<PortfolioBloc>(
          create: (context) => get<PortfolioBloc>()..add(PortfolioEvent.init(_portfolioId)),
          child: Column(
            children: [
              BlocBuilder<PortfolioBloc, PortfolioState>(
                  buildWhen: ((p, c) => c.portfolio?.title != null),
                  builder: ((context, state) => Text(state.portfolio?.title ?? ''))),
              Builder(
                builder: ((context) => TextButton(
                      onPressed: () {},
                      child: const Text('+ Add Symbol'),
                    )),
              ),
            ],
          ),
        ),
      );
}
