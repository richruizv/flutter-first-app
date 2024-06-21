import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;
  
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: expenses.map((expense) {
        return Text(expense.title);
      }).toList()
    );
  }
}