import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';


class ShowTasksStateWidget extends StatelessWidget {
  const ShowTasksStateWidget({
    super.key,
    required this.numberOfTasks,
    required this.status,
  });
  final int numberOfTasks;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: AppColor.hitTextColor,
      ),
      child: Text(
        '$numberOfTasks $status',
        style: AppFonts.regular18White,
      ),
    );
  }
}
