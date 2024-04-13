import 'package:flutter/material.dart';
import 'package:testfirebase/core/utils/app_color.dart';
class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    super.key,
    required this.onTap,
    required this.icon,
  });
  final VoidCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColor.darkGray),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon),
      ),
    );
  }
}
