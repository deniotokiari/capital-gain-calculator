import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/src/bloc/splash_bloc.dart';
import 'package:splash/src/bloc/splash_event.dart';
import 'package:splash/src/bloc/splash_state.dart';
import 'package:utility/utility.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => get<SplashBloc>()..add(SplashEvent.init()),
        child: Center(
          child: BlocBuilder<SplashBloc, SplashState>(
            builder: (context, state) => state.map(
              loading: (_) => const CircularProgressIndicator.adaptive(),
              done: (_) {
                context.router.popUntil((route) => false);
                context.router.pushNamed('/home');

                return const CircularProgressIndicator.adaptive();
              },
            ),
          ),
        ),
      );
}
