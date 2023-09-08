import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  }); //define class property contractor

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    /*   
    if you have a list unclear length use ListView widget 
    A scrollable list of widgets arranged linearly. 
    
    ListView() constructor is appropriate for list views with a small number
               of children because constructing the [List] 
    ListView.builder() Creates a scrollable, linear array of widgets that are created on demand.
    */
    return ListView.builder(
      itemCount: expenses.length, // define the length of scrollable list
      itemBuilder: (ctx, index) =>
          Text(expenses[index].title), // define widget list
    );
  }
}
