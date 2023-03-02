import 'package:auto_route/auto_route.dart';
import 'package:feature_splash/src/bloc/splash_bloc.dart';
import 'package:feature_splash/src/bloc/splash_event.dart';
import 'package:feature_splash/src/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utility/utility.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => get<SplashBloc>()..add(SplashEvent.init()),
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            state.mapOrNull(done: (_) {
              context.router.popUntil((route) => false);
              context.router.pushNamed('/home');
            });
          },
          child: const Center(child: CircularProgressIndicator.adaptive()),
        ),
      );
}
