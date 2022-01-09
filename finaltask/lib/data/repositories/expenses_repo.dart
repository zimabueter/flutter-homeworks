import 'package:final_flutter/data/database/database.dart';
import 'package:flutter/cupertino.dart';

class ExpenseRepository extends ChangeNotifier {
  double? totalExpenses = 0;

  void calculateTotalExpenses() {
    Database.calculateTotalExpenses().then((totalExpenses) =>
        {this.totalExpenses = totalExpenses, notifyListeners()});
  }
}
