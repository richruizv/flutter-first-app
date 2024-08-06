import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/dummy_items.dart';
import 'package:flutter_test_app/widgets/groceries_list_item.dart';

class GroceriesList extends StatelessWidget {
  const GroceriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: groceryItems
          .map((item) => GroceriesListItem(groceryItem: item))
          .toList(),
    );
  }
}
