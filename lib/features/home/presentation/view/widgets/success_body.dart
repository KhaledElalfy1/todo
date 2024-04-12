import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/features/home/presentation/controller/home/home_cubit.dart';
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
    return ListView(
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemCount: undoneTasks.length,
          itemBuilder: (context, index) => TaskCard(
            task: undoneTasks[index],
          ),
          separatorBuilder: (context, index) => Gap(10.h),
        ),
        Gap(30.h),
        GestureDetector(
          onTap: HomeCubit.get(context).changeExpandedIcon,
          child: Row(
            children: [
              Text(
                'Completed',
                style: AppFonts.bold32White,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Icon(
                    HomeCubit.get(context).expandedIcon,
                    size: 40,
                  );
                },
              ),
            ],
          ),
        ),
        Gap(15.h),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: HomeCubit.get(context).isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: const SizedBox(), 
          secondChild: ListView.separated(
            shrinkWrap: true,
            itemCount: doneTasks.length,
            itemBuilder: (context, index) => TaskCard(
              task: doneTasks[index],
            ),
            separatorBuilder: (context, index) => Gap(10.h),
          ),
        ),
        Gap(20.h),
      ],
    );
  }
}
