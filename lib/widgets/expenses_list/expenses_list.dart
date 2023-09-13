import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  }); //define class property contractor

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

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
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          background: Container(
            //access of color in colorscheme error obj
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            // access cardTheme object with margin horizontal
            margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            ),
          ),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          child:
              ExpenseItem(expenses[index])), // define widget custom list item
    );
  }
}
