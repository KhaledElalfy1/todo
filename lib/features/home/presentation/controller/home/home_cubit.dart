import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/model/task_model.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
import 'package:testfirebase/features/home/data/repo/home_repo.dart';
import 'package:testfirebase/features/home/presentation/view/home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<TaskModel> userTasks = [];
  List<Widget> routes = const [
    MainScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];
  int currentRoute = 0;
  List<Map<String, dynamic>> bottomBarItems = [
    {
      'routeName': 'index',
      'index': 0,
      'activeIcon': AppIcons.iconsSelectedHome,
      'inactiveIcon': AppIcons.iconsUnselectedHome,
    },
    {
      'routeName': 'Calender',
      'index': 1,
      'activeIcon': AppIcons.iconsSelectedCalendar,
      'inactiveIcon': AppIcons.iconsUnselectedCalendar,
    },
    {
      'routeName': 'Focus',
      'index': 2,
      'activeIcon': AppIcons.iconsSelectedClock,
      'inactiveIcon': AppIcons.iconsUnselectedClock,
    },
    {
      'routeName': 'Profile',
      'index': 3,
      'activeIcon': AppIcons.iconsUser,
      'inactiveIcon': AppIcons.iconsUser,
    },
  ];
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

  void changeRoute({required int index}) {
    currentRoute = index;
    emit(ChangeRoute());
  }
}
