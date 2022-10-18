import 'package:all_portfolios/src/bloc/all_portfolios_bloc.dart';
import 'package:all_portfolios/src/bloc/all_portfolios_event.dart';
import 'package:all_portfolios/src/bloc/all_portfolios_state.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';

class AllPortfoliosWidget extends StatelessWidget {
  const AllPortfoliosWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: ((_) => get<AllPortfoliosBloc>()..add(AllPortfoliosEvent.init())),
        child: BlocBuilder<AllPortfoliosBloc, AllPortfoliosState>(
          builder: ((_, state) => Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.model.portfolios.length,
                  itemBuilder: (_, index) {
                    final item = state.model.portfolios[index];

                    return ListTile(
                      onTap: () {
                        NavigationRoute.portfolio(item.portfolioId).push(context);
                      },
                      title: Text('${item.name} (${item.currency})'),
                    );
                  },
                ),
              )),
        ),
      );
}
