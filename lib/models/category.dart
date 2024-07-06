import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/dummy_data.dart';

class Category {
  const Category(
      {required this.id, required this.title, this.color = Colors.orange});

  final String id;
  final String title;
  final Color color;

  get meals {
    return dummyMeals.where((meal) => meal.categories.contains(id)).toList();
  }
}
