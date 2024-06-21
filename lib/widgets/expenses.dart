import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/expenses.dart';
import 'package:flutter_test_app/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_test_app/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const NewExpense();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Flutter Expense Tracker'), actions: [
          IconButton(
              icon: const Icon(Icons.add), onPressed: _openAddExpenseOverlay)
        ]),
        body: Column(children: [
          const Text('The chart!'),
          Expanded(child: ExpensesList(expenses: dummyExpenses))
        ]));
  }
}
