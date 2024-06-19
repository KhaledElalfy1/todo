import 'package:flutter/material.dart';

class CustomTaskTextFiled extends StatelessWidget {
  const CustomTaskTextFiled({super.key, required this.textEditingController, required this.hintText});
  final TextEditingController textEditingController;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText:hintText ,
        enabledBorder: InputBorder.none,

      ),
    );
  }
}