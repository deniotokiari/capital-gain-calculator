import 'package:capital_gain_calculator/portfolio/create_portfolio_bloc.dart';
import 'package:capital_gain_calculator/portfolio/create_portfolio_event.dart';
import 'package:capital_gain_calculator/portfolio/create_portfolio_state.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stock_service/stock_service.dart';

part 'create_portfolio_widget.freezed.dart';

class CreatePortfolioWidget extends StatelessWidget {
  const CreatePortfolioWidget({Key? key}) : super(key: key);

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
                    context
                        .read<CreatePortfolioBloc>()
                        .add(CreatePortfolioEvent.portfolioNameChanged(
                          text,
                        ));
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter portfolio name',
                  ),
                );
              }),
              BlocBuilder<CreatePortfolioBloc, CreatePortfolioState>(
                  builder: (context, state) => DropdownButton<PhysicalCurrency>(
                        value: state.selectedCurrency,
                        items: state.listOfCurrency
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text('${e.name} (${e.code})'),
                                ))
                            .toList(growable: false),
                        onChanged: (value) {
                          if (value != null) {
                            context
                                .read<CreatePortfolioBloc>()
                                .add(CreatePortfolioEvent.currencySelected(value));
                          }
                        },
                      )),
            ],
          ),
          actions: [
            BlocBuilder<CreatePortfolioBloc, CreatePortfolioState>(builder: (context, state) {
              return TextButton(
                onPressed: state.map(
                  idle: (idle) => idle.submitEnabled
                      ? () {
                          context.read<CreatePortfolioBloc>().add(
                                CreatePortfolioEvent.submit(),
                              );

                          Navigator.of(context).pop(CreatePortfolioWidgetNavigationResult.submit());
                        }
                      : null,
                ),
                child: const Text('Submit'),
              );
            }),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pop(CreatePortfolioWidgetNavigationResult.cancel()),
              child: const Text('Cancel'),
            ),
          ],
        ),
      );
}

@freezed
class CreatePortfolioWidgetNavigationResult with _$CreatePortfolioWidgetNavigationResult {
  factory CreatePortfolioWidgetNavigationResult.cancel() =
      _CreatePortfolioWidgetNavigationResultCancel;

  factory CreatePortfolioWidgetNavigationResult.submit() =
      _CreatePortfolioWidgetNavigationResultSubmit;
}
