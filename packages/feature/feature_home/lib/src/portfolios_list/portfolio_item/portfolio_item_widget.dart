import 'package:auto_route/auto_route.dart';
import 'package:feature_home/src/portfolios_list/bloc/portfolios_list_state.dart';
import 'package:flutter/material.dart';

class PortfolioItemWidget extends StatelessWidget {
  final PortfolioViewModel _item;
  final void Function(String id) _onDelete;

  const PortfolioItemWidget(this._item, this._onDelete, {super.key});

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () => context.router.pushNamed('/portfolio/${_item.id}'),
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
            if (_item.marketValue != null)
              Expanded(
                child: Text(
                  _item.marketValue!.formattedMarket,
                  style: const TextStyle(
                    inherit: true,
                    fontSize: 14,
                  ),
                ),
              ),
            if (_item.marketValue != null)
              Expanded(
                child: Text(
                  _item.marketValue!.formattedInterest,
                  style: TextStyle(
                    inherit: true,
                    fontSize: 14,
                    color: _item.marketValue!.interest.value < 0 ? Colors.red : Colors.green,
                  ),
                ),
              ),
            if (_item.marketValue != null)
              Expanded(
                child: Text(
                  _item.marketValue!.formattedPercent,
                  style: TextStyle(
                    inherit: true,
                    fontSize: 14,
                    color: _item.marketValue!.percent < 0 ? Colors.red : Colors.green,
                  ),
                ),
              ),
          ],
        ),
      );
}
