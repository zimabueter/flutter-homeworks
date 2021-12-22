import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  double paddingTop;
  Color color;
  String title;
  List<Widget>? actions;

  Header(
      {Key? key,
      required this.paddingTop,
      required this.color,
      required this.title,
      this.actions})
      : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      backgroundColor: color,
      elevation: 0,
      actions: actions,
    );
  }
}
