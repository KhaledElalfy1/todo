import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
import 'package:testfirebase/core/widgets/loading_widget.dart';
import 'package:testfirebase/core/widgets/popup_window.dart';
import 'package:testfirebase/features/task_details/presentation/controller/cubit/edit_task_cubit.dart';
import 'package:testfirebase/features/task_details/presentation/controller/cubit/edit_task_state.dart';
import 'package:testfirebase/features/task_details/presentation/view/widgets/custom_app_bar.dart';
import 'package:testfirebase/features/task_details/presentation/view/widgets/task_details_card.dart';
import 'package:testfirebase/features/task_details/presentation/view/widgets/task_due_date.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.pushReplacementNamed(Routing.home);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              children: [
                Gap(5.h),
                const CustomAppBar(),
                Gap(25.h),
                TaskDetailsCard(task: task),
                Gap(35.h),
                TaskDueDate(task: task),
                Gap(30.h),
                Row(
                  children: [
                    BlocConsumer<EditTaskCubit, EditTaskState>(
                      listener: (context, state) {
                        if (state is DeleteTaskSuccess) {
                          context.pushReplacementNamed(Routing.home);
                        } else if (state is DeleteTaskFailure) {
                          showDialog(
                            context: context,
                            builder: (context) => PopupWindow(
                                title: 'Failure',
                                content: state.eMessage,
                                type: 'type'),
                          );
                        }
                      },
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            EditTaskCubit.get(context)
                                .deleteTask(doc: task.docID);
                          },
                          icon: state is EditTaskLoading
                              ? const LoadingWidget()
                              : SvgPicture.asset(AppIcons.iconsTrash),
                        );
                      },
                    ),
                    Gap(8.h),
                    Text(
                      'Delete Task',
                      style:
                          AppFonts.regular18White.copyWith(color: AppColor.red),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
