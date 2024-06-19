import 'package:flutter/material.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';

class CustomTimerButton extends StatelessWidget {
  const CustomTimerButton(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.icon});

  final void Function() onPressed;
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon),
          Text(
            label,
            style: AppFonts.medium20White,
          ),
        ],
      ),
    );
  }
}
