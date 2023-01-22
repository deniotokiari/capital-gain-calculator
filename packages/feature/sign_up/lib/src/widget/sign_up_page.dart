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
              (_, __, ___, failedReason) {
                if (failedReason != null) {
                  AppSnackBar.fail(context, failedReason);
                }
              },
              signUpSuccess: (message) {
                AppSnackBar.success(context, message);

                // TODO navigate to app
              },
            );
          },
          child: buildAppWidget(Column(
            children: [
              Builder(builder: (context) {
                return TextFormField(
                  onChanged: (value) => context.read<SignUpBloc>().add(SignUpEvent.emailChanged(value)),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'EMAIL',
                  ),
                );
              }),
              Builder(builder: (context) {
                return TextFormField(
                  onChanged: (value) => context.read<SignUpBloc>().add(SignUpEvent.passwordChanged(value)),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'PASSWORD',
                  ),
                );
              }),
              Builder(builder: (context) {
                return TextFormField(
                  onChanged: (value) => context.read<SignUpBloc>().add(SignUpEvent.alphavantageKeyChanged(value)),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'ALPHAVANTAGE KEY',
                  ),
                );
              }),
              BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) => state.map(
                  (_) => TextButton(
                    onPressed: state.isSignUpButtonEnabled ? () => context.read<SignUpBloc>().add(SignUpEvent.signUp()) : null,
                    child: const Text('SIGN UP'),
                  ),
                  loading: (_) => const CircularProgressIndicator.adaptive(),
                  signUpSuccess: (_) => const SizedBox(),
                ),
              ),
            ],
          )),
        ),
      );
}
