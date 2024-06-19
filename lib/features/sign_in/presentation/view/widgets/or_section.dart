import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testfirebase/core/utils/app_color.dart';
import 'package:testfirebase/core/utils/app_fonts.dart';
import 'package:testfirebase/generated/l10n.dart';

class OrSection extends StatelessWidget {
  const OrSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColor.lightGrey,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            S.of(context).or,
            style: AppFonts.regular20White,
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColor.lightGrey,
          ),
        ),
      ],
    );
  }
}
