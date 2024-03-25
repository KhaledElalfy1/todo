import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/task_card.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
    required this.tasks,
  });
  final List<TaskModel> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tasks.length,
      itemBuilder: (context, index) => TaskCard(
          taskName: tasks[index].taskName,
          timestamp: tasks[index].dateTime),
      separatorBuilder: (context, index) => Gap(10.h),
    );
  }
}
