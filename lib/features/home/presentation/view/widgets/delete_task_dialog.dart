import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/widgets/popup_window.dart';
import 'package:testfirebase/features/task_details/presentation/controller/cubit/edit_task_cubit.dart';
import 'package:testfirebase/features/task_details/presentation/controller/cubit/edit_task_state.dart';
import 'package:testfirebase/generated/l10n.dart';

class DeleteTaskDialog extends StatelessWidget {
  const DeleteTaskDialog({
    super.key,
    required this.docID,
  });

  final String docID;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditTaskCubit, EditTaskState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccess) {
          Navigator.pop(context, 1);
        }
      },
      child: PopupWindow(
        title: S.of(context).delete,
        content: S.of(context).areYouSure,
        type: 'type',
        ok: () {
          EditTaskCubit.get(context).deleteTask(doc: docID);
        },
        cancel: () {
          context.pop();
        },
      ),
    );
  }
}
