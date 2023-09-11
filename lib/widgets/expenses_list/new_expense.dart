import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

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
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    //
    /* 
      The returned [Future] resolves to the date selected by the user 
      initial await function will return the value after its resolve pickedDate
      then update the state to set text box with date picked 
    
     */
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
      // print(formattedDate);
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final invalidEnteredAmount = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        invalidEnteredAmount ||
        _selectedDate == null) {
      print("object");

      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Invalid inputs"),
              content: const Text(
                  "Please make sure a valid title,amount,date and category was enter"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          });
      return;
    }
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
                    Text(_selectedDate == null
                        ? 'No date selected'
                        : formatter.format(
                            _selectedDate!)), // (!) to force dart assume value is not null
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
              DropdownButton(
                value: _selectedCategory, // to get value
                items: Category.values
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                // execute event to save inputs fields
                onPressed: _submitExpenseData,
                child: const Text("Save Expense"),
              )
            ],
          )
        ],
      ),
    );
  }
}
