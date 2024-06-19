import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/features/home/data/repo/home_repo.dart';
import 'package:testfirebase/features/home/presentation/controller/edit_task_details_cubit/edit_task_details_state.dart';

class EditTaskDetailsCubit extends Cubit<EditTaskDetailsState> {
  EditTaskDetailsCubit(this.taskModel) : super(EditTaskDetailsInitial()){
     taskTitleController.text = taskModel.taskName;
    taskDetailsController.text = taskModel.taskDescription;
  }
  final TaskModel taskModel;
  static EditTaskDetailsCubit get(context) => BlocProvider.of(context);
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDetailsController = TextEditingController();

  @override
  Future<void> close() {
    taskDetailsController.dispose();
    taskTitleController.dispose();
    return super.close();
  }

  void editTaskDetails({required String doc}) async {
    emit(EditTaskDetailsLoading());
   
    var result = await getIt<HomeRepo>().editTaskDetails(
      doc: doc,
      taskTitle:taskTitleController.text.isEmpty?taskModel.taskName: taskTitleController.text,
      taskDetails:taskDetailsController.text.isEmpty? taskModel.taskDescription:taskDetailsController.text,
    );
    result.fold(
      (l) {
        emit(
          EditTaskDetailsFailure(eMessage: l),
        );
      },
      (r) {
        emit(
          EditTaskDetailsSuccess(),
        );
      },
    );
  }
}
