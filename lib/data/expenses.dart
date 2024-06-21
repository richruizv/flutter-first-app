import 'package:flutter_test_app/models/expense.dart';

List<Expense> dummyExpenses = [
  Expense(
    title: 'Grocery Shopping',
    amount: 55.30,
    date: DateTime(2023, 4, 1),
    category: Category.food,
  ),
  Expense(
    title: 'Train Ticket',
    amount: 15.75,
    date: DateTime(2023, 4, 2),
    category: Category.travel,
  ),
  Expense(
    title: 'Movie Night',
    amount: 20.00,
    date: DateTime(2023, 4, 3),
    category: Category.leisure,
  ),
  Expense(
    title: 'Office Supplies',
    amount: 40.50,
    date: DateTime(2023, 4, 4),
    category: Category.work,
  ),Expense(
  title: 'Groceries',
  amount: 75.30,
  date: DateTime(2023, 4, 5),
  category: Category.groceries,
),
Expense(
  title: 'Gym Membership',
  amount: 50.00,
  date: DateTime(2023, 4, 6),
  category: Category.health,
),
Expense(
  title: 'Electricity Bill',
  amount: 60.00,
  date: DateTime(2023, 4, 7),
  category: Category.utilities,
),
Expense(
  title: 'Internet Bill',
  amount: 30.00,
  date: DateTime(2023, 4, 8),
  category: Category.utilities,
),
Expense(
  title: 'Birthday Gift',
  amount: 45.00,
  date: DateTime(2023, 4, 9),
  category: Category.gifts,
),
Expense(
  title: 'Car Repair',
  amount: 235.00,
  date: DateTime(2023, 4, 10),
  category: Category.transportation,
),
];