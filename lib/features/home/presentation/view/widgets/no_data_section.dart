import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/utils/app_images.dart';
import 'package:testfirebase/generated/l10n.dart';

class NoDataBody extends StatelessWidget {
  const NoDataBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Image.asset(
          AppImages.imagesEmptyList,
          height: 230.h,
        ),
        Gap(10.h),
        Text(
          S.of(context).WhatDoYouWantToDoToday,
          style: AppFonts.regular20White,
        ),
        Gap(10.h),
        Text(
          S.of(context).tapToAdd,
          style: AppFonts.regular20White,
        ),
      ],
    );
  }
}
