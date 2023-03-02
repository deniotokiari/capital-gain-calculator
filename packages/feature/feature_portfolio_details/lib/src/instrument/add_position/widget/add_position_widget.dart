import 'package:feature_portfolio_details/src/instrument/add_position/bloc/add_position_bloc.dart';
import 'package:feature_portfolio_details/src/instrument/add_position/bloc/add_position_event.dart';
import 'package:feature_portfolio_details/src/instrument/add_position/bloc/add_position_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utility/utility.dart';

class AddPositionWidget extends StatelessWidget {
  final String _instrumentId;

  const AddPositionWidget(
    this._instrumentId, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => get<AddPositionBloc>()..add(AddPositionEvent.init(_instrumentId)),
        child: AlertDialog(
          title: const Text('Add Position'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getCountWidget(),
              _getPriceWidget(),
              _getCurrencyWidget(),
              _getDateWidget(),
            ],
          ),
          actions: [
            _getSubmitWidget(),
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          ],
        ),
      );

  Widget _getCountWidget() => Builder(
        builder: (context) => TextField(
          onChanged: (text) => context.read<AddPositionBloc>().add(AddPositionEvent.countChanged(text)),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)')),
          ],
          decoration: const InputDecoration(border: UnderlineInputBorder(), labelText: 'Count'),
        ),
      );

  Widget _getPriceWidget() => Builder(
        builder: (context) => TextField(
          onChanged: (text) => context.read<AddPositionBloc>().add(AddPositionEvent.priceChanged(text)),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)')),
          ],
          decoration: const InputDecoration(border: UnderlineInputBorder(), labelText: 'Price'),
        ),
      );

  Widget _getCurrencyWidget() => BlocBuilder<AddPositionBloc, AddPositionState>(
        builder: (context, state) {
          if (state.currency == null) {
            return const CircularProgressIndicator.adaptive();
          } else {
            return DropdownButton<String>(
              focusNode: _AlwaysDisabledFocusNode(),
              isExpanded: true,
              value: state.currency,
              items: [...state.currencyList.map((e) => DropdownMenuItem(value: e, child: Text(e)))],
              onChanged: null,
            );
          }
        },
      );

  Widget _getDateWidget() => BlocBuilder<AddPositionBloc, AddPositionState>(
        builder: (context, state) {
          final controller = TextEditingController.fromValue(TextEditingValue(text: state.date.ddMMYYYY));

          return TextField(
            focusNode: _AlwaysDisabledFocusNode(),
            enableInteractiveSelection: false,
            mouseCursor: MaterialStateMouseCursor.clickable,
            controller: controller,
            decoration: const InputDecoration(labelText: "Date"),
            readOnly: true,
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: state.date,
                firstDate: DateTime.now().add(const Duration(days: -365 * 100)),
                lastDate: DateTime.now(),
              );

              if (date != null) {
                controller.text = date.ddMMYYYY;

                if (context.mounted) {
                  context.read<AddPositionBloc>().add(AddPositionEventDateChanged(date));
                }
              }
            },
          );
        },
      );

  Widget _getSubmitWidget() => BlocBuilder<AddPositionBloc, AddPositionState>(
        builder: (context, state) => TextButton(
          onPressed: state.submitEnabled
              ? () {
                  context.read<AddPositionBloc>().add(AddPositionEvent.submit());
                  Navigator.of(context).pop();
                }
              : null,
          child: const Text('Submit'),
        ),
      );
}

class _AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
