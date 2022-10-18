import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_details_state.dart';
import 'package:symbol_api/symbol_api.dart';

class PortfolioDetailsWidget extends StatelessWidget {
  final String _portfolioId;

  const PortfolioDetailsWidget(this._portfolioId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Capital Gain Calculator'),
        ),
        body: BlocProvider<PortfolioDetailsBloc>(
          create: (_) => get<PortfolioDetailsBloc>()..add(PortfolioDetailsEvent.init(_portfolioId)),
          child: Column(
            children: [
              BlocBuilder<PortfolioDetailsBloc, PortfolioDetailsState>(
                  builder: ((context, state) => Text(_portfolioId))),
              Builder(
                builder: ((context) => TextButton(
                      onPressed: () async {
                        await showModalBottomSheet(
                          context: context,
                          builder: (context) => SymbolSearchWidget(),
                        ).then((value) {
                          if (value != null) {
                            context
                                .read<PortfolioDetailsBloc>()
                                .add(PortfolioDetailsEvent.addSymbol(value));
                          }
                        });
                      },
                      child: const Text('+ Add Symbol'),
                    )),
              ),
              BlocBuilder<PortfolioDetailsBloc, PortfolioDetailsState>(
                builder: ((context, state) {
                  return Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 0,
                      itemBuilder: ((context, index) {
                        return const ListTile(
                          title: Text('test'),
                        );
                      }),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      );
}
