import 'package:flutter/material.dart';
import 'package:testfirebase/core/utils/app_color.dart';

class CustomTransparentButton extends StatelessWidget {
  const CustomTransparentButton(
      {super.key, this.onPressed, required this.child});
  final void Function()? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        side: WidgetStatePropertyAll(
          BorderSide(
            color: AppColor.primaryColor,
            width: 2,
          ),
        ),
      ),
      child: child,
    );
  }
}
