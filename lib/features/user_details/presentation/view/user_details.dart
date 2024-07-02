import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/utils/app_icons.dart';
import 'package:testfirebase/core/widgets/custom_text_form_filed.dart';
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
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 60.r,
                  backgroundColor: AppColor.lightGrey,
                ),
                Positioned(
                  bottom: -5,
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      minRadius: 18.r,
                      backgroundColor: AppColor.primaryColor,
                      child: SvgPicture.asset(
                        AppIcons.iconsEdit,
                        height: 28.h,
                      ),
                    ),
                  ),
                ),
              ],
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
            CustomTextFormFiled(
              textEditingController: TextEditingController(),
              hintText: 'UserName',
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
