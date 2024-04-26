import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
import 'package:testfirebase/generated/l10n.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        context.pushReplacementNamed(Routing.home);
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
                GestureDetector(
                  onTap: () {
                    EditTaskCubit.get(context).deleteTask(doc: task.docID);
                  },
                  child: Row(
                    children: [
                      BlocConsumer<EditTaskCubit, EditTaskState>(
                        listener: (context, state) {
                          if (state is DeleteTaskSuccess) {
                            context.pushReplacementNamed(Routing.home);
                          } else if (state is DeleteTaskFailure) {
                            showDialog(
                              context: context,
                              builder: (context) => PopupWindow(
                                  title: S.of(context).failure,
                                  content: state.eMessage,
                                  type: 'type'),
                            );
                          }
                        },
                        builder: (context, state) {
                          return state is DeleteTaskLoading
                              ? const LoadingWidget()
                              : IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(AppIcons.iconsTrash),
                                );
                        },
                      ),
                      Gap(8.h),
                      Text(
                        S.of(context).deleteTask,
                        style: AppFonts.regular18White
                            .copyWith(color: AppColor.red),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
