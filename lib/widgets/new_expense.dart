import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/helper/date_formatter.dart';
import 'package:flutter_test_app/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;

  _clearForm() {
    Navigator.pop(context);
  }

  _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final datePicked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = datePicked;
    });
  }

  _selectCategory(value) {
    if (value != null) {
      setState(() {
        _selectedCategory = value;
      });
    }
  }

  _submitForm() {
    final title = _titleController.text.trim();
    final enteredAmount = double.tryParse(_amountController.text);
    final validAmount = enteredAmount != null && enteredAmount > 0;
    final date = _selectedDate;
    final category = _selectedCategory;

    if (title.isEmpty || !validAmount || date == null || category == null) {
      print('Missing attributies');
      return;
    }

    widget.onAddExpense(Expense(
        title: title, amount: enteredAmount, date: date, category: category));
    _clearForm();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
          child: Column(
            children: [
              TextField(
                  controller: _titleController,
                  maxLength: 50,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(label: Text('Title'))),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'))
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        prefixText: '\$ ',
                      ),
                    ),
                  ),
                  const VerticalDivider(width: 1.0),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _selectedDate == null
                              ? 'No date selected.'
                              : formatter(_selectedDate),
                          style: const TextStyle(fontSize: 12),
                        ),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: _presentDatePicker,
                            icon: const Icon(Icons.calendar_month))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButton(
                        value: _selectedCategory,
                        isExpanded: true,
                        items: Category.values
                            .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name),
                                ))
                            .toList(),
                        onChanged: _selectCategory),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: _clearForm, child: const Text('Cancel')),
                  ElevatedButton(
                      onPressed: _submitForm, child: const Text('Save Expense'))
                ],
              )
            ],
          )),
    );
  }
}
