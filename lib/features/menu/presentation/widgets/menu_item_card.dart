import 'package:flutter/material.dart';
import 'quantity_stepper.dart';

class MenuItemData {
  final String id;
  final String name;
  final double price;
  final int quantity;

  const MenuItemData({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class MenuItemList extends StatelessWidget {
  final List<MenuItemData> items;
  final Function(String id) onIncrement;
  final Function(String id) onDecrement;

  const MenuItemList({
    super.key,
    required this.items,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text('Menu tidak ditemukan'),
      );
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            title: Text(item.name),
            subtitle: Text('Rp ${item.price.toStringAsFixed(0)}'),
            trailing: QuantityStepper(
              quantity: item.quantity,
              onIncrement: () => onIncrement(item.id),
              onDecrement: () => onDecrement(item.id),
            ),
          ),
        );
      },
    );
  }
}