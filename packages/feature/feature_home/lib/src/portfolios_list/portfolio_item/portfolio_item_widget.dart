import 'package:feature_home/src/portfolios_list/bloc/portfolios_list_state.dart';
import 'package:flutter/material.dart';

class PortfolioItemWidget extends StatelessWidget {
  final PortfolioViewModel _item;
  final void Function(String id) _onDelete;

  const PortfolioItemWidget(this._item, this._onDelete, {super.key});

  @override
  Widget build(BuildContext context) => ListTile(
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text('Are you shure to delete ${_item.name}?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            _onDelete(_item.id);

                            Navigator.of(context).pop();
                          },
                          child: const Text('YES')),
                      TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('NO')),
                    ],
                  ));
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(_item.name)),
          ],
        ),
      );
}
