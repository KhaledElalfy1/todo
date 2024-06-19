import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';

class NavBarIndex extends StatelessWidget {
  const NavBarIndex({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });
  final String iconPath, title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(iconPath),
          Gap(5.h),
          Text(
            title,
            style: AppFonts.regular12White,
          ),
        ],
      ),
    );
  }
}
