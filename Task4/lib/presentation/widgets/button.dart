import 'package:flutter/material.dart';
import 'package:hometask1/providers/provider_animal.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  final String content;
  const Button({Key? key, required this.content, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<ProviderAnimal>().changeAnimal(content);
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
