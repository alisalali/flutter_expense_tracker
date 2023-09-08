import 'package:uuid/uuid.dart'; // generate unique id , install this using $ flutter pub uuid

const uuid = Uuid(); //initialize class for uuid package

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid.v4(); //assign random id string with uuid package

  final String id;
  final String title;
  final double amount;
  final DateTime date;
}
