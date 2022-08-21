import 'package:capital_gain_calculator/portfolio/create_portfolio_bloc.dart';
import 'package:capital_gain_calculator/portfolio/create_portfolio_state.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePortfolioWidget extends StatelessWidget {
  const CreatePortfolioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => get<CreatePortfolioBloc>(),
        child: AlertDialog(
          title: const Text('Create Portfolio'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onChanged: (text) {},
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter portfolio name',
                ),
              ),
              DropdownButton<String>(
                value: 'US Dollar (USD)',
                items: ['US Dollar (USD)', 'Euro (EUR)']
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(growable: false),
                onChanged: (value) {},
              ),
            ],
          ),
          actions: [
            BlocBuilder<CreatePortfolioBloc, CreatePortfolioState>(builder: (context, state) {
              return TextButton(
                onPressed: state.map(
                  idle: (idle) => idle.submitEnabled ? () {} : null,
                ),
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
