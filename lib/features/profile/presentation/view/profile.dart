import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/widgets/cached_profile_photo.dart';
import 'package:testfirebase/features/profile/presentation/controller/update_name_cubit/update_name_cubit.dart';
import 'package:testfirebase/features/profile/presentation/controller/update_name_cubit/update_name_state.dart';
import 'package:testfirebase/features/profile/presentation/controller/update_new_image_cubit/update_new_image_cubit.dart';
import 'package:testfirebase/features/profile/presentation/controller/update_new_image_cubit/update_new_image_state.dart';
import 'package:testfirebase/features/profile/presentation/view/widgets/change_account_image_section.dart';
import 'package:testfirebase/features/profile/presentation/view/widgets/change_account_name_section.dart';
import 'package:testfirebase/features/profile/presentation/view/widgets/change_language_section.dart';
import 'package:testfirebase/features/profile/presentation/view/widgets/change_password_section.dart';
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
        BlocBuilder<UpdateNewImageCubit, UpdateNewImageState>(
          builder: (context, state) {
            return ClipOval(
              child: CachedProfilePhoto(
                hight: 100,
                width: 100,
                radius: 45.r,
              ),
            );
          },
        ),
        Gap(25.h),
        BlocBuilder<UpdateNameCubit, UpdateNameState>(
          builder: (context, state) {
            return Text(
              '${FirebaseAuth.instance.currentUser!.displayName}',
              style: AppFonts.medium20White,
              textAlign: TextAlign.center,
            );
          },
        ),
        Gap(25.h),
        const UserTasksSection(),
        Gap(25.h),
        const ChangeLanguageSection(),
        Gap(25.h),
        Text(
          S.of(context).account,
          style: AppFonts.regular16Grey,
        ),
        Gap(5.h),
        const ChangeAccountNameSection(),
        Gap(25.h),
        const ChangePasswordSection(),
        Gap(25.h),
        const ChangeAccountImageSection(),
        Gap(25.h),
        const Divider(
          thickness: 1.5,
        ),
        const SignOutSection()
      ],
    );
  }
}
