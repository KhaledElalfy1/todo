import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:testfirebase/core/widgets/list_of_tasks.dart';
import 'package:testfirebase/features/calender/presentation/controller/calender_cubit/calender_cubit.dart';
import 'package:testfirebase/features/calender/presentation/controller/calender_cubit/calender_state.dart';


import '../../../task_details/presentation/controller/cubit/edit_task_cubit.dart';
import '../../../task_details/presentation/controller/cubit/edit_task_state.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalenderCubit, CalenderState>(
      builder: (context, state) {
        return ListView(
          children: [
            Gap(10.h),
            TableCalendar(
              calendarStyle: const CalendarStyle(
                isTodayHighlighted: false,
              ),
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              focusedDay: CalenderCubit.get(context).selectedDate,
              firstDay: DateTime(2000),
              lastDay: DateTime(2030),
              onDaySelected: (selectedDay, focusedDay) {
                CalenderCubit.get(context).changeSelectedDay(selectedDay);
              },
              selectedDayPredicate: (day) =>
                  isSameDay(day, CalenderCubit.get(context).selectedDate),
            ),
            BlocBuilder<EditTaskCubit, EditTaskState>(
              builder: (context, state) {
                return ListOfTasks(
                    tasks: CalenderCubit.get(context).filteredList);
              },
            )
          ],
        );
      },
    );
  }
}
