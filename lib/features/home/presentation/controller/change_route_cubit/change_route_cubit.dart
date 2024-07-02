import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/features/calender/presentation/view/calender.dart';
import 'package:testfirebase/features/foucs/presentation/view/focus.dart';
import 'package:testfirebase/features/home/presentation/controller/change_route_cubit/change_route_state.dart';

import 'package:testfirebase/features/home/presentation/view/widgets/tasks_body.dart';
import 'package:testfirebase/features/profile/presentation/controller/cubit/update_name_cubit.dart';
import 'package:testfirebase/features/profile/presentation/view/profile.dart';
import 'package:testfirebase/features/task_details/presentation/controller/cubit/edit_task_cubit.dart';

class ChangeRouteCubit extends Cubit<ChangeRouteState> {
  ChangeRouteCubit() : super(ChangeRouteInitial());
  static ChangeRouteCubit get(context) => BlocProvider.of(context);

  List<Widget> routes = [
    const TasksBody(),
    BlocProvider(
      create: (context) => EditTaskCubit(),
      child: const Calender(),
    ),
    const FocusRoute(),
    BlocProvider(
      create: (context) => UpdateNameCubit(),
      child: const Profile(),
    )
  ];
  int currentRoute = 0;

  void changeRoute({required int index}) {
    currentRoute = index;
    emit(ChangeRouteDone());
  }

  void handleBackButton() {
    if (currentRoute != 0) {
      currentRoute = 0;
      emit(ChangeRouteDone());
    }
  }
}
