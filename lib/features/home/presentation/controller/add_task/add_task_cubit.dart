import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/features/home/data/repo/home_repo.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  static AddTaskCubit get(context) => BlocProvider.of(context);
  final TextEditingController taskController = TextEditingController();
  final TextEditingController taskDetailsController = TextEditingController();
  @override
  Future<void> close() {
    taskController.dispose();
    taskDetailsController.dispose();
    return super.close();
  }

  void addTask() async {
    emit(AddTaskLoading());
    final result = await getIt<HomeRepo>().addTask(task: taskController.text);
    result.fold(
      (l) => emit(
        AddTaskFailure(),
      ),
      (r) {
        emit(
          AddTaskSuccess(),
        );
      },
    );
  }
}
