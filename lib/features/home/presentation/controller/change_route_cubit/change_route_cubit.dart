import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
import 'package:testfirebase/features/calender/presentation/view/calender.dart';
import 'package:testfirebase/features/foucs/presentation/view/focus.dart';
import 'package:testfirebase/features/home/presentation/controller/change_route_cubit/change_route_state.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/tasks_body.dart';
import 'package:testfirebase/features/profile/presentation/view/profile.dart';

class ChangeRouteCubit extends Cubit<ChangeRouteState> {
  ChangeRouteCubit() : super(ChangeRouteInitial());
  static ChangeRouteCubit get(context) => BlocProvider.of(context);

  List<Widget> routes = const [
    TasksBody(),
    Calender(),
    FocusRoute(),
    Profile()
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
  void changeRoute({required int index}) {
    currentRoute = index;
    emit(ChangeRouteDone());
  }
}
