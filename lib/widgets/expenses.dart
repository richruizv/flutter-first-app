import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/expenses.dart';
import 'package:flutter_test_app/models/expense.dart';
import 'package:flutter_test_app/widgets/chart/chart.dart';
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
  //final List<Expense> _registeredExpenses = [];
  final _registeredExpenses = dummyExpenses;

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return NewExpense(onAddExpense: _addExpense);
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
            label: 'undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            })));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent =
        const Center(child: Text('No expenses found. Start adding some!'));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(
        appBar: AppBar(title: const Text('Flutter Expense Tracker'), actions: [
          IconButton(
              icon: const Icon(Icons.add), onPressed: _openAddExpenseOverlay)
        ]),
        body: width < 600
            ? Column(children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent)
              ])
            : Row(children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(child: mainContent)
              ]));
  }
}
