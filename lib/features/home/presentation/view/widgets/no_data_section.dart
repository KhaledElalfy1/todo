import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/utils/app_images.dart';

class NoDataBody extends StatelessWidget {
  const NoDataBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.imagesEmptyList,
          height: 230.h,
        ),
        Gap(10.h),
        Text(
          'What do you want to do today?',
          style: AppFonts.regular20White,
        ),
        Gap(10.h),
        Text(
          'Tap + to add your tasks',
          style: AppFonts.regular20White,
        ),
      ],
    );
  }
}
