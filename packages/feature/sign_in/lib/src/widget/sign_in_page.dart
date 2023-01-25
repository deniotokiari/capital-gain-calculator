import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in/src/bloc/sign_in_bloc.dart';
import 'package:sign_in/src/bloc/sign_in_event.dart';
import 'package:sign_in/src/bloc/sign_in_state.dart';
import 'package:ui/ui.dart';
import 'package:utility/utility.dart';

class SignInPage extends StatelessWidget with AppWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) => buildAppWidget(BlocProvider(
        create: (_) => get<SignInBloc>(),
        child: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            state.whenOrNull(
              signInFailed: (message) => AppSnackBar.fail(context, message),
              signInSuccess: (message) {
                AppSnackBar.success(context, message);

                context.router.popUntil((route) => false);
                context.router.pushNamed('/home');
              },
            );
          },
          child: Column(children: [
            Builder(
              builder: (context) => TextFormField(
                onChanged: (value) => context.read<SignInBloc>().add(SignInEvent.emailChanged(value)),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'EMAIL',
                ),
              ),
            ),
            Builder(
              builder: (context) => TextFormField(
                obscureText: true,
                onChanged: (value) => context.read<SignInBloc>().add(SignInEvent.passwordChanged(value)),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'PASSWORD',
                ),
              ),
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (_, state) => state.maybeMap(
                orElse: () => _getSignInButton(context, state),
                loading: (_) => const CircularProgressIndicator.adaptive(),
              ),
            ),
            TextButton(
              onPressed: () => context.router.pushNamed('/sign-up'),
              child: const Text('SIGN UP'),
            ),
          ]),
        ),
      ));

  Widget _getSignInButton(BuildContext context, SignInState state) => TextButton(
        onPressed: state.isSignInButtonEnabled ? () => context.read<SignInBloc>().add(SignInEvent.signIn()) : null,
        child: const Text('SIGN IN'),
      );
}
