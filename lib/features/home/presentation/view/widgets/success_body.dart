import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/task_card.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
    required this.undoneTasks,
    required this.doneTasks,
  });
  final List<TaskModel> undoneTasks;
  final List<TaskModel> doneTasks;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: undoneTasks.length,
            itemBuilder: (context, index) => TaskCard(
              task: undoneTasks[index],
            ),
            separatorBuilder: (context, index) => Gap(10.h),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Completed',
            style: AppFonts.bold32White,
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: doneTasks.length,
            itemBuilder: (context, index) => TaskCard(
              task: doneTasks[index],
            ),
            separatorBuilder: (context, index) => Gap(10.h),
          ),
        ),
      ],
    );
  }
}
