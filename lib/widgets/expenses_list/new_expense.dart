import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  var _enteredTitle = ''; // global var for title var

  void _onSaveTitle(String inputValue) {
    /* 
    This function handle key stroke input value then
    store it in  _enteredTitle var
    
     */
    _enteredTitle = inputValue; // store input stroke to title var
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Creates a Material Design text field.
          TextField(
            onChanged:
                _onSaveTitle, // will pass keystroke to _onSaveTitle function
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
                  print(_enteredTitle);
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
