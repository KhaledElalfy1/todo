import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
import 'package:testfirebase/features/task_details/presentation/controller/cubit/edit_task_cubit.dart';
import 'package:testfirebase/features/task_details/presentation/controller/cubit/edit_task_state.dart';

class TaskDetailsCard extends StatelessWidget {
  const TaskDetailsCard({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    // bool done = task.isDone;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BlocBuilder<EditTaskCubit, EditTaskState>(
          builder: (context, state) {
            bool done = task.isDone;
            return Checkbox(
              shape: const CircleBorder(),
              value: done,
              onChanged: (value) async {
                EditTaskCubit.get(context)
                    .makeTaskChecked(doc: task.docID, value: !task.isDone);
                !task.isDone
                    ? await getIt<AudioPlayer>().play(
                        AssetSource('sounds/done.mp3'),
                      )
                    : null;
              },
            );
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.taskName,
              style: AppFonts.regular20White,
            ),
            Text(
              task.taskDescription,
              style: AppFonts.regular16Grey,
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppIcons.iconsEdit),
        ),
      ],
    );
  }
}
