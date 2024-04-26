import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
import 'package:testfirebase/features/home/presentation/controller/home/home_cubit.dart';
import 'package:testfirebase/features/profile/presentation/view/widgets/show_tasks_state_widget.dart';
import 'package:testfirebase/generated/l10n.dart';

import '../../../../core/utils/app_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Gap(20.h),
        Text(
          S.of(context).Profile,
          style: AppFonts.regular20White,
          textAlign: TextAlign.center,
        ),
        Gap(25.h),
        CircleAvatar(
          radius: 45.r,
          backgroundColor: AppColor.lightGrey,
        ),
        Gap(25.h),
        Text(
          '${FirebaseAuth.instance.currentUser!.email}',
          style: AppFonts.medium20White,
          textAlign: TextAlign.center,
        ),
        Gap(25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ShowTasksStateWidget(
              numberOfTasks: HomeCubit.get(context).userUndoneTasks.length,
              status: S.of(context).tasksLeft,
            ),
            ShowTasksStateWidget(
              numberOfTasks: HomeCubit.get(context).userDoneTasks.length,
              status: S.of(context).tasksDone,
            ),
          ],
        ),
        Gap(30.h),
        Row(
          children: [
            IconButton(
              onPressed: () async {
                GoogleSignIn().signOut();
                await FirebaseAuth.instance.signOut();
                context.pushNamedAndRemoveUntil(Routing.welcomeScreen,
                    predicate: (routing) => false);
              },
              icon: SvgPicture.asset(AppIcons.iconsLogOut),
            ),
            Text(
              S.of(context).logout,
              style: AppFonts.medium20White.copyWith(color: AppColor.red),
            )
          ],
        )
      ],
    );
  }
}
