import 'package:capital_gain_calculator/portfolio/portfolio_bloc.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_repository.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_state.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Capital Gain Calculator'),
        ),
        body: BlocProvider<PortfolioBloc>(
          create: (_) => get<PortfolioBloc>(
            param1: ModalRoute.of(context)?.settings.arguments as Portfolio,
          ),
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
