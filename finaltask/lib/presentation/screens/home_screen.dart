import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter/data/database/database.dart';
import 'package:final_flutter/data/repositories/expenses_repo.dart';
import 'package:final_flutter/presentation/widgets/add_modal.dart';
import 'package:final_flutter/presentation/widgets/detail_modal.dart';
import 'package:final_flutter/presentation/widgets/edit_modal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/decoration.png',
                fit: BoxFit.fitWidth,
                height: 400.0,
              ),
              Positioned(
                top: 137.0,
                left: 20.0,
                child: Row(
                  children: [
                    Center(
                      child: Text(
                        "Personal Expenses",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 25.0, color: Color(0xff707070))),
                      ),
                    ),
                    Container(width: width * 0.25, color: Colors.transparent),
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: const Color(0xff267B7B),
                      onPressed: () => {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const AddModalBottom();
                            }),
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 31,
                  child: Consumer<ExpenseRepository>(
                    builder: (BuildContext context, expense, Widget? child) {
                      return Container(
                        width: width * 0.85,
                        height: 200,
                        padding: const EdgeInsets.only(top: 67.0, left: 21.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                            border: Border.all(
                                width: 1.0, color: const Color(0xffBAB8B8))),
                        child: Text(
                          "${expense.totalExpenses!.toStringAsFixed(2)}\$",
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      );
                    },
                  ))
            ],
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: Database.readExpensesAsStream(),
              builder: (context, snapshot) {
                if (kDebugMode) {
                  print(snapshot.hasData);
                }
                if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong!"));
                }

                if (snapshot.hasData || snapshot.data != null) {
                  Provider.of<ExpenseRepository>(context, listen: false)
                      .calculateTotalExpenses();
                  return ListView.builder(
                    padding: const EdgeInsets.all(20.0),
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffBAB8B8).withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 25,
                              offset: const Offset(
                                  0, 0), 
                            ),
                          ],
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(
                              color: Color(0xffBAB8B8),
                              width: 1.0,
                            ),
                          ),
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 20.0),
                            child: ListTile(
                              onLongPress: () => {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return EditModalBottom(
                                          isLongPress: true,
                                          expense: snapshot.data!.docs[index]);
                                    }),
                              },
                              onTap: () => {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return DetailModalBottom(
                                          expense: snapshot.data!.docs[index]);
                                    }),
                              },
                              title: Text(
                                snapshot.data!.docs[index].get("title"),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff707070),
                                ),
                              ),
                              subtitle: Text(
                                snapshot.data!.docs[index].get("date"),
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xffC2C2C2),
                                ),
                              ),
                              trailing: Text(
                                  "${snapshot.data!.docs[index].get("expenseAmount")!.toStringAsFixed(2)}\$",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Color(0xff707070),
                                  )),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}

