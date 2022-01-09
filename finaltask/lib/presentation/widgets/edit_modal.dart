import 'package:another_flushbar/flushbar.dart';
import 'package:final_flutter/data/database/database.dart';
import 'package:final_flutter/data/models/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EditModalBottom extends StatefulWidget {
  const EditModalBottom({
    Key? key,
    this.expense,
    this.isLongPress,
  }) : super(key: key);
  final expense;
  final isLongPress;
  @override
  _EditModalBottomState createState() => _EditModalBottomState();
}

class _EditModalBottomState extends State<EditModalBottom> {
  late TextEditingController expensesTitleController;
  late TextEditingController expensesIdController;
  late TextEditingController expensesAmountController;
  late TextEditingController expensesDateController;

  @override
  void initState() {
    expensesIdController =
        TextEditingController(text: widget.expense.get('docId')!.toString());
    expensesTitleController =
        TextEditingController(text: widget.expense.get('title'));
    expensesAmountController = TextEditingController(
        text: widget.expense.get('expenseAmount')!.toStringAsFixed(2));
    expensesDateController =
        TextEditingController(text: widget.expense.get('date'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String chosenDate = '';

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
              height: 1.0,
            ),
            TextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: expensesIdController,
              decoration: InputDecoration(
                hintText: "Expense ID",
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      const BorderSide(color: Colors.white, width: 2.0),
                ),
           
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: expensesAmountController,
              decoration: InputDecoration(
                hintText: "Expense Amount",
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      const BorderSide(color: Colors.white, width: 2.0),
                ),
               
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(
              height: 25.0,
            ),
            TextField(
              controller: expensesTitleController,
              decoration: InputDecoration(
                hintText: "Expense Title",
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      const BorderSide(color: Colors.white, width: 2.0),
                ),
            
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  expensesDateController.text,
                  style: GoogleFonts.poppins(fontSize: 18.0),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    primary: Colors.white,
                    backgroundColor: const Color(0xff267B7B),
                    textStyle: GoogleFonts.poppins(fontSize: 18.0),
                  ),
                  onPressed: () => {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2019),
                            lastDate: DateTime(2030))
                        .then((value) => chosenDate =
                            DateFormat("dd-MM-yyyy").format(value!))
                  },
                  child: const Text("Pick Date"),
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Center(
              child: SizedBox(
                width: 150.0,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    primary: Colors.white,
                    backgroundColor: const Color(0xff267B7B),
                    textStyle: GoogleFonts.poppins(fontSize: 20.0),
                  ),
                  onPressed: () => {
                    // debugPrint(widget.expense.id),
                    if (expensesIdController.text == "" ||
                        expensesAmountController.text == "")
                      {
                        Flushbar(
                          duration: const Duration(seconds: 3),
                          message: "Please enter expense ID and expense amount",
                        )..show(context)
                      }
                    else
                      {
                        Database.updateExpense(
                          id: widget.expense.id,
                          expense: Expense(
                            docId: int.tryParse(expensesIdController.text),
                            date: chosenDate,
                            title: expensesTitleController.text,
                            expenseAmount:
                                double.tryParse(expensesAmountController.text),
                          ),
                        ),
                        Navigator.pop(context),
                        !widget.isLongPress ? Navigator.pop(context) : ''
                      },
                  },
                  child: const Text("EDIT"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
