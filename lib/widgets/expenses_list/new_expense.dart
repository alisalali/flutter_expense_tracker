import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  //object handling user inputs
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _presentDatePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
  }

  @override
  void dispose() {
    // This function will remove controller from memory
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Creates a Material Design text field.
          TextField(
            controller: _titleController, // handling input with Text
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              //The decoration to show around the text field.
              label: Text("Title"),
            ),
          ),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController, // handling input with Text
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    //The decoration to show around the text field.
                    label: Text("Amount"),
                    prefixText: '\$',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Select date'),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  // execute event to save inputs fields
                  print(_titleController.text);
                  print(_amountController.text);
                },
                child: const Text("Save Expense"),
              )
            ],
          )
        ],
      ),
    );
  }
}
