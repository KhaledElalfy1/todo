import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
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
      child: Row(
        children: [
          NavBarIndex(
            iconPath: AppIcons.iconsSelectedHome,
            title: 'Index',
            onTap: () {
              debugPrint('index');
            },
          ),
          Gap(30.w),
          NavBarIndex(
            iconPath: AppIcons.iconsUnselectedCalendar,
            title: 'Calender',
            onTap: () {
              debugPrint('Calender');
            },
          ),
          const Spacer(),
          NavBarIndex(
            iconPath: AppIcons.iconsUnselectedClock,
            title: 'Focus',
            onTap: () {
              debugPrint('Focus');
            },
          ),
          Gap(30.w),
          NavBarIndex(
            iconPath: AppIcons.iconsUser,
            title: 'Profile',
            onTap: () {
              debugPrint('Profile');
            },
          ),
        ],
      ),
    );
  }
}
