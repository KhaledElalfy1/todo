import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    this.validator,
    required this.textEditingController,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon, this.keyboardType, this.label,
  });
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget?label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:keyboardType ,
      controller: textEditingController,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        label:label ,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
