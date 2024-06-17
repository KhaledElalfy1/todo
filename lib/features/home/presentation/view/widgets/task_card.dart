import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/popup_window.dart';
import 'package:testfirebase/features/home/presentation/controller/home/home_cubit.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/delete_task_dialog.dart';
import 'package:testfirebase/features/task_details/presentation/controller/cubit/edit_task_cubit.dart';
import 'package:testfirebase/generated/l10n.dart';

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
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: (_) {
              showDialog(
                context: context,
                builder: (context) => BlocProvider(
                  create: (context) => EditTaskCubit(),
                  child: DeleteTaskDialog(docID: task.docID),
                ),
              ).then(
                (value) {
                  if (value != null) {
                    HomeCubit.get(context).getTasks();
                  }
                },
              );
            },
            backgroundColor: AppColor.red,
            foregroundColor: AppColor.white,
            icon: Icons.delete,
            label: S.of(context).delete,
          ),
          SlidableAction(
            onPressed: (_) {
              showDialog(
                context: context,
                builder: (context) => PopupWindow(
                  title: 'Edit',
                  content: 'Coming soon',
                  type: 's',
                  ok: () {
                    context.pop();
                  },
                ),
              );
            },
            backgroundColor: AppColor.aqua,
            foregroundColor: AppColor.white,
            icon: Icons.edit,
            label: S.of(context).edit,
          ),
        ]),
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
                      HomeCubit.get(context).makeTaskChecked(
                          doc: task.docID, value: !task.isDone);

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
      ),
    );
  }
}
