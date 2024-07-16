import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/dummy_data.dart';
import 'package:flutter_test_app/models/category.dart';
import 'package:flutter_test_app/models/meal.dart';
import 'package:flutter_test_app/screens/meals_screen.dart';
import 'package:flutter_test_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({required this.onClickFavoriteMeal, super.key});

  final void Function(Meal) onClickFavoriteMeal;

  void _selectCategory(BuildContext context, Category category) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: category.meals,
              onClickFavoriteMeal: onClickFavoriteMeal,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: availableCategories.map((category) {
          return CategoryGridItem(
              category: category, onSelectCategory: _selectCategory);
        }).toList());
  }
}
