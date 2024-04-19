import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/widgets/doting_loading_indicator.dart';
import 'package:testfirebase/features/home/presentation/controller/home/home_cubit.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/custom_index_app_bar.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/no_data_section.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/success_body.dart';

class TasksBody extends StatelessWidget {
  const TasksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Gap(10.h),
          const CustomIndexAppBar(),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => state is GetTaskLoading
                ? const DotingLoadingIndicator()
                : const SizedBox(),
          ),
          Gap(20.h),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is GetTaskFailure) {
                  return Center(
                    child: Text(state.eMessage),
                  );
                } else {
                  if (HomeCubit.get(context).userTasks.isEmpty) {
                    return const NoDataBody();
                  }
                  return SuccessBody(
                    undoneTasks: HomeCubit.get(context).userUndoneTasks,
                    doneTasks: HomeCubit.get(context).userDoneTasks,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
