import 'package:auto_route/auto_route.dart';
import 'package:feature_sign_up/src/bloc/sign_up_bloc.dart';
import 'package:feature_sign_up/src/bloc/sign_up_event.dart';
import 'package:feature_sign_up/src/bloc/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';
import 'package:utility/utility.dart';

class SignUpPage extends StatelessWidget with AppWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => get<SignUpBloc>()..add(SignUpEvent.init()),
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            state.whenOrNull(
              null,
              signUpSuccess: (message) {
                AppSnackBar.success(context, message);

                context.router.popUntil((route) => false);
                context.router.pushNamed('/');
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
                buildWhen: (previous, current) => current.mapOrNull((value) => value.listOfCurrency != null) ?? false,
                builder: (context, state) =>
                    state.mapOrNull(
                      (value) {
                        final listOfCurrency = value.listOfCurrency ?? [];

                        return DropdownButton<String>(
                          isExpanded: true,
                          value: value.selectedCurrency,
                          items: listOfCurrency.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(growable: false),
                          onChanged: (value) {
                            if (value != null) {
                              context.read<SignUpBloc>().add(SignUpEvent.currencyChanged(value));
                            }
                          },
                        );
                      },
                    ) ??
                    const CircularProgressIndicator.adaptive(),
              ),
              BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) => state.map(
                  (_) => _getSignUpButton(context, state),
                  loading: (_) => const CircularProgressIndicator.adaptive(),
                  signUpSuccess: (_) => const SizedBox(),
                  signUpFailed: (_) => _getSignUpButton(context, state),
                ),
              ),
              TextButton(
                onPressed: () => context.router.pushNamed('/sign-in'),
                child: const Text('SIGN IN'),
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
