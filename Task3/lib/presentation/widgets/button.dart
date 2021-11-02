import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String content;
  final Function(String animalName) onClick;
  const Button({Key? key, required this.content, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onClick(content);
        },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(110, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Text(
          content,
          style: const TextStyle(fontSize: 16),
        ));
  }
}
