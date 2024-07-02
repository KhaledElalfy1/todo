import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/custom_text_form_filed.dart';
import 'package:testfirebase/features/user_details/presentation/controller/update_user_name_cubit/update_user_details_cubit.dart';
import 'package:testfirebase/features/user_details/presentation/view/widgets/pick_profile_picture.dart';
import 'package:testfirebase/generated/l10n.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          children: [
            Gap(30.h),
            PickUserProfilePicture(
              onPressed: () {},
            ),
            Gap(30.h),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                S.of(context).userName,
                style: AppFonts.regular20White,
              ),
            ),
            Gap(8.h),
            Form(
              key: UpdateUserDetailsCubit.get(context).globalKey,
              child: CustomTextFormFiled(
                validator: (p0) =>
                    UpdateUserDetailsCubit.get(context).validator(p0),
                textEditingController:
                    UpdateUserDetailsCubit.get(context).userNameController,
                hintText: S.of(context).userName,
              ),
            ),
            Gap(60.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  S.of(context).login,
                  style: AppFonts.regular18White,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
