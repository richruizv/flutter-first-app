import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/meal.dart';
import 'package:flutter_test_app/screens/meal_details_screen.dart';
import 'package:flutter_test_app/widgets/meal_item.dart';
import 'package:flutter_test_app/widgets/shared/not_found.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget body = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) =>
          MealItem(meal: meals[index], onSelectMeal: selectMeal),
    );

    if (meals.isEmpty) {
      body = const NotFound(title: 'Try selecting a different category');
    }

    return Scaffold(appBar: AppBar(title: Text(title)), body: body);
  }
}
