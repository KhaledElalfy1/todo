import 'package:flutter/material.dart';

class CustomTaskTextFiled extends StatelessWidget {
  const CustomTaskTextFiled({super.key, required this.textEditingController});
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,

      ),
    );
  }
}