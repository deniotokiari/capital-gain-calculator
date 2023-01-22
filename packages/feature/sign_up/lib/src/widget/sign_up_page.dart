import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up/src/bloc/sign_up_bloc.dart';
import 'package:sign_up/src/bloc/sign_up_event.dart';
import 'package:sign_up/src/bloc/sign_up_state.dart';
import 'package:ui/ui.dart';
import 'package:utility/utility.dart';

class SignUpPage extends StatelessWidget with AppWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => get<SignUpBloc>(),
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            state.whenOrNull(
              null,
              signUpSuccess: (message) {
                AppSnackBar.success(context, message);

                context.router.popUntilRoot();
                context.router.pushNamed('/sign-in');
              },
              signUpFailed: (message) => AppSnackBar.fail(context, message),
            );
          },
          child: buildAppWidget(Column(
            children: [
              Builder(
                builder: (context) => TextFormField(
                  onChanged: (value) => context.read<SignUpBloc>().add(SignUpEvent.emailChanged(value)),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'EMAIL',
                  ),
                ),
              ),
              Builder(
                builder: (context) => TextFormField(
                  obscureText: true,
                  onChanged: (value) => context.read<SignUpBloc>().add(SignUpEvent.passwordChanged(value)),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'PASSWORD',
                  ),
                ),
              ),
              Builder(
                builder: (context) => TextFormField(
                  onChanged: (value) => context.read<SignUpBloc>().add(SignUpEvent.alphavantageKeyChanged(value)),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'ALPHAVANTAGE KEY',
                  ),
                ),
              ),
              BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) => state.map(
                  (_) => _getSignUpButton(context, state),
                  loading: (_) => const CircularProgressIndicator.adaptive(),
                  signUpSuccess: (_) => const SizedBox(),
                  signUpFailed: (_) => _getSignUpButton(context, state),
                ),
              ),
            ],
          )),
        ),
      );

  Widget _getSignUpButton(BuildContext context, SignUpState state) => TextButton(
        onPressed: state.isSignUpButtonEnabled ? () => context.read<SignUpBloc>().add(SignUpEvent.signUp()) : null,
        child: const Text('SIGN UP'),
      );
}
