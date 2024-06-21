import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
                controller: _titleController,
                maxLength: 50,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(label: Text('Title'))),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () => print(_titleController.text),
                    child: const Text('Save Expense'))
              ],
            )
          ],
        ));
  }
}