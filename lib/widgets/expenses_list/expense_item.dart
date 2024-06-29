import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(expense.title,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text("\$${expense.amount.toStringAsFixed(2)}"),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(categoryIcons[expense.category]),
                        const SizedBox(width: 8),
                        Text(expense.formattedDate)
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
