import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.router.pushNamed('/home');

    return const SizedBox();
  }
}
