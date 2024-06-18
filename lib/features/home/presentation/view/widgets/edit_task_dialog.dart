import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/loading_widget.dart';
import 'package:testfirebase/features/home/presentation/controller/edit_task_details_cubit/edit_task_details_cubit.dart';
import 'package:testfirebase/features/home/presentation/controller/edit_task_details_cubit/edit_task_details_state.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/custom_task_text_fild.dart';
import 'package:testfirebase/generated/l10n.dart';

class EditTaskDialog extends StatelessWidget {
  const EditTaskDialog({
    super.key,
    required this.task,
  });
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).editTask,
              style: AppFonts.medium20White,
            ),
            const Divider(
              color: AppColor.lightGrey,
            ),
            CustomTaskTextFiled(
              textEditingController:
                  EditTaskDetailsCubit.get(context).taskTitleController,
              hintText: task.taskName,
            ),
            Gap(17.h),
            CustomTaskTextFiled(
              textEditingController:
                  EditTaskDetailsCubit.get(context).taskDetailsController,
              hintText: task.taskDescription,
            ),
            Gap(28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      S.of(context).cancel,
                      style: AppFonts.regular16Grey
                          .copyWith(color: AppColor.primaryColor),
                    ),
                  ),
                ),
                Expanded(
                  child:
                      BlocConsumer<EditTaskDetailsCubit, EditTaskDetailsState>(
                    listener: (context, state) {
                      if (state is EditTaskDetailsSuccess) {
                        Navigator.pop(context, 1);
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          EditTaskDetailsCubit.get(context)
                              .editTaskDetails(doc: task.docID);
                        },
                        child:state is EditTaskDetailsLoading? const LoadingWidget() :Text(
                          S.of(context).edit,
                          style: AppFonts.regular18White,
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
