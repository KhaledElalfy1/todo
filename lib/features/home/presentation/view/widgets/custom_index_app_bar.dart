import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
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
        Text('Index', style: AppFonts.regular20White),
        CircleAvatar(
          radius: 20.r,
          backgroundColor: AppColor.lightGrey,
        ),
      ],
    );
  }
}
