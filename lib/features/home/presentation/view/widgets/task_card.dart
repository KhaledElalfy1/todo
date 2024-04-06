import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/features/home/presentation/controller/home/home_cubit.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.taskName,
    required this.dueDate,
    required this.isDone,
    required this.docID,
  });
  final String taskName;
  final DateTime dueDate;
  final bool isDone;
  final String docID;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.hitTextColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Checkbox(
                  value: isDone,
                  onChanged: (value) {
                    HomeCubit.get(context)
                        .makeTaskChecked(doc: docID, value: !isDone);
                  });
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                taskName,
                style: AppFonts.dialogContent,
              ),
              Gap(5.h),
              Text(
                'Due Date ${dueDate.day}/${dueDate.month}, ${dueDate.hour}:${dueDate.minute}',
                style: DateTime.now().isAfter(dueDate)
                    ? AppFonts.regular12White.copyWith(
                        fontSize: 14,
                        color: AppColor.red,
                      )
                    : AppFonts.regular12White.copyWith(
                        fontSize: 14,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
