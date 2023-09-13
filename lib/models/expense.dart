import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; // generate unique id , install this using $ flutter pub uuid
import 'package:intl/intl.dart'; // formatting date package

const uuid = Uuid(); //initialize class for uuid package
final formatter = DateFormat.yMd(); //initialize class formate date

enum Category {
  food,
  travel,
  leisure,
  work,
} //define custom type predefine value

//formatting category icons with enum as object
const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); //assign random id string with uuid package

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  //formatting date with  intl package
  String get formattedDate {
    return formatter.format(date); //pass date to formatter
  }
}

class ExpenseBucket {
  ExpenseBucket({
    required this.category,
    required this.expenses,
  });
  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
