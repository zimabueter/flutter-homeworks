import 'package:flutter/material.dart';

class ClothesTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;
  final String errorText;


  const ClothesTextFormField({Key? key, required this.controller, required this.textInputType, required this.hintText, required this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: hintText, contentPadding: const EdgeInsets.all(16)),
        keyboardType: textInputType,
        onChanged: (value) {
          controller.selection = TextSelection.fromPosition(
              TextPosition(offset: controller.text.length));
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorText;
          }
          return null;
        },
      ),
    );
  }
}