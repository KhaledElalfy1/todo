import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/utils/app_images.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'In The Next Next Sprint',
          style: AppFonts.regular18White,
        ),
        Gap(20.h),
        Image.asset(
          AppImages.fromMyEye,
          height: 300.h,
          width: 300.w,
        ),
      ],
    );
  }
}
