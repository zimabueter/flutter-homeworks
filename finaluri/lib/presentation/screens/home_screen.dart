import 'package:final_flutter/presentation/widgets/add_modal.dart';
import 'package:final_flutter/presentation/widgets/animated_list_item.dart';
import 'package:final_flutter/providers/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _getExpenses() async {
    var provider = Provider.of<StateProvider>(context, listen: false);
    await provider.setExpensesList(notify: false);
    provider.setTotalExpenses(notify: false);

    provider.setIsProcessing(false);
  }

  @override
  void initState() {
    super.initState();
    _getExpenses();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Widget upperBackGroundSection = Container(
      margin: const EdgeInsets.only(bottom: 100.0),
      alignment: Alignment.topCenter,
      height: 300.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/decoration.png"),
          fit: BoxFit.cover,
        ),
      ),
    );

    Widget headerSection = Positioned(
      top: 117.0,
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
                      })
                  .whenComplete(() =>
                      Provider.of<StateProvider>(context, listen: false)
                          .setInsertSelectedDate('', notify: true)),
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    Widget topCardSection = Positioned(
      top: 150.0,
      right: 0.0,
      left: 0.0,
      child: Container(
        height: 260,
        width: 400.0,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        child: Card(
          elevation: 6.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 20),
            child: Center(
              child: ListTile(
                title: Text(
                  "${num.parse(Provider.of<StateProvider>(context, listen: true).totalExpenses.toStringAsFixed(3))} \$",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff484848),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Widget bottomListView = Container(
      margin: const EdgeInsets.only(left: 40.0, right: 40, bottom: 40),
      child: ListView.builder(
        itemCount:
            Provider.of<StateProvider>(context, listen: false).listLength,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, int index) {
          var expense = Provider.of<StateProvider>(context, listen: false)
              .getExpenseByIndex(index);
          return AnimatedListItem(
            index: index,
            expense: expense,
          );
        },
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<StateProvider>(
          builder: (_, provider, __) => provider.isProcessing
              ? const Center(
                  heightFactor: 25,
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Stack(
                      children: [
                        upperBackGroundSection,
                        headerSection,
                        topCardSection,
                      ],
                    ),
                    bottomListView,
                  ],
                ),
        ),
      ),
    );
  }
}
