import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_add_position_bloc.dart';
import 'package:portfolio_details/src/bloc/portfolio_add_position_event.dart';
import 'package:portfolio_details/src/bloc/portfolio_add_position_state.dart';

class PortfolioAddPositionWidget extends StatelessWidget {
  final String _instrumentId;

  const PortfolioAddPositionWidget(
    this._instrumentId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) =>
            get<PortfolioAddPositionBloc>()..add(PortfolioAddPositionEvent.init(_instrumentId)),
        child: AlertDialog(
          title: const Text('Add Position'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(builder: (context) {
                return TextFormField(
                  onChanged: (text) {
                    context
                        .read<PortfolioAddPositionBloc>()
                        .add(PortfolioAddPositionEvent.priceChanged(
                          double.tryParse(text),
                        ));
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)')),
                    //TextInputFormatter.withFunction
                  ],
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter total price',
                  ),
                );
              }),
              Builder(builder: (context) {
                return TextFormField(
                  onChanged: (text) {
                    context
                        .read<PortfolioAddPositionBloc>()
                        .add(PortfolioAddPositionEvent.countChanged(
                          double.tryParse(text),
                        ));
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)')),
                    //TextInputFormatter.withFunction
                  ],
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter count',
                  ),
                );
              }),
              Builder(builder: (context) {
                final initialValue = context.read<PortfolioAddPositionBloc>().state.date;
                final controller = TextEditingController.fromValue(
                  TextEditingValue(
                    text: '${initialValue.year}/${initialValue.month}/${initialValue.day}',
                  ),
                );

                return TextField(
                  focusNode: AlwaysDisabledFocusNode(),
                  enableInteractiveSelection: false,
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: "Enter date",
                  ),
                  readOnly: true,
                  onTap: () async {
                    final bloc = context.read<PortfolioAddPositionBloc>();
                    final date = await showDatePicker(
                      context: context,
                      initialDate: bloc.state.date,
                      firstDate: DateTime.now().add(const Duration(days: -365 * 100)),
                      lastDate: DateTime.now(),
                    );

                    if (date != null) {
                      controller.text = '${date.year}/${date.month}/${date.day}';

                      bloc.add(PortfolioAddPositionEvent.dateChanged(date));
                    }
                  },
                );
              }),
            ],
          ),
          actions: [
            BlocBuilder<PortfolioAddPositionBloc, PortfolioAddPositionState>(
                builder: (context, state) {
              return TextButton(
                onPressed: state.map(
                  idle: (idle) => idle.submitEnabled
                      ? () {
                          context.read<PortfolioAddPositionBloc>().add(
                                PortfolioAddPositionEvent.submit(),
                              );

                          Navigator.of(context).pop(const NavigationResult.ok());
                        }
                      : null,
                ),
                child: const Text('Submit'),
              );
            }),
            TextButton(
              onPressed: () => Navigator.of(context).pop(const NavigationResult.cancel()),
              child: const Text('Cancel'),
            ),
          ],
        ),
      );
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
