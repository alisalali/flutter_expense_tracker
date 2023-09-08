import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    // card widget material
    return Card(
/*       wrap content with padding widget 
        to padding card to each other then create columns and rows for inside design
 */
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            //combine amount,spacer,category date in one row in column
            Row(
              children: [
                // to display 2 digits toStringAsFixed(2) with $ sign
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                ),
                //Creates a flexible space
                const Spacer(),
                // to have item to the right space
                Row(
                  children: [
                    const Icon(Icons.alarm), // showing icon symbol
                    const SizedBox(width: 8),
                    Text(expense.date.toString()), //to display date as string
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
