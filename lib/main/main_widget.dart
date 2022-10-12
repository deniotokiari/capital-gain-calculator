import 'package:capital_gain_calculator/main/main_bloc.dart';
import 'package:capital_gain_calculator/main/main_event.dart';
import 'package:capital_gain_calculator/main/main_state.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_api/portfolio_api.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Capital Gain Calculator'),
        ),
        body: BlocProvider(
          create: (_) => get<MainBloc>()..add(MainEvent.init()),
          child: Column(
            children: [
              Builder(
                  builder: (context) => TextButton(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (_) => const PortfolioCreateWidget(),
                          );
                        },
                        child: const Text('+ Create Portfolio'),
                      )),
              BlocBuilder<MainBloc, MainState>(
                builder: ((_, __) => const AllPortfoliosWidget()),
              ),
            ],
          ),
        ),
      );
}
