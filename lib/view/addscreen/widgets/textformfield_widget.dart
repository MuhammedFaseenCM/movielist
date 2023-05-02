import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  const TextFormFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      this.keyBoardType = TextInputType.name});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: hintText),
      keyboardType: keyBoardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter the $hintText';
        } else {
          return null;
        }
      },
    );
  }
}
