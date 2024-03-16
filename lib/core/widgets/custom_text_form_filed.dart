import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    this.validator,
    required this.textEditingController,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
  });
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
