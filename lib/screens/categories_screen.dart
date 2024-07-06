import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/dummy_data.dart';
import 'package:flutter_test_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: const Text('Pick your category')),
        body: GridView(
            padding: const EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: availableCategories.map((category) {
              return CategoryGridItem(category: category);
            }).toList()));
  }
}
