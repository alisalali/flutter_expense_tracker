import 'package:uuid/uuid.dart'; // generate unique id , install this using $ flutter pub uuid

const uuid = Uuid(); //initialize class for uuid package

enum Category {
  food,
  travel,
  leisure,
  work,
} //define custom type predefine value

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
}
