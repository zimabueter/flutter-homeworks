import 'package:final_flutter/data/database/database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'edit_modal.dart';

class DetailModalBottom extends StatelessWidget {
  const DetailModalBottom({
    Key? key,
    this.expense,
  }) : super(key: key);
  final expense;

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, 
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete Expense'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Are you sure you want to delete this expense?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Delete'),
                onPressed: () {
                  Database.deleteExpense(docId: expense.id);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Container(
      height: 400,
      decoration: const BoxDecoration(
        color: Color(0xffCEF7ED),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Text(
              expense.get("title"),
                               style: GoogleFonts.poppins(fontSize: 27.0),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  "Expense Amount",
                  style: GoogleFonts.poppins(fontSize: 18.0),
                ),
                Text(
                  expense.get("expenseAmount")!.toStringAsFixed(2),
                  style: GoogleFonts.poppins(fontSize: 18.0),
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  "Date: ",
               
                  style: GoogleFonts.poppins(fontSize: 18.0),
                ),
                Text(
                  expense.get("date"),
                  style: GoogleFonts.poppins(fontSize: 18.0),
                )
              ],
            ),
            const SizedBox(
              height: 80.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 75.0,
                  height: 75.0,
                  decoration: const BoxDecoration(
                      color: Color(0xff267B7B), shape: BoxShape.circle),
                  child: GestureDetector(
                    onTap: () => {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return EditModalBottom(
                              expense: expense,
                              isLongPress: false,
                            );
                          }),
                    },
                    child: const Center(
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 35.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 75.0,
                  height: 75.0,
                  decoration: const BoxDecoration(
                    color: Color(0xff267B7B),
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () => {_showMyDialog()},
                    child: const Center(
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 35.0,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
