import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/dummy_items.dart';
import 'package:flutter_test_app/models/grocery_item.dart';
import 'package:flutter_test_app/widgets/groceries_list.dart';
import 'package:flutter_test_app/widgets/new_item.dart';

class Groceries extends StatefulWidget {
  const Groceries({super.key});

  @override
  State<Groceries> createState() {
    return _GroceriesState();
  }
}

class _GroceriesState extends State<Groceries> {
  final List<GroceryItem> _groceryItems = dummyGroceryItems;

  Future<void> _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (ctx) => const NewItem()),
    );

    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Your Groceries'), actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ]),
        body: Center(
          child: GroceriesList(groceryItems: _groceryItems),
        ));
  }
}
