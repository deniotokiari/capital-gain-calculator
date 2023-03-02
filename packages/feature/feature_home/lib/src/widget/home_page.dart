import 'package:feature_home/src/create_portfolio/create_portfolio_widget.dart';
import 'package:feature_home/src/portfolios_list/portfolios_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class HomePage extends StatelessWidget with AppWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => buildAppWidget(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PortfoliosListWidget(),
            TextButton(
              onPressed: () {
                showDialog(context: context, builder: (_) => const CreatePortfolioWidget());
              },
              child: const Text('+ Create Portfolio'),
            ),
          ],
        ),
      );
}
