import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {super.key, required this.hintText, required this.textEditingController});
  final String hintText;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(),
      ),
    );
  }
}
