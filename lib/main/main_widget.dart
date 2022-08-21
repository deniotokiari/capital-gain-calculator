import 'package:capital_gain_calculator/portfolio/create_portfolio_widget.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Capital Gain Calculator'),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const CreatePortfolioWidget(),
              ),
              child: const Text('+ Create Portfolio'),
            ),
          ],
        ),
      );
}
