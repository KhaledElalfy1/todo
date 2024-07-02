import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_icons.dart';

class PickUserProfilePicture extends StatelessWidget {
  const PickUserProfilePicture({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
            onPressed: onPressed,
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
    );
  }
}
