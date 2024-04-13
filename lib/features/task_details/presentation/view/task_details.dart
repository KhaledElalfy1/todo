import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/model/task_model.dart';
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
              const CustomAppBar(),
              Gap(25.h),
              TaskDetailsCard(task: task),
              
            ],
          ),
        ),
      ),
    );
  }
}

