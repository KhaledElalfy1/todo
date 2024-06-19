
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/utils/app_icons.dart';

class TaskDueDate extends StatelessWidget {
  const TaskDueDate({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.iconsTimer),
        Gap(8.w),
        Text(
          'Task Time',
          style: AppFonts.regular18White,
        ),
        const Spacer(),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColor.hitTextColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            'At ${task.dueDate.day}/${task.dueDate.month}, ${task.dueDate.hour}:${task.dueDate.minute}',
            style: DateTime.now().isAfter(task.dueDate)
                ? AppFonts.regular12White.copyWith(
                    fontSize: 14,
                    color: AppColor.red,
                  )
                : AppFonts.regular12White.copyWith(
                    fontSize: 14,
                  ),
          ),
        ),
      ],
    );
  }
}
