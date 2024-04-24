import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/features/home/presentation/controller/home/home_cubit.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    bool isDone = task.isDone;
    return GestureDetector(
      onTap: () {
        context.pushReplacementNamed(Routing.taskDetails, argument: task);
      },
      child: Container(
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
                  shape: const CircleBorder(),
                  value: isDone,
                  onChanged: (value) async {
                    HomeCubit.get(context)
                        .makeTaskChecked(doc: task.docID, value: !task.isDone);

                    !task.isDone
                        ? await getIt<AudioPlayer>().play(
                            AssetSource('sounds/done.mp3'),
                          )
                        : null;
                    isDone = !isDone;
                  },
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Text(
                      task.taskName,
                      style: AppFonts.dialogContent.copyWith(
                          decoration:
                              isDone ? TextDecoration.lineThrough : null),
                    );
                  },
                ),
                Gap(5.h),
                Text(
                  'Due Date ${task.dueDate.day}/${task.dueDate.month}, ${task.dueDate.hour}:${task.dueDate.minute}',
                  style: DateTime.now().isAfter(task.dueDate)
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
      ),
    );
  }
}
