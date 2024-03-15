import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.onboarding,
    required this.index,
  });

  final List<Map<String, String>> onboarding;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          onboarding[index]['imagePath']!,
          height: 296.h,
        ),
        Gap(118.h),
        Text(
          onboarding[index]['title']!,
          style: AppFonts.bold32White,
        ),
        Gap(40.h),
        Text(
          onboarding[index]['subtitle']!,
          textAlign: TextAlign.center,
          style: AppFonts.regular20White,
        ),
      ],
    );
  }
}
