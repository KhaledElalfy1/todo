import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
import 'package:testfirebase/core/widgets/loading_widget.dart';
import 'package:testfirebase/features/home/presentation/controller/add_task/add_task_cubit.dart';

import 'package:testfirebase/features/home/presentation/view/widgets/custom_task_text_fild.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 16.h),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Task',
              style:
                  AppFonts.regular20White.copyWith(fontWeight: FontWeight.bold),
            ),
            Gap(14.h),
            CustomTaskTextFiled(
              textEditingController: AddTaskCubit.get(context).taskController,
            ),
            Gap(14.h),
            Text(
              'Description',
              style: AppFonts.regular16Grey,
            ),
            CustomTaskTextFiled(
              textEditingController: AddTaskCubit.get(context).taskDetailsController,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppIcons.iconsTimer,
                  ),
                ),
                Gap(20.w),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppIcons.iconsTag,
                  ),
                ),
                Gap(20.w),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppIcons.iconsFlag,
                  ),
                ),
                const Spacer(),
                BlocConsumer<AddTaskCubit, AddTaskState>(
                  listener: (context, state) =>
                      state is AddTaskSuccess ? context.pop() : null,
                  builder: (context, state) {
                    return IconButton(
                      onPressed: AddTaskCubit.get(context).addTask,
                      icon: state is AddTaskLoading
                          ? const LoadingWidget()
                          : SvgPicture.asset(
                              AppIcons.iconsSend,
                            ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
