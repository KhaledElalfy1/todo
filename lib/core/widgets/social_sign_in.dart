import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/custom_transparent_button.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({
    super.key,
    required this.iconPath,
    required this.text,
    this.onPressed,
  });
  final String iconPath, text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomTransparentButton(
      onPressed:onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath),
          Gap(10.w),
          Text(
            text,
            style: AppFonts.regular20White,
          ),
        ],
      ),
    );
  }
}
