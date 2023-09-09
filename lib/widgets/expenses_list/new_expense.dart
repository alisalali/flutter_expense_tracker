import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController =
      TextEditingController(); //object handling user inputs

  @override
  void dispose() {
    _titleController.dispose();
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
              ElevatedButton(
                onPressed: () {
                  // execute event to save inputs field
                  print(_titleController.text);
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
