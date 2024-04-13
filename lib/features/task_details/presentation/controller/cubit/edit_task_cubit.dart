import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/features/task_details/data/repo/task_details_repo.dart';
import 'package:testfirebase/features/task_details/presentation/controller/cubit/edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit() : super(EditTaskInitial());
  static EditTaskCubit get(context) => BlocProvider.of(context);

  void makeTaskChecked({required String doc, required bool value}) async {
    final result =
        await getIt<TaskDetailRepo>().checkTask(doc: doc, value: value);
    result.fold((l) => emit(EditTaskFailure(eMessage: l)), (r) {
      emit(EditTaskSuccess());
    });
  }

  void deleteTask({required String doc}) async {
    emit(DeleteTaskLoading());
    final result = await getIt<TaskDetailRepo>().deleteTask(doc: doc);
    result.fold(
      (l) => emit(DeleteTaskFailure(eMessage: l)),
      (r) => emit(DeleteTaskSuccess()),
    );
  }
}
