import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
  health,
  utilities,
  groceries,
  gifts,
  transportation
}

final Map<Category, IconData> categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.leisure: Icons.beach_access,
  Category.work: Icons.work,
  Category.health: Icons.favorite,
  Category.utilities: Icons.lightbulb_outline,
  Category.groceries: Icons.shopping_cart,
  Category.gifts: Icons.card_giftcard,
  Category.transportation: Icons.directions_car,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get formattedDate {
    return '${date.day}/${date.month}/${date.year}';
  }
}
