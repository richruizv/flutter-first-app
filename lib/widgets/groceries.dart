import 'package:flutter/material.dart';
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
  void _addItem() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => const NewItem()),
    );
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
        body: const Center(
          child: GroceriesList(),
        ));
  }
}
