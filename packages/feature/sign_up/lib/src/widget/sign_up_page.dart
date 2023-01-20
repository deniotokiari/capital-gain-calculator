import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up/src/bloc/sign_up_bloc.dart';
import 'package:ui/ui.dart';
import 'package:utility/utility.dart';

class SignUpPage extends StatelessWidget with AppWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => get<SignUpBloc>(),
        child: buildAppWidget(
          Column(
            children: [
              Builder(
                builder: (context) => TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'EMAIL',
                  ),
                ),
              ),
              Builder(
                builder: (context) => TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'PASSWORD',
                  ),
                ),
              ),
              Builder(
                builder: (context) => TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'ALPHAVANTAGE KEY',
                  ),
                ),
              ),
              Builder(
                builder: (context) => const TextButton(
                  onPressed: null,
                  child: Text('SIGN UP'),
                ),
              ),
            ],
          ),
        ),
      );
}
