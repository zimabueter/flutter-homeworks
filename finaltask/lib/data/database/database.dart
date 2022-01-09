import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter/data/models/expenses.dart';
import 'package:flutter/cupertino.dart';
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection("users");

class Database {
  static String? userId;

  static Future<void> addExpense({required Expense expense}) async {
    DocumentReference documentReference =
        _collectionReference.doc(userId).collection("expenses").doc();

    var data = <String, dynamic>{
      "docId":expense.docId,
      "title": expense.title,
      "expenseAmount": expense.expenseAmount,
      "date": expense.date
    };

    await documentReference
        .set(data)
        .whenComplete(() => debugPrint("added"))
        .catchError((e) => debugPrint(e));
  }

  static Future<QuerySnapshot> readExpenses() async {
    CollectionReference expensesReference =
        _collectionReference.doc(userId).collection("expenses");
    return expensesReference.get();
  }

  static Future<double> calculateTotalExpenses() async {
    QuerySnapshot expenses = await readExpenses();
    double total = 0;

    var i = 0;
    while (i < expenses.size) {
      total += expenses.docs[i].get("expenseAmount");
      i++;
    }
    return total;
  }

  static Stream<QuerySnapshot> readExpensesAsStream() {
    CollectionReference expensesReference =
        _collectionReference.doc(userId).collection("expenses");
    return expensesReference.snapshots();
  }

static Future<void> updateExpense(
      {required String? id, required Expense expense}) async {
    DocumentReference documentReference =
        _collectionReference.doc(userId).collection("expenses").doc(id);

    var data = <String, dynamic>{
      "docId":expense.docId,
      "title": expense.title,
      "expenseAmount": expense.expenseAmount,
      "date": expense.date
    };

    await documentReference
        .update(data)
        .whenComplete(() => debugPrint("expense updated!"))
        .catchError((e) => debugPrint(e));
  }

  static Future<void> deleteExpense({required String docId}) async {
    DocumentReference documentReference =
        _collectionReference.doc(userId).collection("expenses").doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => debugPrint("deleted"))
        .catchError((e) => debugPrint(e));
  }
}
