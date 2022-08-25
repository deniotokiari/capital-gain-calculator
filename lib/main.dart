import 'package:capital_gain_calculator/main/main_widget.dart';
import 'package:capital_gain_calculator/main_dependency_module.dart';
import 'package:capital_gain_calculator/portfolio/portfolio_widget.dart';
import 'package:flutter/material.dart';

void main() {
  MainDependencyModule().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capital Gain Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainWidget(),
      onGenerateRoute: (settings) {
        if (settings.name?.contains('/portfolio') == true) {
          final portfolioId = settings.arguments as int;

          return MaterialPageRoute(builder: ((context) => PortfolioWidget(portfolioId)));
        } else {
          return null;
          //return MaterialPageRoute(builder: ((context) => const MainWidget()));
        }
      },
    );
  }
}
