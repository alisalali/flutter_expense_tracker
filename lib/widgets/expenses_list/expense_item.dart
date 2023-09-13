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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge, // reaching theme style elements
            ),
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
                    Icon(categoryIcon[expense
                        .category]), // pass expense category to category constant object as enum value Model file
                    const SizedBox(width: 8),
                    Text(expense
                        .formattedDate), //to display date with formatted get function on Model file
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
