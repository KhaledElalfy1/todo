import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/features/calender/presentation/controller/calender_cubit/calender_state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit(this.tasks) : super(CalenderInitial());
  final List<TaskModel> tasks;
  List<TaskModel> filteredList = [];
  static CalenderCubit get(context) => BlocProvider.of(context);
  DateTime selectedDate = DateTime.now();
  void changeSelectedDay(DateTime date) {
    selectedDate = date;
    filterTasksByDueDate();
  }

  void filterTasksByDueDate() {
    emit(FilterListLoading());
    try {
      filteredList =
          tasks.where((task) => isDatesEqual(taskDate: task.dueDate)).toList();
      emit(FilterListSuccess());
    } on Exception catch (_) {
      emit(FilterListFailure());
    }
  }

  bool isDatesEqual({required DateTime taskDate}) {
    return taskDate.year == selectedDate.year &&
        taskDate.month == selectedDate.month &&
        taskDate.day == selectedDate.day;
  }
}
