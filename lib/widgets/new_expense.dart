import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  _clearForm() {
    _titleController.clear();
    _amountController.clear();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
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
            TextField(
              controller: _amountController,
              maxLength: 10,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
              ],
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixText: '\$ ',
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: _clearForm, child: const Text('Cancel')),
                ElevatedButton(
                    onPressed: () => print(
                        " ${_titleController.text} ${_amountController.text}"),
                    child: const Text('Save Expense'))
              ],
            )
          ],
        ));
  }
}
