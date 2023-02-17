import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/create_portfolio/bloc/create_portfolio_bloc.dart';
import 'package:home/src/create_portfolio/bloc/create_portfolio_event.dart';
import 'package:home/src/create_portfolio/bloc/create_portfolio_state.dart';
import 'package:utility/utility.dart';

class CreatePortfolioWidget extends StatelessWidget {
  const CreatePortfolioWidget({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => get<CreatePortfolioBloc>()..add(CreatePortfolioEvent.init()),
        child: AlertDialog(
          title: const Text('Create Portfolio'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(builder: (context) {
                return TextFormField(
                  onChanged: (text) {
                    context.read<CreatePortfolioBloc>().add(CreatePortfolioEvent.onPortfolioNameChanged(text.trim()));
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter portfolio name',
                  ),
                );
              }),
              BlocBuilder<CreatePortfolioBloc, CreatePortfolioState>(builder: (context, state) {
                final listOfCurrency = state.listOfCurrency ?? [];

                return DropdownButton<String>(
                  isExpanded: true,
                  value: state.selectedCurrency,
                  items: listOfCurrency.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(growable: false),
                  onChanged: (value) {
                    if (value != null) {
                      context.read<CreatePortfolioBloc>().add(CreatePortfolioEvent.onPortfolioCurrencyChanged(value));
                    }
                  },
                );
              }),
            ],
          ),
          actions: [
            BlocBuilder<CreatePortfolioBloc, CreatePortfolioState>(builder: (context, state) {
              return TextButton(
                onPressed: state.submitEnabled
                    ? () {
                        context.read<CreatePortfolioBloc>().add(
                              CreatePortfolioEvent.onSubmit(),
                            );

                        Navigator.of(context).pop();
                      }
                    : null,
                child: const Text('Submit'),
              );
            }),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        ),
      );
}
