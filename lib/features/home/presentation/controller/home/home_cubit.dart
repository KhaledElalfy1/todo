import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  void addTask() async {
    emit(AddTaskLoading());
    final result = await getIt<HomeRepo>().addTask(task: 'task3');
    result.fold(
      (l) => emit(
        AddTaskFailure(),
      ),
      (r) {
        emit(
          AddTaskSuccess(),
        );
        getTasks();
      },
    );
  }

  void getTasks() async {
    emit(GetTaskLoading());
    final result = await getIt<HomeRepo>().getUerTasks();
    result.fold((eMessage) {
      emit(GetTaskFailure(eMessage: eMessage));
      print(eMessage);
    }, (tasks) {
      emit(GetTaskSuccess(tasks: tasks));
      print(tasks.length);
    });
  }
}
