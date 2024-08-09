import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/grocery_item.dart';
import 'package:flutter_test_app/widgets/groceries_list_item.dart';

class GroceriesList extends StatelessWidget {
  final List<GroceryItem> groceryItems;

  const GroceriesList({required this.groceryItems, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) => GroceriesListItem(
              groceryItem: groceryItems[index],
            ));
  }
}
