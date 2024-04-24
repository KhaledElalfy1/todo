import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/list_of_tasks.dart';
import 'package:testfirebase/features/home/presentation/controller/fold_done_list_cubit/fold_done_list_cubit.dart';
import 'package:testfirebase/features/home/presentation/controller/fold_done_list_cubit/fold_done_list_state.dart';

import 'package:testfirebase/generated/l10n.dart';

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
    return ListView(
      children: [
        ListOfTasks(tasks: undoneTasks),
        Gap(30.h),
        GestureDetector(
          onTap: FoldDoneListCubit.get(context).changeExpandedIcon,
          child: Row(
            children: [
              Text(
                S.of(context).completed,
                style: AppFonts.bold32White,
              ),
              BlocBuilder<FoldDoneListCubit, FoldDoneListState>(
                builder: (context, state) {
                  return Icon(
                    FoldDoneListCubit.get(context).expandedIcon,
                    size: 40,
                  );
                },
              ),
            ],
          ),
        ),
        Gap(15.h),
        BlocBuilder<FoldDoneListCubit, FoldDoneListState>(
          builder: (context, state) {
            return AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: FoldDoneListCubit.get(context).isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: const SizedBox(),
              secondChild: ListOfTasks(tasks: doneTasks),
            );
          },
        ),
        Gap(20.h),
      ],
    );
  }
}
