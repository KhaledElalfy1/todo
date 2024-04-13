import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<TaskModel> userTasks = [];
  List<TaskModel> userDoneTasks = [];
  List<TaskModel> userUndoneTasks = [];
  IconData expandedIcon = Icons.expand_more;
  bool isExpanded = true;

  void getTasks() async {
    emit(GetTaskLoading());
    final result = await getIt<HomeRepo>().getUerTasks();
    result.fold(
      (eMessage) => emit(
        GetTaskFailure(eMessage: eMessage),
      ),
      (tasks) {
        userTasks = List.from(tasks);
        userTasks.sort((a, b) => a.dueDate.compareTo(b.dueDate));
        userDoneTasks = [];
        userUndoneTasks = [];
        for (var element in userTasks) {
          if (!element.isDone) {
            userUndoneTasks.add(element);
          } else if (element.isDone) {
            userDoneTasks.add(element);
          }
        }
        debugPrint(
            'Done tasks ${userDoneTasks.length}\n undoneTasks ${userUndoneTasks.length}');
        emit(
          GetTaskSuccess(tasks: userTasks),
        );
      },
    );
  }

  void makeTaskChecked({required String doc, required bool value}) async {
    emit(CheckTaskLoading());
    final result = await getIt<HomeRepo>().checkTask(doc: doc, value: value);
    result.fold(
      (l) {
        emit(CheckTaskFailure());
      },
      (r) {
        emit(
          CheckTaskSuccess(),
        );
        getTasks();
      },
    );
  }

 

  void changeExpandedIcon() {
    isExpanded = !isExpanded;
    expandedIcon = isExpanded ? Icons.expand_more : Icons.chevron_right;
    emit(ChangeExpandedIcon());
  }
}
