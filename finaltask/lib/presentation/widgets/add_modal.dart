import 'package:another_flushbar/flushbar.dart';
import 'package:final_flutter/data/database/database.dart';
import 'package:final_flutter/data/models/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddModalBottom extends StatefulWidget {
  const AddModalBottom({
    Key? key,
  }) : super(key: key);

  @override
  _AddModalBottomState createState() => _AddModalBottomState();
}

class _AddModalBottomState extends State<AddModalBottom> {
  String chosenDate = '';
  TextEditingController expensesTitleController = TextEditingController();
  TextEditingController expensesIdController = TextEditingController();
  TextEditingController expensesAmountController = TextEditingController();
  TextEditingController expensesDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                hintText: "Please enter expense ID",
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      const BorderSide(color: Color(0xff707070), width: 2.0),
                ),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: expensesAmountController,
              decoration: InputDecoration(
                hintText: "Please enter expense amount",
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      const BorderSide(color: Color(0xff707070), width: 2.0),
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
                hintText: "Please enter expense title",
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      const BorderSide(color: Color(0xff707070), width: 2.0),
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
                  "Pick Date ",
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
            Container(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 125.0,
                child: TextButton(
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
                        Database.addExpense(
                            expense: Expense(
                                docId: int.tryParse(expensesIdController.text),
                                title: expensesTitleController.text,
                                expenseAmount: double.tryParse(
                                    expensesAmountController.text),
                                date: chosenDate)),
                        Navigator.pop(context)
                      }
                  },
                  child: const Text("ADD"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
