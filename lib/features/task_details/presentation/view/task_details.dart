import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
import 'package:testfirebase/features/task_details/presentation/view/widgets/custom_app_bar.dart';
import 'package:testfirebase/features/task_details/presentation/view/widgets/task_details_card.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Column(
            children: [
              Gap(5.h),
              const CustomAppBar(),
              Gap(25.h),
              TaskDetailsCard(task: task),
              Gap(35.h),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.iconsTimer),
                  Gap(8.w),
                  Text(
                    'Task Time',
                    style: AppFonts.regular16White,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
