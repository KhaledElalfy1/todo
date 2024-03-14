import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_color.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5,
      child: ListView.separated(
        separatorBuilder: (context, index) => Gap(5.w),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          width: 27.w,
          height: 4,
          decoration: BoxDecoration(
            color: AppColor.indicatorColor,
            borderRadius: BorderRadius.circular(
              53,
            ),
          ),
        ),
      ),
    );
  }
}
