import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Error message: Name is not present';
                  }

                  value = value.trim();

                  if (value.length <= 1 || value.length > 50) {
                    return 'Error message: Must be between 1 and 50 characters.';
                  }

                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: '1',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Error message: Name is not present';
                        }
                        final number = int.tryParse(value);

                        if (number == null || number <= 0) {
                          return 'Must be a valid, positive number.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          label: Text(''),
                        ),
                        items: [
                          for (final category in categories.entries)
                            DropdownMenuItem(
                                value: category.value,
                                child: Row(children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    color: category.value.color,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(category.value.name)
                                ])),
                        ],
                        onChanged: (value) {}),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('reset'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add button'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
