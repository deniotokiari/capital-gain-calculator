import 'package:capital_gain_calculator/main/main_bloc.dart';
import 'package:capital_gain_calculator/main/main_event.dart';
import 'package:capital_gain_calculator/main/main_state.dart';
import 'package:capital_gain_calculator/portfolio/create_portfolio_widget.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Capital Gain Calculator'),
        ),
        body: BlocProvider(
          create: (context) => get<MainBloc>(),
          child: Column(
            children: [
              Builder(builder: (context) {
                return TextButton(
                  onPressed: () async {
                    final result = await showDialog<CreatePortfolioWidgetNavigationResult>(
                      context: context,
                      builder: (context) => const CreatePortfolioWidget(),
                    );

                    result?.whenOrNull(
                      submit: () {
                        context.read<MainBloc>().add(MainEvent.init());
                      },
                    );
                  },
                  child: const Text('+ Create Portfolio'),
                );
              }),
              BlocBuilder<MainBloc, MainState>(
                builder: (context, state) => Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.portfolios.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(state.portfolios[index].title),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
