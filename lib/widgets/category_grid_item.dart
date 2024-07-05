import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(category.title, style: const TextStyle(color: Colors.white));
  }
}
