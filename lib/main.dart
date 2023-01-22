import 'package:capital_gain_calculator/app_module.dart';
import 'package:capital_gain_calculator/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:utility/utility.dart';
import 'navigation/app_navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppModule().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = get<AppRouter>();

    return MaterialApp.router(
      title: 'Capital Gain Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
