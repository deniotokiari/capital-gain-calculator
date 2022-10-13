import 'package:flutter/material.dart';

class PortfolioDetailsWidget extends StatelessWidget {
  final String _portfolioId;

  const PortfolioDetailsWidget(this._portfolioId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Capital Gain Calculator'),
        ),
        body: Text('ID => $_portfolioId'),
      );
}
