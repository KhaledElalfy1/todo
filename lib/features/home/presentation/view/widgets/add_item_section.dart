import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/core/utils/app_color.dart';
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
        ).then((value) => HomeCubit.get(context).getTasks());
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
