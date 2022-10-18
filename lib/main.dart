import 'package:capital_gain_calculator/main_dependency_module.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: '/',
      onGenerateRoute: NavigationRoute.onGenerateRoute,
    );
  }
}
