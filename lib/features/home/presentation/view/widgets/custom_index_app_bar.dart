import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/core/widgets/cached_profile_photo.dart';
import 'package:testfirebase/generated/l10n.dart';

class CustomIndexAppBar extends StatelessWidget {
  const CustomIndexAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
        ),
        Text(
          S.of(context).index,
          style: AppFonts.regular20White,
        ),
        ClipOval(
          child: CachedProfilePhoto(
            radius: 25.r,
            hight: 50.h,
            width: 50.w,
          ),
        ),
      ],
    );
  }
}
