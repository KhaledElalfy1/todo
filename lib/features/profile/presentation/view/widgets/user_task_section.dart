import 'package:flutter/material.dart';
import 'package:testfirebase/features/home/presentation/controller/home/home_cubit.dart';
import 'package:testfirebase/features/profile/presentation/view/widgets/show_tasks_state_widget.dart';
import 'package:testfirebase/generated/l10n.dart';


class UserTasksSection extends StatelessWidget {
  const UserTasksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ShowTasksStateWidget(
          numberOfTasks: HomeCubit.get(context).userUndoneTasks.length,
          status: S.of(context).tasksLeft,
        ),
        ShowTasksStateWidget(
          numberOfTasks: HomeCubit.get(context).userDoneTasks.length,
          status: S.of(context).tasksDone,
        ),
      ],
    );
  }
}

