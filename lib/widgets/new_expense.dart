import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  var _titleValue = '';

  _changeTitleField(value) {
    _titleValue = value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
                maxLength: 50,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(label: Text('Title')),
                onChanged: _changeTitleField),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () => print(_titleValue),
                    child: const Text('Save Expense'))
              ],
            )
          ],
        ));
  }
}
