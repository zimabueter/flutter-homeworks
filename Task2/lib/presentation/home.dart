
import 'package:flutter/material.dart';
import 'package:hometask2/logic/conversion.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyHomePage> {
  String? convertFromMetric;
  String? convertToMetric;
  double amountOfInput = 0;
  double res = 0;

  final FocusNode focusNode = FocusNode();
  final TextEditingController textEditingController = TextEditingController();

  final List<String> metrics = [
    'CM',
    'M',
    'KM',
  ];

  @override
  Widget build(BuildContext context) {
    final deviceProportions = MediaQuery.of(context).size;
    return Listener(
      onPointerDown: (_) => {focusNode.unfocus()},
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: const [],
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              "Metrics Converter",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 37,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 45),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Number:",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40,
                          width: 120,
                          child: Center(
                            child: TextField(
                                focusNode: focusNode,
                                controller: textEditingController,
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.white,
                                style: const TextStyle(color: Colors.white),
                                onChanged: (e) {
                                  setState(() {
                                    var value = double.tryParse(e);
                                    if (value != null) {
                                      amountOfInput = value;
                                    }
                                  });
                                },
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(60)))),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                            height: deviceProportions.height / 2.3,
                            decoration: BoxDecoration(
                                color: Colors.blue[200],
                                shape: BoxShape.circle)),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 85),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'From:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(45),
                                    ),
                                    width: 110,
                                    height: 70,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        selectedItemBuilder: (_) => metrics
                                            .map((e) => Center(child: Text(e)))
                                            .toList(),
                                        value: convertFromMetric,
                                        iconEnabledColor: Colors.blue,
                                        borderRadius: BorderRadius.circular(45),
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        items: metrics
                                            .map(
                                              (metric) =>
                                              DropdownMenuItem<String>(
                                                value: metric,
                                                child: Text(
                                                  metric,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                        )
                                            .toList(),
                                        onChanged: (dynamic value) {
                                          setState(() {
                                            convertFromMetric = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'To:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(45),
                                    ),
                                    width: 110,
                                    height: 70,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        selectedItemBuilder: (_) => metrics
                                            .map((e) => Center(child: Text(e)))
                                            .toList(),
                                        value: convertToMetric,
                                        iconEnabledColor: Colors.blue,
                                        borderRadius: BorderRadius.circular(45),
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        items: metrics
                                            .map(
                                              (metric) =>
                                              DropdownMenuItem<String>(
                                                value: metric,
                                                child: Text(
                                                  metric,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                         )
                                            .toList(),
                                        onChanged: (dynamic value) {
                                          setState(() {
                                            convertToMetric = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Result:",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Container(
                            width: 130,
                            decoration: const BoxDecoration(color: Colors.blue),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                "$res",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.blue),
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {
                            if (convertFromMetric == null ||
                                convertToMetric == null ||
                                amountOfInput == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select everything!'),
                                ),
                              );
                            } else {
                              setState(() {
                                res = Converter().convert(
                                    convertFromMetric, convertToMetric, amountOfInput);
                              });
                            }
                          },
                          child: const Text(
                            "CONVERSION",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.blue),
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {
                            setState(() {
                              focusNode.unfocus();
                              textEditingController.clear();
                              amountOfInput = 0;
                              res = 0;
                              convertFromMetric = null;
                              convertToMetric = null;
                            });
                          },
                          child: const Text(
                            "RESET",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
