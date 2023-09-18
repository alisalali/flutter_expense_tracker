import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses_list/new_expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  //define dummy data by importing expense modals package
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "sandwich",
        amount: 20.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Flutter Course",
        amount: 9,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: 20.99,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "fashion",
        amount: 20.99,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Rugby",
        amount: 20.99,
        date: DateTime.now(),
        category: Category.leisure)
  ];
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    /* 
    /// This function will remove 
     */
    // getting index of deleted item on the list
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    /* 
    snackBar to show message in ui for undo method ,
    using Manages [SnackBar]s and [MaterialBanner]s for descendant [Scaffold]s.
     */
    ScaffoldMessenger.of(context).clearSnackBars(); // to clear snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    //Shows a modal Material Design bottom sheet.
    showModalBottomSheet(
      useSafeArea: true, // safe area to stay away from device toolbar
      context: context,
      isScrollControlled: true,
      /* 
           context property is metadata collection mange by flutter
           overall widget tree extend by the class
       */
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    /* 
    validate main content to make sure _registeredExpenses [List]
    has items on list or showing message 
     */

    final width = MediaQuery.of(context)
        .size
        .width; // width space available in media query

    Widget mainContent = const Center(
      child: Text("No expenses found. Start adding some !"),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    } // end validation
    return Scaffold(
      // An app bar to display at the top of the scaffold.
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          //A list of Widgets to display in a row after the [title] widget.
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600 // validate width space available in media query
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                // because ListView rendering a column inside column  should wrap it with Expanded widget to display
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                // because ListView rendering a column inside column  should wrap it with Expanded widget to display
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
