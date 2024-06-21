import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/expenses.dart';
import 'package:flutter_test_app/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Text('The chart'),
      Expanded(child: ExpensesList(expenses: dummyExpenses))
    ]));
  }
}
