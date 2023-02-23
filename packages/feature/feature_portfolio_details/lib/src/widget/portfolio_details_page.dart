import 'package:auto_route/auto_route.dart';
import 'package:feature_portfolio_details/src/bloc/portfolio_details_bloc.dart';
import 'package:feature_portfolio_details/src/bloc/portfolio_details_event.dart';
import 'package:feature_portfolio_details/src/bloc/portfolio_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_symbol/data_symbol.dart';
import 'package:ui/ui.dart';
import 'package:utility/utility.dart';

class PortfolioDetailsPage extends StatelessWidget with AppWidget {
  final String id;

  const PortfolioDetailsPage({
    @PathParam('id') required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) => buildAppWidget(BlocProvider(
        create: (context) => get<PortfolioDetailsBloc>()..add(PortfolioDetailsEvent.init(id)),
        child: BlocBuilder<PortfolioDetailsBloc, PortfolioDetailsState>(
          builder: (context, state) {
            return state.map(
              loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
              error: (error) => Center(child: Text(error.message)),
              idle: (idle) => Column(
                children: [
                  Text(idle.model.portfolioName), // with gain, loss and market value
                  TextButton(
                    onPressed: () async {
                      final result = await showModalBottomSheet<Symbol?>(
                        context: context,
                        builder: (context) => get(instanceName: 'symbol_search'),
                      );

                      // ignore: use_build_context_synchronously
                      if (result != null && context.mounted) {
                        context.read<PortfolioDetailsBloc>().add(PortfolioDetailsEvent.addSymbol(result));
                      }
                    },
                    child: const Text('+ Add Symbol'),
                  ),
                ],
              ),
            );
          },
        ),
      ));
}
