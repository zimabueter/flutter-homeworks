import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Desc extends StatelessWidget {
  final String? desc;
  const Desc({Key? key, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    final bool isVertical = orientation == Orientation.portrait;

    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 30),
      height: 90,
      width: isVertical ? 300 : 200,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Text(
              '$desc',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
