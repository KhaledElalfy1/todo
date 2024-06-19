import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/features/calender/presentation/controller/calender_cubit/calender_cubit.dart';
import 'package:testfirebase/features/home/presentation/controller/add_task/add_task_cubit.dart';
import 'package:testfirebase/features/home/presentation/controller/home/home_cubit.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/add_task_dialog.dart';

class AddItemSection extends StatelessWidget {
  const AddItemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => BlocProvider(
            create: (context) => AddTaskCubit(),
            child: const AddTaskDialog(),
          ),
        ).then(
          (value) {
            if (value != null) {
              StreamSubscription? subscription;
              subscription = HomeCubit.get(context).stream.listen(
                (state) {
                  if (state is GetTaskSuccess) {
                    subscription?.cancel();
                    CalenderCubit.get(context).filterTasksByDueDate(
                        tasks: HomeCubit.get(context).userTasks);
                  }
                },
              );
              HomeCubit.get(context).getTasks();
            }
          },
        );
      },
      child: CircleAvatar(
        radius: 35.r,
        backgroundColor: AppColor.primaryColor,
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}
