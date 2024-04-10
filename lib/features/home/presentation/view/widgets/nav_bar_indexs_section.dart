import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/features/home/presentation/controller/home/home_cubit.dart';
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
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Row(
            children: [
              NavBarIndex(
                iconPath: HomeCubit.get(context).currentRoute == 0
                    ? HomeCubit.get(context).bottomBarItems[0]['activeIcon']
                    : HomeCubit.get(context).bottomBarItems[0]['inactiveIcon'],
                title: HomeCubit.get(context).bottomBarItems[0]['routeName'],
                onTap: () {
                  HomeCubit.get(context).changeRoute(index: 0);
                },
              ),
              Gap(30.w),
              NavBarIndex(
                iconPath: HomeCubit.get(context).currentRoute == 1
                    ? HomeCubit.get(context).bottomBarItems[1]['activeIcon']
                    : HomeCubit.get(context).bottomBarItems[1]['inactiveIcon'],
                title: HomeCubit.get(context).bottomBarItems[1]['routeName'],
                onTap: () {
                  HomeCubit.get(context).changeRoute(index: 1);
                },
              ),
              const Spacer(),
             NavBarIndex(
                iconPath: HomeCubit.get(context).currentRoute == 2
                    ? HomeCubit.get(context).bottomBarItems[2]['activeIcon']
                    : HomeCubit.get(context).bottomBarItems[2]['inactiveIcon'],
                title: HomeCubit.get(context).bottomBarItems[2]['routeName'],
                onTap: () {
                  HomeCubit.get(context).changeRoute(index: 2);
                },
              ),
              Gap(30.w),
             NavBarIndex(
                iconPath: HomeCubit.get(context).currentRoute == 3
                    ? HomeCubit.get(context).bottomBarItems[3]['activeIcon']
                    : HomeCubit.get(context).bottomBarItems[3]['inactiveIcon'],
                title: HomeCubit.get(context).bottomBarItems[3]['routeName'],
                onTap: () {
                  HomeCubit.get(context).changeRoute(index: 3);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
