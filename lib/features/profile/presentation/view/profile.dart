import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/features/profile/presentation/view/widgets/sign_out_section.dart';
import 'package:testfirebase/features/profile/presentation/view/widgets/user_task_section.dart';
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
       const UserTasksSection(),
        Gap(30.h),
        const SignOutSection()
      ],
    );
  }
}

