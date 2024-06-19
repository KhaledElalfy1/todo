import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
import 'package:testfirebase/features/calender/presentation/controller/calender_cubit/calender_cubit.dart';
import 'package:testfirebase/features/home/presentation/controller/change_route_cubit/change_route_cubit.dart';
import 'package:testfirebase/features/home/presentation/controller/change_route_cubit/change_route_state.dart';
import 'package:testfirebase/features/home/presentation/controller/home/home_cubit.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/nav_bar_index.dart';
import 'package:testfirebase/generated/l10n.dart';

class IndexSection extends StatelessWidget {
  const IndexSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      width: double.infinity,
      height: 90.h,
      color: AppColor.hitTextColor,
      child: BlocBuilder<ChangeRouteCubit, ChangeRouteState>(
        builder: (context, state) {
          return Row(
            children: [
              NavBarIndex(
                iconPath: ChangeRouteCubit.get(context).currentRoute == 0
                    ? AppIcons.iconsSelectedHome
                    : AppIcons.iconsUnselectedHome,
                title: S.of(context).index,
                onTap: () {
                  ChangeRouteCubit.get(context).changeRoute(index: 0);
                },
              ),
              Gap(30.w),
              NavBarIndex(
                iconPath: ChangeRouteCubit.get(context).currentRoute == 1
                    ? AppIcons.iconsSelectedCalendar
                    : AppIcons.iconsUnselectedCalendar,
                title: S.of(context).Calender,
                onTap: () {
                  ChangeRouteCubit.get(context).changeRoute(index: 1);
                  CalenderCubit.get(context).filterTasksByDueDate(
                      tasks: HomeCubit.get(context).userTasks);
                },
              ),
              const Spacer(),
              NavBarIndex(
                iconPath: ChangeRouteCubit.get(context).currentRoute == 2
                    ? AppIcons.iconsSelectedClock
                    : AppIcons.iconsUnselectedClock,
                title: S.of(context).Focus,
                onTap: () {
                  ChangeRouteCubit.get(context).changeRoute(index: 2);
                },
              ),
              Gap(30.w),
              NavBarIndex(
                iconPath: AppIcons.iconsUser,
                title: S.of(context).Profile,
                onTap: () {
                  ChangeRouteCubit.get(context).changeRoute(index: 3);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
