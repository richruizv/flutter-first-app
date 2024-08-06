import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/grocery_item.dart';

class GroceriesListItem extends StatelessWidget {
  final GroceryItem groceryItem;

  const GroceriesListItem({required this.groceryItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            color: groceryItem.category.color,
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(groceryItem.name)),
          Text(groceryItem.quantity.toString())
        ],
      ),
    );
  }
}
