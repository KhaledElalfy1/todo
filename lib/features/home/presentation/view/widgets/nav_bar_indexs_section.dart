import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/features/home/presentation/controller/change_route_cubit/change_route_cubit.dart';
import 'package:testfirebase/features/home/presentation/controller/change_route_cubit/change_route_state.dart';
import 'package:testfirebase/features/home/presentation/view/widgets/nav_bar_index.dart';

class IndexSection extends StatelessWidget {
  const IndexSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      width: double.infinity,
      height: 88.h,
      color: AppColor.hitTextColor,
      child: BlocBuilder<ChangeRouteCubit, ChangeRouteState>(
        builder: (context, state) {
          return Row(
            children: [
              NavBarIndex(
                iconPath: ChangeRouteCubit.get(context).currentRoute == 0
                    ? ChangeRouteCubit.get(context).bottomBarItems[0]['activeIcon']
                    : ChangeRouteCubit.get(context).bottomBarItems[0]['inactiveIcon'],
                title: ChangeRouteCubit.get(context).bottomBarItems[0]['routeName'],
                onTap: () {
                  ChangeRouteCubit.get(context).changeRoute(index: 0);
                },
              ),
              Gap(30.w),
              NavBarIndex(
                iconPath: ChangeRouteCubit.get(context).currentRoute == 1
                    ? ChangeRouteCubit.get(context).bottomBarItems[1]['activeIcon']
                    : ChangeRouteCubit.get(context).bottomBarItems[1]['inactiveIcon'],
                title: ChangeRouteCubit.get(context).bottomBarItems[1]['routeName'],
                onTap: () {
                  ChangeRouteCubit.get(context).changeRoute(index: 1);
                },
              ),
              const Spacer(),
             NavBarIndex(
                iconPath: ChangeRouteCubit.get(context).currentRoute == 2
                    ? ChangeRouteCubit.get(context).bottomBarItems[2]['activeIcon']
                    : ChangeRouteCubit.get(context).bottomBarItems[2]['inactiveIcon'],
                title: ChangeRouteCubit.get(context).bottomBarItems[2]['routeName'],
                onTap: () {
                  ChangeRouteCubit.get(context).changeRoute(index: 2);
                },
              ),
              Gap(30.w),
             NavBarIndex(
                iconPath: ChangeRouteCubit.get(context).currentRoute == 3
                    ? ChangeRouteCubit.get(context).bottomBarItems[3]['activeIcon']
                    : ChangeRouteCubit.get(context).bottomBarItems[3]['inactiveIcon'],
                title: ChangeRouteCubit.get(context).bottomBarItems[3]['routeName'],
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
